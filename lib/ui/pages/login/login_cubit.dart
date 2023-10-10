import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nws_huydq_ecommerce_flutter/database/share_preferences_helper.dart';
import 'package:nws_huydq_ecommerce_flutter/models/enums/load_status.dart';
import 'package:nws_huydq_ecommerce_flutter/network/api_path.dart';
import 'package:nws_huydq_ecommerce_flutter/network/api_service.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/login/login_navigator.dart';
import 'package:nws_huydq_ecommerce_flutter/utils/logger.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginNavigator navigator;
  LoginCubit({required this.navigator}) : super(const LoginState());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isShowPassWord = false;

  final storage = const FlutterSecureStorage();
  final emailKey = GlobalKey<FormState>();

  void saveOnboardingFlag() {
    SharedPreferencesHelper.setOnboard();
  }

  void showPassWord() {
    isShowPassWord = !isShowPassWord;
    emit(state.copyWith(isShowPassWord: isShowPassWord));
  }

  String? checkEmail(value) {
    if (value == null || value.isEmpty) {
      emit(state.copyWith(isEmail: false));

      return 'Vui lòng nhập địa chỉ email.';
    } else if (!isEmailValid(value)) {
      emit(state.copyWith(isEmail: false));

      return 'Đây không phải là định dạng email hợp lệ.';
    } else {
      emit(state.copyWith(isEmail: true));
    }
    return null; // Hợp lệ
  }

  String? checkPass(value) {
    if (value == null || value.isEmpty) {
      emit(state.copyWith(isPass: false));
      return 'Please enter password';
    } else {
      emit(state.copyWith(isPass: true));
    }
    return null; // Hợp lệ
  }

  Future<void> login() async {
    emit(state.copyWith(loadStatus: LoadStatus.loading));
    var data = json.encode(
        {"email": emailController.text, "password": passwordController.text});
    try {
      Response response =
          await ApiService().postAPI(data, ApiPath.baseUrl + ApiPath.login);
      logger.d(response.statusCode);
      if (response.statusCode == 201) {
        final accessToken = response.data['access_token'];
        final refreshToken = response.data['access_token'];

        await storage.write(key: "access_token", value: accessToken);
        await storage.write(key: "refresh_token", value: refreshToken);
        emit(state.copyWith(loadStatus: LoadStatus.success));

        navigator.openMainPage();
      } else {
        emit(state.copyWith(
            loadStatus: LoadStatus.failure,
            errorMessage: response.statusMessage));
      }
    } catch (e) {
      emit(state.copyWith(
          loadStatus: LoadStatus.failure, errorMessage: e.toString()));
    }
  }

  void openSignUp() {
    navigator.openSignUp();
  }

  bool isEmailValid(String email) {
    final RegExp emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    return emailRegExp.hasMatch(email);
  }
}
