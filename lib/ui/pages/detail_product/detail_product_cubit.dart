
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nws_huydq_ecommerce_flutter/models/detail_categories/product.dart';
import 'package:nws_huydq_ecommerce_flutter/models/enums/load_status.dart';
import 'package:nws_huydq_ecommerce_flutter/models/product_cart/product_cart.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/detail_product/detail_product_navigator.dart';
import 'package:nws_huydq_ecommerce_flutter/utils/logger.dart';

part 'detail_product_state.dart';

class DetailProductCubit extends Cubit<DetailProductState> {
  final DetailProductNavigator navigator;
  final Product product;
  DetailProductCubit({required this.navigator, required this.product})
      : super(DetailProductState(product: product));
  PageController pageController = PageController();
  int currentIndex = 1;
  ProductCart productCart = ProductCart();
  int quantity = 1;

  void setProductCart() {
    productCart.prodcut = product;
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
    emit(state.copyWith(quantity: quantity));
  }

  void subtractQuantity() {
    if (quantity != 0) {
      quantity = quantity - 1;
      emit(state.copyWith(quantity: quantity));
    }
  }

  void addToCart() {
    logger.d(
        "${productCart.colorIndex},${productCart.prodcut!.title},${productCart.sizeIndex}");
  }
}
