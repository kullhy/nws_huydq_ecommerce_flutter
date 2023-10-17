import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nws_huydq_ecommerce_flutter/database/sqlite.dart';
import 'package:nws_huydq_ecommerce_flutter/main.dart';
import 'package:nws_huydq_ecommerce_flutter/models/enums/load_status.dart';
import 'package:nws_huydq_ecommerce_flutter/models/product_cart/product_cart.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/cart/cart_navigator.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartNavigator navigator;

  CartCubit({required this.navigator}) : super(const CartState());

  final dbHelper = DatabaseHelper.instance;

  int totalPrice = 0;

  void getListCart() async {
    emit(state.copyWith(loadStatus: LoadStatus.initial));
    List<ProductCart> productCarts = await dbHelper.getProductCarts(userId);
    for (var productCart in productCarts) {
      await productCart.getProductDetails(dbHelper);
      totalPrice = totalPrice + productCart.totalPrice;
    }
    emit(state.copyWith(
        loadStatus: LoadStatus.success,
        productCarts: productCarts,
        totalPrice: totalPrice));
  }

  //  void addQuantity() {
  //   quantity = quantity + 1;
  //   productCart.quantity = quantity;
  //   productCart.totalPrice = quantity * product.price;
  //   emit(state.copyWith(quantity: quantity));
  // }

  // void subtractQuantity() {
  //   if (quantity != 0) {
  //     quantity = quantity - 1;
  //     productCart.quantity = quantity;
  //     productCart.totalPrice = quantity * product.price;
  //     emit(state.copyWith(quantity: quantity));
  //   }
  // }

  void openProduct(ProductCart productCart) {
    navigator.openDetailProduct(productCart);
  }
}
