import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_svgs.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_text_styles.dart';
import 'package:nws_huydq_ecommerce_flutter/models/detail_categories/product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.product,
  });
  final Product product;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {},
      child: Container(
        // height: 220,
        width: size.width * 0.4,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: size.width * 0.4,
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: NetworkImage(product.images[0].toString()),
                        fit: BoxFit.cover,
                      )),
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
