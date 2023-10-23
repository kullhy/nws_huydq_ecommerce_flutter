import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nws_huydq_ecommerce_flutter/database/secure_storage_helper.dart';
import 'package:nws_huydq_ecommerce_flutter/main.dart';
import 'package:nws_huydq_ecommerce_flutter/models/enums/load_status.dart';
import 'package:nws_huydq_ecommerce_flutter/models/profile/profile.dart';
import 'package:nws_huydq_ecommerce_flutter/network/api_path.dart';
import 'package:nws_huydq_ecommerce_flutter/network/api_service.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/cart/cart_page.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/check_home/check_home_page.dart';

import 'package:nws_huydq_ecommerce_flutter/ui/pages/notification/noti_page.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/profile/profile_page.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(const MainState());

  Profile profile = Profile();

  int curIndex = 0;

  List<Widget> listPage = [
    const CheckHomeView(),
    const CartPage(),
    const NotiPage(),
    const ProfilePage(),
  ];

  Future<void> getProfile(BuildContext context) async {
    var token = await SecureStorageHelper().getToken();
    emit(state.copyWith(loadStatus: LoadStatus.initial));
    if (token != null) {
      String url = ApiPath.baseUrl + ApiPath.profile;
      Response response = await ApiService().getAPIWithToken(url, token);
      if (response.statusCode == 200) {
        profile = Profile.fromJson(response.data);
        userId = profile.id;
      } else {}
    }
  }

  void changePage(int index) {
    curIndex = index;
    emit(state.copyWith(curIndex: curIndex));
  }
}
