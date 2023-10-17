import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nws_huydq_ecommerce_flutter/database/secure_storage_helper.dart';
import 'package:nws_huydq_ecommerce_flutter/database/share_preferences_helper.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/splash/splash_navigator.dart';

import 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final SplashNavigator navigator;
  // final AuthRepository authRepo;
  // final AppCubit appCubit;

  SplashCubit({
    required this.navigator,
    // required this.authRepo,
    // required this.appCubit,
  }) : super(const SplashState());

  void checkLogin(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));
    
    String? token = await SecureStorageHelper().getToken();
  

    if (await SharedPreferencesHelper.isOnboardCompleted()) {
      
      if (token != null) {
        navigator.openMainPage();
      } else {
        navigator.openSignInPage();
      }
    } else {
      navigator.openOnboardingPage();
    }
  }
}
