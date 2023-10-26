part of 'app_cubit.dart';

class AppState extends Equatable {
  final LoadStatus fetchProfileStatus;

  const AppState({
    this.fetchProfileStatus = LoadStatus.initial,
  });

  AppState copyWith({
    LoadStatus? fetchProfileStatus,
  }) {
    return AppState(
      fetchProfileStatus: fetchProfileStatus ?? this.fetchProfileStatus,
    );
  }

  @override
  List<Object?> get props => [
        fetchProfileStatus,
      ];
}
