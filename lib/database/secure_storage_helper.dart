import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nws_huydq_ecommerce_flutter/utils/logger.dart';

import 'share_preferences_helper.dart';

class SecureStorageHelper {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  //Save token
  void saveToken(String accessToken, String refreshToken) async {
    await _storage.write(key: "access_token", value: accessToken);
    await _storage.write(key: "refresh_token", value: refreshToken);
  }

  //Remove token
  void removeToken() async {
    await _storage.delete(key: "access_token");
    SharedPreferencesHelper.removeApiTokenKey();
  }

  //Get token
  Future<String?> getToken() async {
    try {
      final token = await _storage.read(key: "access_token");
      return token;
    } catch (e) {
      logger.e(e);
      return null;
    }
  }
}
