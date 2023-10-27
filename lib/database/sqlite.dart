import 'package:nws_huydq_ecommerce_flutter/global/global_data.dart';
import 'package:nws_huydq_ecommerce_flutter/models/detail_categories/product.dart';
import 'package:nws_huydq_ecommerce_flutter/models/notifications/notifications.dart';
import 'package:nws_huydq_ecommerce_flutter/models/product_cart/product_cart.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';



class DatabaseHelper {
  static const String tableProducts = 'products';
  static const String tableProductCarts = 'product_carts';
  static const String tableNotifications = 'notifications';

  // ... (các cột và tên bảng)

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final String databasesPath = await getDatabasesPath();
    final String path = join(databasesPath, 'my_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE IF NOT EXISTS $tableProducts (
            id INTEGER PRIMARY KEY,
            title TEXT,
            price INTEGER,
            description TEXT,
            images TEXT,
            category TEXT
          )
        ''');
        await db.execute('''
          CREATE TABLE IF NOT EXISTS $tableProductCarts (
            id TEXT PRIMARY KEY,
            productId INTEGER,
            sizeIndex INTEGER,
            colorIndex INTEGER,
            quantity INTEGER,
            userId INTEGER,
            totalPrice INTEGER
          )
        ''');
        await db.execute('''
      CREATE TABLE $tableNotifications (
        id INTEGER PRIMARY KEY,
        title TEXT,
        subtitle TEXT,
        image TEXT,
        userId INTEGER,
        createDate TEXT
      )
    ''');
      },
    );
  }

  Future<void> insertProduct(Product product) async {
    final db = await instance.database;

    // Kiểm tra xem sản phẩm có tồn tại trong cơ sở dữ liệu hay không dựa trên ID.
    final existingProducts = await db.query(
      tableProducts,
      where: 'id = ?',
      whereArgs: [product.id],
    );

    if (existingProducts.isEmpty) {
      await db.insert(tableProducts, product.toMap());
    }
  }

  Future<void> insertProductCart(ProductCart productCart) async {
    final db = await instance.database;

    // Kiểm tra xem có ProductCart nào có productId giống hay không.
    final existingProductCarts = await db.query(
      tableProductCarts,
      where: 'productId = ?',
      whereArgs: [productCart.productId],
    );

    if (existingProductCarts.isNotEmpty) {
      for (var cart in existingProductCarts) {
        if (cart['sizeIndex'] == productCart.sizeIndex &&
            cart['colorIndex'] == productCart.colorIndex) {
          // Nếu tìm thấy ProductCart có sizeIndex và colorIndex tương tự,
          // thì cập nhật quantity và totalPrice.
          final updatedQuantity =
              (cart['quantity'] as int) + (productCart.quantity);
          final updatedTotalPrice =
              (cart['totalPrice'] as int) + (productCart.totalPrice);

          await db.update(
            tableProductCarts,
            {
              'quantity': updatedQuantity,
              'totalPrice': updatedTotalPrice,
            },
            where: 'id = ?',
            whereArgs: [cart['id']],
          );

          // Có thể return ở đây nếu bạn không muốn thêm một bản ghi mới.
          return;
        } 
      }
    }
    productCart.id =
        '${productCart.productId}${productCart.sizeIndex}${productCart.colorIndex}';
    await db.insert(tableProductCarts, productCart.toMap());

    // Nếu không tìm thấy ProductCart hoặc không có match với sizeIndex và colorIndex,
    // thêm ProductCart mới.
  }

  // Lấy danh sách sản phẩm trong giỏ hàng
  Future<List<ProductCart>> getProductCarts(int userId) async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query(tableProductCarts);

    final List<ProductCart> productCarts = List.generate(maps.length, (i) {
      return ProductCart(
        id: maps[i]['id'],
        productId: maps[i]['productId'],
        sizeIndex: maps[i]['sizeIndex'],
        colorIndex: maps[i]['colorIndex'],
        quantity: maps[i]['quantity'],
        userId: maps[i]['userId'],
        totalPrice: maps[i]['totalPrice'],
      );
    });

    // Lọc danh sách để chỉ lấy những ProductCart có userId bằng 1.
    final filteredProductCarts = productCarts
        .where((productCart) => productCart.userId == userId)
        .toList();

    return filteredProductCarts;
  }

  Future<void> updateProductCart(ProductCart productCart) async {
    final db = await instance.database;
    await db.update(
      tableProductCarts,
      productCart.toMap(),
      where: 'id = ?',
      whereArgs: [productCart.id],
    );
  }

  Future<List<Product>> getProducts() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query(tableProducts);
    return List.generate(maps.length, (i) {
      return Product(
        id: maps[i]['id'],
        title: maps[i]['title'],
        price: maps[i]['price'],
        description: maps[i]['description'],
        images: maps[i]['images'].split(','),
        category: maps[i]['category'],
      );
    });
  }

  Future<Product?> getProductById(int productId) async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      tableProducts,
      where: 'id = ?',
      whereArgs: [productId],
    );

    if (maps.isNotEmpty) {
      return Product(
        id: maps[0]['id'],
        title: maps[0]['title'],
        price: maps[0]['price'],
        description: maps[0]['description'],
        images: maps[0]['images'].split(','),
        category: maps[0]['category'],
      );
    } else {
      return null;
    }
  }

  // Cập nhật sản phẩm
  Future<void> updateProduct(Product product) async {
    final db = await instance.database;
    await db.update(
      tableProducts,
      product.toMap(),
      where: 'id = ?',
      whereArgs: [product.id],
    );
  }

  // Xóa sản phẩm theo ID
  Future<void> deleteProduct(int id) async {
    final db = await instance.database;
    await db.delete(
      tableProducts,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Xóa tất cả sản phẩm
  Future<void> deleteAllProducts() async {
    final db = await instance.database;
    await db.delete(tableProducts);
  }

  // Xóa sản phẩm trong giỏ hàng theo ID
  Future<void> deleteProductCart(String id) async {
    final db = await instance.database;
    await db.delete(
      tableProductCarts,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Xóa tất cả sản phẩm trong giỏ hàng
  Future<void> deleteAllProductCarts() async {
    final db = await instance.database;
    await db.delete(tableProductCarts);
  }

  Future<int> insertNotification(NotiModel notification) async {
    final db = await instance.database;
    return await db.insert(tableNotifications, notification.toMap());
  }

  // Hàm lấy danh sách tất cả thông báo từ cơ sở dữ liệu
Future<List<NotiModel>> getAllNotifications(int userId) async {
  final db = await instance.database;
  final List<Map<String, dynamic>> maps = await db.query(tableNotifications,where: 'userId = ?',
      whereArgs: [userId],);
  return List.generate(maps.length, (i) {
    return NotiModel.fromMap(maps[i]);
  });
}


  // Hàm cập nhật thông báo trong cơ sở dữ liệu
  Future<int> updateNotification(NotiModel notification) async {
    final db = await instance.database;
    return await db.update(
      tableNotifications,
      notification.toMap(),
      where: 'id = ?',
      whereArgs: [notification.id],
    );
  }

  // Hàm xoá thông báo từ cơ sở dữ liệu
  Future<int> deleteNotification(int id) async {
    final db = await instance.database;
    return await db.delete(
      tableNotifications,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> getQuantityCart() async {
    final dbHelper = DatabaseHelper.instance;
    List<ProductCart> productCarts =
        await dbHelper.getProductCarts(GlobalData.instance.userId);

    GlobalData.instance.quantityCart = productCarts.length;
  }
}
