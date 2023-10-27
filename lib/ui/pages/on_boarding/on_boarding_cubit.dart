import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:go_router/go_router.dart';
import 'package:nws_huydq_ecommerce_flutter/router/router_config.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(const OnBoardingState());

  PageController pageController = PageController();
  int curIndex = 0;

  void onPageChange(int index) {
    curIndex = index;
    emit(state.copyWith(curIndex: curIndex));
  }

  void nextPage(BuildContext context) {
    if (state.curIndex == 2) {
      GoRouter.of(context).pushReplacementNamed(AppRouter.login);
    } else {
      curIndex = curIndex + 1;
      pageController.nextPage(
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
      emit(state.copyWith(curIndex: curIndex));
    }
  }
}
