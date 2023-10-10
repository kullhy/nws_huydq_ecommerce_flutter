part of 'on_boarding_cubit.dart';

class OnBoardingState extends Equatable {
  final int curIndex;

  const OnBoardingState({
    required this.curIndex,
  });

  @override
  List<Object?> get props => [];

  OnBoardingState copyWith({
    int? curIndex,
  }) {
    return OnBoardingState(
      curIndex: curIndex ?? this.curIndex,
    );
  }
}
