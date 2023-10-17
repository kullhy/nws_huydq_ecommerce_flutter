
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_colors.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_images.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_shadow.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_text_styles.dart';
import 'package:nws_huydq_ecommerce_flutter/models/product_cart/product_cart.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/cart/cart_cubit.dart';

class CartItemWidget extends StatefulWidget {
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
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  void doNothing(BuildContext context) {}
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 20, left: 24, right: 24),
        child: InkWell(
          onTap: () {
            widget.cartCubit.openProduct(widget.productCart);
          },
          child: Slidable(
            key: const ValueKey(0),
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              dismissible: DismissiblePane(onDismissed: () {}),
              children: [
                SlidableAction(
                  autoClose: true,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12)),
                  onPressed: doNothing,
                  backgroundColor: const Color(0xFFFE4A49),
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
                    widget.productCart.product!.images[0],
                    width: 84,
                    height: 84,
                    fit: BoxFit.cover,
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return Image.network(
                        AppImages.noImage,
                        width: widget.size.width * 0.4,
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
                      width: widget.size.width * 0.4,
                      child: Text(
                        widget.productCart.product!.title,
                        style: AppTextStyle.blackS14Bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      widget.productCart.product!.category,
                      style: AppTextStyle.tintS10Bold,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    const Spacer(),
                    Text(
                      r"$" "${widget.productCart.totalPrice}",
                      style: AppTextStyle.blackS14W800,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                  ],
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const SizedBox(
                          width: 2,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "−",
                            style: AppTextStyle.blackS18,
                          ),
                        ),
                        Text(
                          "${widget.productCart.quantity}",
                          style: AppTextStyle.blackS14,
                        ),
                        InkWell(
                          onTap: () {},
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
              ]),
            ),
          ),
        ));
  }
}
