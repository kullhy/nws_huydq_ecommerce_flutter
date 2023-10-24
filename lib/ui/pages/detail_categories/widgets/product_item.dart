import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_images.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_vector.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_text_styles.dart';
import 'package:nws_huydq_ecommerce_flutter/models/detail_categories/product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.product,
    required this.ontap,
  });
  final Product product;
  final Function() ontap;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: ontap,
      child: SizedBox(
        // height: 220,
        width: size.width * 0.4,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    product.images[0].toString(),
                    width: size.width * 0.4,
                    height: 150,
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
                Positioned(
                  top: 16,
                  right: 16,
                  child: SvgPicture.asset(
                    AppSVGs.icLove,
                    height: 20,
                    width: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 16,
              child: Text(
                product.title,
                style: AppTextStyle.blackS14W800,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              height: 18,
              child: Text(
                product.description,
                style: AppTextStyle.tintS12,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              height: 16,
              child: Text(
                r"$" + product.price.toString(),
                style: AppTextStyle.blackS14Bold,
              ),
            ),
            const SizedBox(
              height: 16,
            )
          ],
        ),
      ),
    );
  }
}
