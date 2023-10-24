import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_images.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_vector.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_text_styles.dart';
import 'package:nws_huydq_ecommerce_flutter/models/detail_categories/detail_category.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/detail_categories/widgets/product_item.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/detail_categories/detail_category_cubit.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/detail_categories/detail_category_navigator.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/widgets/search_bar/search_bar.dart';

class DetailCategoryPage extends StatelessWidget {
  const DetailCategoryPage({super.key, required this.detailCategory});

  final DetailCategory detailCategory;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return DetailCategoryCubit(
            navigator: DetailCategoryNavigator(context: context),
            detailCategory: detailCategory);
      },
      child: const DetailCategoryView(),
    );
  }
}

class DetailCategoryView extends StatefulWidget {
  const DetailCategoryView({super.key});

  @override
  State<DetailCategoryView> createState() => _DetailCategoryViewState();
}

class _DetailCategoryViewState extends State<DetailCategoryView> {
  late DetailCategoryCubit _detailCategoryCubit;

  @override
  void initState() {
    _detailCategoryCubit = context.read<DetailCategoryCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        _detailCategoryCubit.backToHome(context);
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(child:
            BlocBuilder<DetailCategoryCubit, DetailCategoryState>(
                builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          _detailCategoryCubit.backToHome(context);
                        },
                        child: SvgPicture.asset(
                          AppSVGs.icBack,
                          height: 32,
                          width: 32,
                        ),
                      ),
                      InkWell(
                        onTap: _detailCategoryCubit.openSearchBar,
                        child: state.isSearch
                            ? const Icon(
                                Icons.clear,
                                size: 18,
                              )
                            : SvgPicture.asset(
                                AppSVGs.icSearch,
                                height: 18,
                                width: 18,
                              ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  state.isSearch
                      ? SearchBarWidget(
                          hintText: "Search Product",
                          onChange: (keyword) {
                            _detailCategoryCubit.searchProductByName(keyword);
                          },
                          ontap: () {
                            _detailCategoryCubit.searchProductByName(
                                _detailCategoryCubit
                                    .searchEditingController.text);
                          },
                          textEditingController:
                              _detailCategoryCubit.searchEditingController,
                        )
                      : Container(),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      _detailCategoryCubit.detailCategory.category,
                      style: AppTextStyle.blackS18W800,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  state.products.isNotEmpty
                      ? SingleChildScrollView(
                          child: Container(
                          alignment: Alignment.topLeft,
                          child: Wrap(
                            alignment: WrapAlignment.start,
                            spacing: size.width * 0.2 - 50,
                            runSpacing: 16,
                            children:
                                List.generate(state.products.length, (index) {
                              return ProductItem(
                                product: state.products[index],
                                ontap: () {
                                  state.products[index].category =
                                      _detailCategoryCubit
                                          .detailCategory.category;
                                  _detailCategoryCubit.openDetailProductPage(
                                      state.products[index]);
                                },
                              );
                            }),
                          ),
                        ))
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "OPPS",
                                style: AppTextStyle.blackS24W900,
                              ),
                              Image.asset(
                                AppImages.noProduct,
                                height: 120,
                              )
                            ],
                          ),
                        ),
                ],
              ),
            ),
          );
        })),
      ),
    );
  }
}
