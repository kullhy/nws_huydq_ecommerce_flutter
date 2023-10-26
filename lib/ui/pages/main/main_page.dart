import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_vector.dart';
import 'package:nws_huydq_ecommerce_flutter/models/bottom_bar_item/bottom_bar_item_model.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/main/main_cubit.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/widgets/bottom_bar/custom_bottom_bar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return MainCubit();
      },
      child: const MainView(),
    );
  }
}

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  late MainCubit _mainCubit;

  @override
  void initState() {
    super.initState();
    _mainCubit = context.read<MainCubit>();
    _mainCubit.getProfile(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return Scaffold(
            bottomNavigationBar: CustomBottomBar(
                listBottomBarItem: [
                  BottomBarItem(
                    iconItem: AppSVGs.icHome,
                    title: 'Home',
                  ),
                  BottomBarItem(
                    iconItem: AppSVGs.icCart,
                    title: 'Cart',
                  ),
                  BottomBarItem(
                    iconItem: AppSVGs.icNoti,
                    title: 'Noti',
                  ),
                  BottomBarItem(
                    iconItem: AppSVGs.icProfile,
                    title: 'Profile',
                  ),
                ],
                onChangePage: (index) {
                  _mainCubit.changePage(index);
                }),
            body: _mainCubit.listPage[state.curIndex]);
      },
    );
  }
}
