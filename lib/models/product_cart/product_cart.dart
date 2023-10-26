import 'package:nws_huydq_ecommerce_flutter/models/detail_categories/product.dart';

class ProductCart {
  String id = "0";
  int productId;
  int sizeIndex;
  int colorIndex;
  int quantity;
  int userId;
  int totalPrice;
  Product? product;

  ProductCart(
      {this.id = "",
      this.productId = 0,
      this.sizeIndex = 0,
      this.colorIndex = 0,
      this.quantity = 1,
      this.userId = 0,
      this.totalPrice = 0});

  Map<String, dynamic> toJson() => {
        'productId': productId,
        'sizeIndex': sizeIndex,
        'colorIndex': colorIndex,
        'quantity': quantity,
        'userId': userId,
        'totalPrice': totalPrice,
      };

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'productId': productId,
      'sizeIndex': sizeIndex,
      'colorIndex': colorIndex,
      'quantity': quantity,
      'userId': userId,
      'totalPrice': totalPrice,
    };
  }

  
}
