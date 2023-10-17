part of 'detail_product_cubit.dart';

class DetailProductState extends Equatable {
  final LoadStatus loadStatus;
  final String errorMessage;
  final Product? product;
  final int curIndex;
  final int sizeIndex;
  final int colorIndex;
  final int quantity;

  const DetailProductState({
    this.loadStatus = LoadStatus.initial,
    this.errorMessage = "",
    this.product,
    this.curIndex = 1,
    this.sizeIndex = 0,
    this.colorIndex = 0,
    this.quantity = 1,
  });

  @override
  List<Object?> get props => [
        loadStatus,
        product,
        errorMessage,
        curIndex,
        sizeIndex,
        colorIndex,
        quantity
      ];

  DetailProductState copyWith({
    LoadStatus? loadStatus,
    String? errorMessage,
    Product? product,
    int? curIndex,
    int? sizeIndex,
    int? colorIndex,
    int? quantity,
  }) {
    return DetailProductState(
      loadStatus: loadStatus ?? this.loadStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      product: product ?? this.product,
      curIndex: curIndex ?? this.curIndex,
      sizeIndex: sizeIndex ?? this.sizeIndex,
      colorIndex: colorIndex ?? this.colorIndex,
      quantity: quantity ?? this.quantity,
    );
  }
}
