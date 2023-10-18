import 'package:flutter/cupertino.dart';

import 'package:go_router/go_router.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_navigator.dart';
import 'package:nws_huydq_ecommerce_flutter/router/router_config.dart';

class LoginNavigator extends AppNavigator {
  LoginNavigator({required BuildContext context}) : super(context: context);

  void openSignUp() {
    GoRouter.of(context).pushReplacementNamed(AppRouter.signUp);
  }

  void openMainPage() {
    GoRouter.of(context).pushReplacementNamed(AppRouter.main);
  }
}
