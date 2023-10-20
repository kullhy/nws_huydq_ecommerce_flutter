part of 'check_home_cubit.dart';

class CheckHomeState extends Equatable {
  final LoadStatus loadStatus;
  final String errorMessage;
  final List<Category> categories;

  const CheckHomeState({
    this.loadStatus = LoadStatus.initial,
    this.errorMessage = "",
    this.categories = const [],
  });

  @override
  List<Object?> get props => [loadStatus, categories, errorMessage];

  CheckHomeState copyWith({
    LoadStatus? loadStatus,
    String? errorMessage,
    List<Category>? categories,
  }) {
    return CheckHomeState(
      loadStatus: loadStatus ?? this.loadStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      categories: categories ?? this.categories,
    );
  }
}
