
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';


part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit()
      : super(const OnBoardingState(
            curIndex: 0, ));

  void changeIndex(int index) async {
    // emit(state.copyWith(loadDataStatus: LoadStatus.loading));
    emit(state.copyWith( curIndex: index));

    // emit(state.copyWith(loadDataStatus: LoadStatus.failure));
  }
}
