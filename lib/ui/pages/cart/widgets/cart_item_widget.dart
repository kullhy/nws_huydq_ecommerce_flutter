import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_colors.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_images.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_shadow.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_text_styles.dart';
import 'package:nws_huydq_ecommerce_flutter/models/product_cart/product_cart.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/commons/app_dialog.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/cart/cart_cubit.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
    required this.size,
    required this.productCart,
    required this.cartCubit,
  });

  final Size size;
  final ProductCart productCart;
  final CartCubit cartCubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 20, left: 24, right: 24),
        child: InkWell(
          onTap: () {
            cartCubit.openProduct(productCart);
          },
          child: Slidable(
            key: const ValueKey(0),
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              dismissible: null,
              children: [
                SlidableAction(
                  autoClose: true,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12)),
                  onPressed: (BuildContext context) {
                    showAlertDialog(
                        content: "Are you sure you want to delete this cart",
                        context: context,
                        onConfirm: () {
                          cartCubit.deleteProductCart(productCart.id);
                          GoRouter.of(context).pop();
                        },
                        title: 'DELETE CART');
                  },
                  backgroundColor: AppColors.deleteBackground,
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                ),
              ],
            ),
            child: Container(
              height: 100,
              padding: const EdgeInsets.all(8),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [AppShadow.productColor],
                color: Colors.white,
              ),
              child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    productCart.product!.images[0],
                    width: 84,
                    height: 84,
                    fit: BoxFit.cover,
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return Image.asset(
                        AppImages.noImage,
                        width: size.width * 0.4,
                        height: 150,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
                const SizedBox(
                  width: 6,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 2,
                    ),
                    SizedBox(
                      width: size.width * 0.5,
                      child: Text(
                        productCart.product!.title,
                        style: AppTextStyle.blackS14Bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      productCart.product!.category,
                      style: AppTextStyle.tintS10Bold,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    const Spacer(),
                    SizedBox(
                      width: size.width * 0.53,
                      child: Row(
                        children: [
                          Text(
                            r"$" "${productCart.totalPrice}",
                            style: AppTextStyle.blackS14W800,
                          ),
                          const Spacer(),
                          Container(
                            width: 70,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: AppColors.boderLine.withOpacity(0.3),
                            ),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      cartCubit
                                          .subtractQuantity(productCart.id);
                                    },
                                    child: Text(
                                      "−",
                                      style: AppTextStyle.blackS18,
                                    ),
                                  ),
                                  Text(
                                    "${productCart.quantity}",
                                    style: AppTextStyle.blackS14,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      cartCubit.addQuantity(productCart.id);
                                    },
                                    child: Text(
                                      "+",
                                      style: AppTextStyle.blackS18,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                  ],
                ),
                const Spacer(),
              ]),
            ),
          ),
        ));
  }
}
