import 'dart:async';
import 'dart:developer';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nws_huydq_ecommerce_flutter/blocs/app_cubit.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_string.dart';
import 'package:nws_huydq_ecommerce_flutter/database/sqlite.dart';
import 'package:nws_huydq_ecommerce_flutter/global/global_data.dart';
import 'package:nws_huydq_ecommerce_flutter/models/detail_categories/product.dart';
import 'package:nws_huydq_ecommerce_flutter/models/enums/load_status.dart';
import 'package:nws_huydq_ecommerce_flutter/models/notifications/notifications.dart';
import 'package:nws_huydq_ecommerce_flutter/models/product_cart/product_cart.dart';
import 'package:nws_huydq_ecommerce_flutter/service/firebase_api.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/detail_product/detail_product_navigator.dart';


part 'detail_product_state.dart';

class DetailProductCubit extends Cubit<DetailProductState> {
  final DetailProductNavigator navigator;
  final Product product;
  final ProductCart? productCartRe;
  DatabaseReference notiRef = FirebaseDatabase.instance.ref('isNoti');
  DatabaseReference tokenRef = FirebaseDatabase.instance.ref('token');

  late AnimationController addToCartPopUpAnimationController;

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
    log(FireBaseApi.fCMToken);
    tokenRef.set(FireBaseApi.fCMToken);
    // ignore: use_build_context_synchronously
    context.read<AppCubit>().getQuantityCart();
    emit(state.copyWith(loadStatus: LoadStatus.loadingMore));
    emit(state.copyWith(loadStatus: LoadStatus.success));
    notiRef.set(true);
    addToCartPopUpAnimationController.forward();

    Timer(const Duration(seconds: 5), () {
      addToCartPopUpAnimationController.reverse();
      notiRef.set(false);
    });

    NotiModel notiModel = NotiModel(
      id: product.id,
      createDate: DateTime.now(),
      image: product.images[0],
      title: product.title,
      subTitle: AppString().subTitle(product.title),
    );

    dbHelper.insertNotification(notiModel);
  }


  void setProductCart() {
    productCart.productId = product.id;
    productCart.totalPrice = product.price;
    productCart.userId = GlobalData.instance.userId;
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
