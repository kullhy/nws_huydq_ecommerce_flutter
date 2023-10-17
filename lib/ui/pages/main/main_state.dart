part of 'main_cubit.dart';

class MainState extends Equatable {
  final LoadStatus loadStatus;
  final int curIndex;

  const MainState({
    this.loadStatus = LoadStatus.initial,
    this.curIndex = 0,
  });

  @override
  List<Object?> get props => [
        loadStatus,
        curIndex,
      ];

  MainState copyWith({
    LoadStatus? loadStatus,
    int? curIndex,
  }) {
    return MainState(
      loadStatus: loadStatus ?? this.loadStatus,
      curIndex: curIndex ?? this.curIndex
    );
  }
}
