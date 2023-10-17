import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nws_huydq_ecommerce_flutter/blocs/app_cubit.dart';
import 'package:nws_huydq_ecommerce_flutter/database/sqlite.dart';
import 'package:nws_huydq_ecommerce_flutter/main.dart';
import 'package:nws_huydq_ecommerce_flutter/models/detail_categories/product.dart';
import 'package:nws_huydq_ecommerce_flutter/models/enums/load_status.dart';
import 'package:nws_huydq_ecommerce_flutter/models/product_cart/product_cart.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/detail_product/detail_product_navigator.dart';
import 'package:nws_huydq_ecommerce_flutter/utils/logger.dart';

part 'detail_product_state.dart';

class DetailProductCubit extends Cubit<DetailProductState> {
  final DetailProductNavigator navigator;
  final Product product;
  final ProductCart? productCartRe;

  DetailProductCubit(
      {required this.navigator, required this.product, this.productCartRe})
      : super(DetailProductState(product: product)) {
    checkProductCart();
  }

  PageController pageController = PageController();
  int currentIndex = 1;
  ProductCart productCart = ProductCart();
  int quantity = 1;
  bool isCart = false;

  final dbHelper = DatabaseHelper.instance;

  checkProductCart() {
    if (productCartRe != null) {
      productCart = productCart;
      emit(state.copyWith(loadStatus: LoadStatus.success));
    }
  }

  Future<void> addCart(BuildContext context) async {
    productCart.id = "${product.id}1";
    await dbHelper.insertProduct(product);
    await dbHelper.insertProductCart(productCart);
    isCart = true;
    // ignore: use_build_context_synchronously
    context.read<AppCubit>().getQuantityCart();
    emit(state.copyWith(loadStatus: LoadStatus.loadingMore));
    emit(state.copyWith(loadStatus: LoadStatus.success));
  }

  void getData() async {
    try {
      List<ProductCart> productCarts = await dbHelper.getProductCarts(userId);
      logger.d(productCarts[0].sizeIndex);
    } catch (e) {
      logger.e(e);
    }
  }

  void setProductCart() {
    productCart.productId = product.id;
    productCart.totalPrice = product.price;
    productCart.userId = userId;
  }

  void onChangedPage(value) {
    currentIndex = value;
    emit(state.copyWith(curIndex: currentIndex));
  }

  void onSelectSize(index) {
    productCart.sizeIndex = index;
    emit(state.copyWith(sizeIndex: index));
  }

  void onSelectColor(index) {
    productCart.colorIndex = index;
    emit(state.copyWith(colorIndex: index));
  }

  void addQuantity() {
    quantity = quantity + 1;
    productCart.quantity = quantity;
    productCart.totalPrice = quantity * product.price;
    emit(state.copyWith(quantity: quantity));
  }

  void subtractQuantity() {
    if (quantity != 0) {
      quantity = quantity - 1;
      productCart.quantity = quantity;
      productCart.totalPrice = quantity * product.price;
      emit(state.copyWith(quantity: quantity));
    }
  }

  void openCartPage() {
    navigator.openCartPage();
  }
}
