import 'package:flutter/cupertino.dart';

import 'package:go_router/go_router.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_navigator.dart';
import 'package:nws_huydq_ecommerce_flutter/models/detail_categories/product.dart';
import 'package:nws_huydq_ecommerce_flutter/router/router_config.dart';

class DetailCategoryNavigator extends AppNavigator {
  DetailCategoryNavigator({required BuildContext context})
      : super(context: context);

  void openDetailProduct(Product product) {
    GoRouter.of(context).pushReplacementNamed(AppRouter.product,extra: product);
  }
}
