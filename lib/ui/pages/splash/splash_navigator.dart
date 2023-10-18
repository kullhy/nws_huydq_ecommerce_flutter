import 'package:flutter/cupertino.dart';

import 'package:go_router/go_router.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_navigator.dart';
import 'package:nws_huydq_ecommerce_flutter/router/router_config.dart';

class SplashNavigator extends AppNavigator {
  SplashNavigator({required BuildContext context}) : super(context: context);

  void openSignInPage() {
    GoRouter.of(context).pushReplacementNamed(AppRouter.login);
  }

  void openMainPage() {
    GoRouter.of(context).pushReplacementNamed(AppRouter.main);
  }

  void openOnboardingPage() {
    GoRouter.of(context).pushReplacementNamed(AppRouter.onBoarding);
  }
}
