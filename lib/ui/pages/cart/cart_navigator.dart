import 'dart:developer';

import 'package:flutter/cupertino.dart';

import 'package:go_router/go_router.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_navigator.dart';
import 'package:nws_huydq_ecommerce_flutter/models/detail_categories/product.dart';
import 'package:nws_huydq_ecommerce_flutter/models/product_cart/product_cart.dart';
import 'package:nws_huydq_ecommerce_flutter/router/router_config.dart';

class CartNavigator extends AppNavigator {
  CartNavigator({required BuildContext context}) : super(context: context);

  Future<bool> openDetailProduct(ProductCart productCart) async {
    Product product = productCart.product!;
    bool result = await GoRouter.of(context).pushNamed(AppRouter.product,
        extra: {'product': product, 'productCart': productCart}) as bool;
    log(result.toString());
    return result;
  }

  void openMainPage() {
    GoRouter.of(context).pushReplacementNamed(AppRouter.main);
  }
}
