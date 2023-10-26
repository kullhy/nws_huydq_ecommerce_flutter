import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nws_huydq_ecommerce_flutter/database/sqlite.dart';
import 'package:nws_huydq_ecommerce_flutter/global/global_data.dart';
import 'package:nws_huydq_ecommerce_flutter/models/enums/load_status.dart';
import 'package:nws_huydq_ecommerce_flutter/models/product_cart/product_cart.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState());

  Future<void> getQuantityCart() async {
    final dbHelper = DatabaseHelper.instance;
    List<ProductCart> productCarts =
        await dbHelper.getProductCarts(GlobalData.instance.userId);

    GlobalData.instance.quantityCart = productCarts.length;
  }
}
