import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nws_huydq_ecommerce_flutter/models/detail_categories/detail_category.dart';
import 'package:nws_huydq_ecommerce_flutter/models/detail_categories/product.dart';
import 'package:nws_huydq_ecommerce_flutter/models/enums/load_status.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/detail_categories/detail_category_navigator.dart';

part 'detail_category_state.dart';

class DetailCategoryCubit extends Cubit<DetailCategoryState> {
  final DetailCategoryNavigator navigator;
  final DetailCategory detailCategory;

  DetailCategoryCubit({required this.navigator, required this.detailCategory})
      : super(DetailCategoryState(products: detailCategory.products));

  bool isSearch = false;
  TextEditingController searchEditingController = TextEditingController();

  void openSearchBar() {
    isSearch = !isSearch;
    emit(state.copyWith(isSearch: isSearch));
  }

  void openDetailProductPage(Product product) {
    navigator.openDetailProduct(product);
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
