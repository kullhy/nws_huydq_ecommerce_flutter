import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nws_huydq_ecommerce_flutter/database/secure_storage_helper.dart';
import 'package:nws_huydq_ecommerce_flutter/models/enums/load_status.dart';
import 'package:nws_huydq_ecommerce_flutter/network/api_path.dart';
import 'package:nws_huydq_ecommerce_flutter/network/api_service.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/sign_up/sign_up_navigator.dart';
import 'package:nws_huydq_ecommerce_flutter/utils/logger.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
part 'sign_up_state.dart';

String email = "";
String passWord = "";

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpNavigator navigator;
  SignUpCubit({required this.navigator}) : super(const SignUpState());

  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  bool isShowPassWord = false;
  bool isShowConfirmPassWord = false;
  bool isAccept = false;
  bool isTruePassWord = false;

  final storage = const FlutterSecureStorage();
  final emailKey = GlobalKey<FormState>();
  final userNameKey = GlobalKey<FormState>();

  void showPassWord() {
    isShowPassWord = !isShowPassWord;
    emit(state.copyWith(isShowPassWord: isShowPassWord));
  }

  void showConfirmPassWord() {
    isShowConfirmPassWord = !isShowConfirmPassWord;
    emit(state.copyWith(isShowConfirmPassWord: isShowConfirmPassWord));
  }

  String? checkEmail(value) {
    if (value == null || value.isEmpty) {
      emit(state.copyWith(isEmail: false));

      return 'Please enter email address.';
    } else if (!isEmailValid(value)) {
      emit(state.copyWith(isEmail: false));

      return 'This is not a valid email format.';
    } else {
      emit(state.copyWith(isEmail: true));
    }
    return null;
  }

  String? checkUser(value) {
    if (value == null || value.isEmpty) {
      emit(state.copyWith(isUserName: false));
      return 'Please enter user name';
    } else {
      emit(state.copyWith(isUserName: true));
    }
    return null;
  }

  String? checkPass(value) {
    if (value == null || value.isEmpty) {
      emit(state.copyWith(isPass: false));
      return 'Please enter password';
    } else {
      emit(state.copyWith(isPass: true));
    }
    return null;
  }

  String? checkTrueConfirmPass(value) {
    if (value == null || value.isEmpty) {
      emit(state.copyWith(isEmail: false));
      return 'Please enter confirm password';
    } else if (value != passwordController.text) {
      emit(state.copyWith(isTrueConfirmPass: false));
      return 'The confirmation password is incorrect';
    } else {
      emit(state.copyWith(isTrueConfirmPass: true));
    }
    return null;
  }

  Future<void> signUp() async {
    emit(state.copyWith(loadStatus: LoadStatus.loading));
    var data = json.encode({
      "name": userNameController.text,
      "email": emailController.text,
      "password": passwordController.text,
      "avatar":
          "https://www.nicepng.com/png/full/933-9332131_profile-picture-default-png.png"
    });
    email = emailController.text;
    passWord = passwordController.text;
    log(data);
    try {
      Response response =
          await ApiService().postAPI(data, ApiPath.baseUrl + ApiPath.signUp);
      if (response.statusCode == 201) {
        navigator.openSuccessfulPage();
        emit(state.copyWith(loadStatus: LoadStatus.success));
      } else {
        final errorMessage = response.data['message'];
        emit(state.copyWith(
            loadStatus: LoadStatus.failure, errorMessage: errorMessage[0]));
      }
    } catch (e) {
      emit(state.copyWith(
          loadStatus: LoadStatus.failure, errorMessage: e.toString()));
    }
  }

  Future<void> login() async {
    emit(state.copyWith(loadStatus: LoadStatus.loading));
    var data = json.encode({"email": email, "password": passWord});
    try {
      Response response =
          await ApiService().postAPI(data, ApiPath.baseUrl + ApiPath.login);
      logger.d(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final accessToken = response.data['access_token'];
        final refreshToken = response.data['refresh_token'];

        SecureStorageHelper().saveToken(accessToken, refreshToken);
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

  bool? checkAccept(value) {
    isAccept = value;
    emit(state.copyWith(isAccept: isAccept));
    return null;
  }

  void openSignUp() {
    navigator.openSignInPage();
  }

  Future<void> openMainPage() async {
    await login();
    navigator.openMainPage();
  }

  bool isEmailValid(String email) {
    final RegExp emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    return emailRegExp.hasMatch(email);
  }
}
