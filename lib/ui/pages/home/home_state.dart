part of 'home_cubit.dart';

class HomeState extends Equatable {
  final LoadStatus loadStatus;
  final String errorMessage;
  final List<Category> categories;

  const HomeState({
    this.loadStatus = LoadStatus.initial,
    this.errorMessage = "",
    this.categories = const [],
  });

  @override
  List<Object?> get props => [loadStatus, categories, errorMessage];

  HomeState copyWith({
    LoadStatus? loadStatus,
    String? errorMessage,
    List<Category>? categories,
  }) {
    return HomeState(
      loadStatus: loadStatus ?? this.loadStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      categories: categories ?? this.categories,
    );
  }
}
