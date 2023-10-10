import 'package:equatable/equatable.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nws_huydq_ecommerce_flutter/models/detail_categories/detail_category.dart';
import 'package:nws_huydq_ecommerce_flutter/models/enums/load_status.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/detail_categories/detail_category_navigator.dart';

part 'detail_category_state.dart';

class DetailCategoryCubit extends Cubit<DetailCategoryState> {
  final DetailCategoryNavigator navigator;
  final DetailCategory detailCategory;

  DetailCategoryCubit({required this.navigator,required this.detailCategory})
      : super(const DetailCategoryState());

    
}
