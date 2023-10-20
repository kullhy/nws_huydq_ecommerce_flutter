import 'dart:core';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nws_huydq_ecommerce_flutter/models/categories/category.dart';
import 'package:nws_huydq_ecommerce_flutter/models/detail_categories/detail_category.dart';
import 'package:nws_huydq_ecommerce_flutter/models/enums/load_status.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/detail_categories/detail_category_page.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/home/home_pages.dart';

part 'check_home_state.dart';

class CheckHomeCubit extends Cubit<CheckHomeState> {
  CheckHomeCubit() : super(const CheckHomeState());

  int index = 0;
  bool isHome = true;
  List<DetailCategory> detailCategories = [];
  DetailCategory foundCategory = DetailCategory();

  Widget checkHome() {
    if (isHome) {
      return const HomePage();
    } else {
      return DetailCategoryPage(detailCategory: foundCategory);
    }
  }

  void openDetailCategory(int id) {
    log("check $id");
    isHome = false;
    foundCategory = detailCategories.firstWhere(
      (category) => category.id == id, // Trả về null nếu không tìm thấy
    );
    emit(state.copyWith(loadStatus: LoadStatus.loadingMore));
    // foundCategory = DetailCategory();
  }

  void openHome() {
    isHome = true;
    foundCategory = DetailCategory();
    emit(state.copyWith(loadStatus: LoadStatus.success));
    // foundCategory = DetailCategory();
  }
}
