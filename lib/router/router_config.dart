import 'package:flutter/material.dart';
import 'package:nws_huydq_ecommerce_flutter/models/detail_categories/detail_category.dart';
import 'package:nws_huydq_ecommerce_flutter/models/detail_categories/product.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/detail_categories/detail_category_page.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/detail_product/detail_product_page.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/login/login_page.dart';

import 'package:nws_huydq_ecommerce_flutter/ui/pages/main/main_page.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/on_boarding/on_boarding_page.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/sign_up/sign_up_page.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/sign_up/successful_page.dart';
import '../ui/pages/splash/splash_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter._();
  static final navigationKey = GlobalKey<NavigatorState>();
  static final GoRouter router = GoRouter(
    routes: _routes,
    debugLogDiagnostics: true,
    navigatorKey: navigationKey,
  );

  ///main page
  static const String splash = "/";
  static const String onBoarding = "onBoarding";
  static const String main = "main";
  static const String login = "Login";
  static const String signUp = "SignUp";
  static const String signUpSuccessful = "signUpSuccessful";
  static const String detailCategory = "detailCategory";
  static const String product = "product";

  // GoRouter configuration
  static final _routes = <RouteBase>[
    GoRoute(path: splash, builder: (context, state) => const SplashPage()),
    GoRoute(
      name: main,
      path: "/$main",
      builder: (context, state) => const MainPage(),
    ),
    GoRoute(
      name: login,
      path: "/$login",
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      name: signUp,
      path: "/$signUp",
      builder: (context, state) => const SignUpPage(),
    ),
    GoRoute(
      name: onBoarding,
      path: "/$onBoarding",
      builder: (context, state) => const OnBoardingPage(),
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const OnBoardingPage(),
      ),
    ),
    GoRoute(
      name: signUpSuccessful,
      path: "/$signUpSuccessful",
      builder: (context, state) => const SuccessfulPage(),
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const SuccessfulPage(),
      ),
    ),
    GoRoute(
      name: detailCategory,
      path: "/$detailCategory",
      builder: (context, state) {
        DetailCategory detailCategory = state.extra as DetailCategory;
        return DetailCategoryPage(
          detailCategory: detailCategory,
        );
      },
    ),
    GoRoute(
      name: product,
      path: "/$product",
      builder: (context, state) {
        Product product = state.extra as Product;
        return DetailProductPage(
          product: product,
        );
      },
    ),
  ];
}

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
      transitionDuration: const Duration(seconds: 1),
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeInCirc).animate(animation),
          child: child,
        );
      });
}
