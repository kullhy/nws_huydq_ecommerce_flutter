import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nws_huydq_ecommerce_flutter/models/detail_categories/detail_category.dart';
import 'package:nws_huydq_ecommerce_flutter/models/detail_categories/product.dart';
import 'package:nws_huydq_ecommerce_flutter/models/enums/load_status.dart';
import 'package:nws_huydq_ecommerce_flutter/network/api_path.dart';
import 'package:nws_huydq_ecommerce_flutter/network/api_service.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/check_home/check_home_cubit.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/detail_categories/detail_category_navigator.dart';

part 'detail_category_state.dart';

class DetailCategoryCubit extends Cubit<DetailCategoryState> {
  final DetailCategoryNavigator navigator;
  final DetailCategory detailCategory;

  DetailCategoryCubit({required this.navigator, required this.detailCategory})
      : super(DetailCategoryState(products: detailCategory.products));

  bool isSearch = false;
  TextEditingController searchEditingController = TextEditingController();
  int loadIdex = 1;

  Future<void> loadmore() async {
    emit(state.copyWith(loadStatus: LoadStatus.loadingMore));
    loadIdex += 1;
    Response response = await ApiService().getAPI(ApiPath().getListProduct(
        detailCategory.id)); // Gọi API để lấy danh sách sản phẩm dựa trên ID.
    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      List<Product> products =
          data.map((json) => Product.fromJson(json)).toList();
      detailCategory.products = products;
      emit(state.copyWith(loadStatus: LoadStatus.success));
    } else {
      // Xử lý lỗi nếu cần.
    }
  }

  void openSearchBar() {
    isSearch = !isSearch;
    emit(state.copyWith(isSearch: isSearch));
  }

  void openDetailProductPage(Product product) {
    navigator.openDetailProduct(product);
  }

  void backToHome(BuildContext context) {
    context.read<CheckHomeCubit>().openHome();
  }

  void searchProductByName(String keyword) {
    List<Product> products = detailCategory.products;
    // String keyword = searchEditingController.text;
    List<Product> searchResults = [];

    for (Product product in products) {
      if (product.title.toLowerCase().contains(keyword.toLowerCase())) {
        searchResults.add(product);
      }
    }
    emit(state.copyWith(
        loadStatus: LoadStatus.loadingMore, products: searchResults));
  }
}
