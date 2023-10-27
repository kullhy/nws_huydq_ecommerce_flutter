part of 'on_boarding_cubit.dart';

class OnBoardingState extends Equatable {
  final int curIndex;

  const OnBoardingState({
     this.curIndex = 0,
  }
  );

  @override
  List<Object?> get props => [curIndex];

  OnBoardingState copyWith({
    int? curIndex,
  }) {
    return OnBoardingState(
      curIndex: curIndex ?? this.curIndex,
    );
  }
}
