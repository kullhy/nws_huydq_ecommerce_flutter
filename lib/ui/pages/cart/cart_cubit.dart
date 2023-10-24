import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nws_huydq_ecommerce_flutter/database/sqlite.dart';
import 'package:nws_huydq_ecommerce_flutter/global/global_data.dart';
import 'package:nws_huydq_ecommerce_flutter/models/enums/load_status.dart';
import 'package:nws_huydq_ecommerce_flutter/models/product_cart/product_cart.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/cart/cart_navigator.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartNavigator navigator;

  CartCubit({required this.navigator}) : super(const CartState());

  final dbHelper = DatabaseHelper.instance;
  List<ProductCart> productCarts = [];

  int totalPrice = 0;

  void getListCart() async {
    emit(state.copyWith(loadStatus: LoadStatus.initial));
    productCarts = await dbHelper.getProductCarts(GlobalData.instance.userId);
    for (var productCart in productCarts) {
      await productCart.getProductDetails(dbHelper);
      totalPrice = totalPrice + productCart.totalPrice;
    }
    emit(state.copyWith(
        loadStatus: LoadStatus.success,
        productCarts: productCarts,
        totalPrice: totalPrice));
  }

  Future<void> addQuantity(String productCartId) async {
    emit(state.copyWith(loadStatus: LoadStatus.loadingMore));
    for (int i = 0; i < productCarts.length; i++) {
      if (productCarts[i].id == productCartId) {
        productCarts[i].quantity = productCarts[i].quantity + 1;
        totalPrice = totalPrice + productCarts[i].product!.price;
        productCarts[i].totalPrice =
            productCarts[i].quantity * productCarts[i].product!.price;
        dbHelper.updateProductCart(productCarts[i]);
      }
    }
    emit(state.copyWith(
        loadStatus: LoadStatus.loadingMore, totalPrice: totalPrice));
  }

  Future<void> subtractQuantity(String productCartId) async {
    emit(state.copyWith(loadStatus: LoadStatus.loadingMore));
    for (int i = 0; i < productCarts.length; i++) {
      if (productCarts[i].id == productCartId) {
        if (productCarts[i].quantity > 0) {
          productCarts[i].quantity = productCarts[i].quantity - 1;
          totalPrice = totalPrice - productCarts[i].product!.price;
          productCarts[i].totalPrice =
              productCarts[i].quantity * productCarts[i].product!.price;
          dbHelper.updateProductCart(productCarts[i]);
        }
      }
      if (productCarts[i].quantity == 0) {
        dbHelper.deleteProductCart(productCartId);
        productCarts =
            await dbHelper.getProductCarts(GlobalData.instance.userId);
        getListCart();
      }
    }
    emit(
        state.copyWith(loadStatus: LoadStatus.success, totalPrice: totalPrice));
  }

  void findProductCartById(String productCartId) {}

  void openProduct(ProductCart productCart) async {
    bool check = await navigator.openDetailProduct(productCart);
    if (check) {
      getListCart();
    }
  }

    void doNothing(BuildContext context) {}

}
