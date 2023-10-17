part of 'cart_cubit.dart';

class CartState extends Equatable {
  final LoadStatus loadStatus;
  final List<ProductCart> productCarts;
  final int totalPrice;

  const CartState(
      {this.loadStatus = LoadStatus.initial,
      this.productCarts = const [],
      this.totalPrice = 0});

  @override
  List<Object?> get props => [
        loadStatus,
        productCarts,
        totalPrice,
      ];

  CartState copyWith({
    LoadStatus? loadStatus,
    List<ProductCart>? productCarts,
    int? totalPrice,
  }) {
    return CartState(
      loadStatus: loadStatus ?? this.loadStatus,
      productCarts: productCarts ?? this.productCarts,
      totalPrice: totalPrice?? this.totalPrice,
    );
  }
}
