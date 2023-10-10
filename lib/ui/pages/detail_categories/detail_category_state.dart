part of 'detail_category_cubit.dart';

class DetailCategoryState extends Equatable {
  final LoadStatus loadStatus;
  final String errorMessage;


  const DetailCategoryState({
    this.loadStatus = LoadStatus.initial,
    this.errorMessage = "",
  });

  @override
  List<Object?> get props => [loadStatus, errorMessage];

  DetailCategoryState copyWith({
    LoadStatus? loadStatus,
    String? errorMessage,
  }) {
    return DetailCategoryState(
      loadStatus: loadStatus ?? this.loadStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
