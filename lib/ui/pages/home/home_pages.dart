import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_vector.dart';
import 'package:nws_huydq_ecommerce_flutter/models/enums/load_status.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/error/error_page.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/home/widgets/categories_item_widget.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/home/home_cubit.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/home/home_navigator.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/widgets/search_bar/search_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return HomeCubit(navigator: HomeNavigator(context: context));
      },
      child: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeCubit _homeCubit;

  @override
  void initState() {
    super.initState();
    _homeCubit = context.read<HomeCubit>();

    log("check ");
    _homeCubit.getAllCategories(context);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state.loadStatus == LoadStatus.failure) {
                  return ErrorPage(
                    textButton: "RELOAD",
                    errorMessage:
                        "Could not get Category information, please check again",
                    icon: Icons.replay_rounded,
                    onPress: () {
                      _homeCubit.getAllCategories(context);
                    },
                  );
                } else {
                  return Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: SvgPicture.asset(
                          AppSVGs.icBack,
                          height: 36,
                          width: 36,
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      SearchBarWidget(
                        onChange: (keyword) {
                          _homeCubit.searchCategoriesByName(keyword);
                        },
                        ontap: () {
                          _homeCubit.searchCategoriesByName(
                              _homeCubit.searchEditingController.text);
                        },
                        textEditingController:
                            _homeCubit.searchEditingController,
                        
                        hintText: 'search_categoty'.tr,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SingleChildScrollView(
                        child: state.loadStatus == LoadStatus.loading
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : Container(
                                alignment: Alignment.topLeft,
                                child: Wrap(
                                  alignment: WrapAlignment.start,
                                  spacing: size.width * 0.2 - 50,
                                  runSpacing: 16,
                                  children: List.generate(
                                    state.categories.length,
                                    (index) {
                                      return CategoriesItem(
                                        ontap: () {
                                          _homeCubit.openDetailCategory(
                                              state.categories[index].id,
                                              context);
                                        },
                                        id: state.categories[index].id,
                                        itemImage:
                                            state.categories[index].image,
                                        itemName: state.categories[index].name,
                                        quantity:
                                            state.categories[index].quantity,
                                      );
                                    },
                                  ),
                                ),
                              ),
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
