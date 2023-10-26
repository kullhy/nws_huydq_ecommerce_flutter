import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_colors.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_shadow.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_vector.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_text_styles.dart';
import 'package:nws_huydq_ecommerce_flutter/models/enums/load_status.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/detail_product/detail_product_cubit.dart';

class ProductInfoWidget extends StatelessWidget {
  ProductInfoWidget({
    super.key,
    required this.size,
    required this.detailProductCubit,
  });

  final Size size;
  final DetailProductCubit detailProductCubit;
  final List<String> sizes = ["S", "M", "L", "XL", "XXL"];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailProductCubit, DetailProductState>(
      builder: (context, state) {
        var product = state.product!;
        return Stack(
          children: [
            Container(
              height: size.height * 0.5,
              width: size.width,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                  )),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: AppTextStyle.blackS18W700,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      product.category,
                      style: AppTextStyle.tintS10,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Wrap(
                          alignment: WrapAlignment.start,
                          spacing: 0,
                          runSpacing: 4,
                          children: List.generate(5, (index) {
                            return const Icon(Icons.star,
                                size: 16, color: AppColors.star);
                          }),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          "(320 Review)",
                          style: AppTextStyle.blackS12Bold,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      "Size",
                      style: AppTextStyle.blackS16W800,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Wrap(
                      alignment: WrapAlignment.start,
                      spacing: 10,
                      runSpacing: 4,
                      children: List.generate(5, (index) {
                        return InkWell(
                          onTap: () {
                            detailProductCubit.onSelectSize(index);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: state.sizeIndex == index
                                  ? Colors.black
                                  : Colors.white,
                              border: Border.all(color: AppColors.boderLine),
                            ),
                            child: Text(
                              sizes[index],
                              style: state.sizeIndex == index
                                  ? AppTextStyle.whiteS14Bold
                                  : AppTextStyle.tintS14Bold,
                            ),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      "Description",
                      style: AppTextStyle.blackS16W800,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      product.description,
                      style: AppTextStyle.tintS10,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                              child: Text(
                                "Total Price",
                                style: AppTextStyle.tintS9,
                              ),
                            ),
                            Text(
                              r"$" "${product.price * state.quantity}",
                              style: AppTextStyle.blackS18W800,
                            ),
                          ],
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: state.loadStatus == LoadStatus.loading
                              ? null
                              : () {
                                  detailProductCubit.addCart(context);
                                },
                          child: Container(
                            width: 200,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.black),
                            child: state.loadStatus == LoadStatus.loading
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : Row(
                                    children: [
                                      const Spacer(),
                                      SvgPicture.asset(
                                        AppSVGs.icAddToCart,
                                        height: 16,
                                        width: 16,
                                      ),
                                      const SizedBox(
                                        width: 16,
                                      ),
                                      Text(
                                        "Add to cart",
                                        style: AppTextStyle.whiteS16Bold,
                                      ),
                                      const Spacer(),
                                    ],
                                  ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 28,
              right: 24,
              child: Container(
                width: 70,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors.boderLine.withOpacity(0.3),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(
                      width: 2,
                    ),
                    InkWell(
                      onTap: detailProductCubit.subtractQuantity,
                      child: Text(
                        "−",
                        style: AppTextStyle.blackS18,
                      ),
                    ),
                    Text(
                      state.quantity.toString(),
                      style: AppTextStyle.blackS14,
                    ),
                    InkWell(
                      onTap: detailProductCubit.addQuantity,
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
            Positioned(
              top: 68,
              right: 24,
              child: Text(
                "Avaliable in stok",
                style: AppTextStyle.blackS12Bold,
              ),
            ),
            Positioned(
              top: 92,
              right: 24,
              child: Container(
                height: 132,
                width: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [AppShadow.productColor]),
                child: Wrap(
                  alignment: WrapAlignment.spaceEvenly,
                  runAlignment: WrapAlignment.spaceEvenly,
                  spacing: 0,
                  runSpacing: 2,
                  children: List.generate(
                    4,
                    (index) {
                      return InkWell(
                        onTap: () {
                          detailProductCubit.onSelectColor(index);
                        },
                        child: Container(
                          height: 22,
                          width: 22,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.listColor[index],
                              border: Border.all(color: AppColors.boderLine)),
                          child: state.colorIndex == index
                              ? Icon(
                                  Icons.check,
                                  size: 12,
                                  color: state.colorIndex == 1
                                      ? Colors.white
                                      : Colors.black,
                                )
                              : null,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
