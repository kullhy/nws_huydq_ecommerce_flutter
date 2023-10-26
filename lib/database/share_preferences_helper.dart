import 'package:nws_huydq_ecommerce_flutter/global/global_data.dart';
import 'package:nws_huydq_ecommerce_flutter/utils/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static const _introKey = '_introKey';

  static const _authKey = '_authKey';

  static const _cartIdKey = "cartIdKey";

  static const _didOnboardKey = 'onBoardingFlag';

  static const _isNoti = 'isNoti';

  //Get onboard
  static Future<bool> isOnboardCompleted() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getBool(_didOnboardKey) ?? false;
    } catch (e) {
      return false;
    }
  }

  //Set onboard
  static Future<void> setOnboard({onBoard = true}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_didOnboardKey, onBoard ?? true);
  }

  //Get onboard
  static Future<void> getIsNoti() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      GlobalData.instance.isNoti = prefs.getBool(_isNoti) ?? false;
    } catch (e) {
      GlobalData.instance.isNoti = true;
    }
  }

  //Set onboard
  static Future<void> setIsNoti(bool isNoti) async {
    GlobalData.instance.isNoti = isNoti;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isNoti, GlobalData.instance.isNoti);
  }

  //Get authKey
  static Future<int> getCartId() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getInt(_cartIdKey) ?? 0;
    } catch (e) {
      logger.e(e);
      return 0;
    }
  }

  //Set authKey
  static void setCartId(int cartId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_cartIdKey, cartId);
  }

  static void removeApiTokenKey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_authKey);
  }

  //Get intro
  static Future<bool> isSeenIntro() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getBool(_introKey) ?? false;
    } catch (e) {
      logger.e(e);
      return false;
    }
  }

  //Set intro
  static void setSeenIntro({isSeen = true}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_introKey, isSeen ?? true);
  }
}
