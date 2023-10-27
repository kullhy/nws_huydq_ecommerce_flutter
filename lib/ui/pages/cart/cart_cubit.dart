import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:nws_huydq_ecommerce_flutter/database/sqlite.dart';
import 'package:nws_huydq_ecommerce_flutter/global/global_data.dart';
import 'package:nws_huydq_ecommerce_flutter/models/enums/load_status.dart';
import 'package:nws_huydq_ecommerce_flutter/models/product_cart/product_cart.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/commons/app_dialog.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/cart/cart_navigator.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartNavigator navigator;

  CartCubit({required this.navigator}) : super(const CartState());

  final dbHelper = DatabaseHelper.instance;
  List<ProductCart> productCarts = [];

  int totalPrice = 0;

  void getListCart() async {
    totalPrice = 0;

    emit(state.copyWith(loadStatus: LoadStatus.loading));
    productCarts = await dbHelper.getProductCarts(GlobalData.instance.userId);
    for (var productCart in productCarts) {
      productCart.product =
          await dbHelper.getProductById(productCart.productId);
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
        productCarts[i].quantity += 1;
        totalPrice = totalPrice + productCarts[i].product!.price;
        productCarts[i].totalPrice =
            productCarts[i].quantity * productCarts[i].product!.price;
        dbHelper.updateProductCart(productCarts[i]);
      }
    }
    emit(state.copyWith(
        loadStatus: LoadStatus.loadingMore, totalPrice: totalPrice));
  }

  Future<void> subtractQuantity(
      String productCartId, BuildContext context) async {
    emit(state.copyWith(loadStatus: LoadStatus.loadingMore));
    for (int i = 0; i < productCarts.length; i++) {
      if (productCarts[i].id == productCartId) {
        if (productCarts[i].quantity > 1) {
          productCarts[i].quantity -= 1;
          totalPrice = totalPrice - productCarts[i].product!.price;
          productCarts[i].totalPrice =
              productCarts[i].quantity * productCarts[i].product!.price;
          dbHelper.updateProductCart(productCarts[i]);
        } else if (productCarts[i].quantity == 1) {
          showAlertDialog(
              context: context,
              content: 'confirm_delete'.tr,
              onConfirm: () async {
                dbHelper.deleteProductCart(productCartId);
                productCarts =
                    await dbHelper.getProductCarts(GlobalData.instance.userId);
                getListCart();
              },title: 'delete_cart'.tr);
              
        }
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

  void deleteProductCart(String cartId) {
    dbHelper.deleteProductCart(cartId);
    getListCart();
  }

  void doNothing(BuildContext context) {}
}
