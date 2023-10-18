import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nws_huydq_ecommerce_flutter/database/sqlite.dart';
import 'package:nws_huydq_ecommerce_flutter/main.dart';
import 'package:nws_huydq_ecommerce_flutter/models/product_cart/product_cart.dart';

import '../models/enums/load_status.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState());

  Future<void> getQuantityCart() async {
    while (userId == 0) {
      // nếu userId == 0 thì chờ 4s
      await Future.delayed(const Duration(seconds: 3));
      getQuantityCart();
    }

    final dbHelper = DatabaseHelper.instance;
    List<ProductCart> productCarts = await dbHelper.getProductCarts(userId);

    quantityCart = productCarts.length;
    log("check");
  }
}
