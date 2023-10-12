part of 'detail_category_cubit.dart';

class DetailCategoryState extends Equatable {
  final LoadStatus loadStatus;
  final String errorMessage;
  final List<Product> products;
  final bool isSearch;

  const DetailCategoryState({
    this.loadStatus = LoadStatus.initial,
    this.errorMessage = "",
    this.products = const [],
    this.isSearch = false,
  });

  @override
  List<Object?> get props => [loadStatus, errorMessage, products,isSearch];

  DetailCategoryState copyWith({
    LoadStatus? loadStatus,
    String? errorMessage,
    List<Product>? products,
    bool? isSearch,
  }) {
    return DetailCategoryState(
      loadStatus: loadStatus ?? this.loadStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      products: products ?? this.products,
      isSearch: isSearch?? this.isSearch,
    );
  }
}
