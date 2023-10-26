import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_colors.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_images.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_text_styles.dart';

class CategoriesItem extends StatelessWidget {
  const CategoriesItem(
      {super.key,
      required this.itemName,
      required this.itemImage,
      required this.id,
      required this.quantity,
      required this.ontap});
  final String itemName;
  final String itemImage;
  final int id;
  final int quantity;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: ontap,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              itemImage,
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
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.bottomCenter,
              height: 46,
              width: size.width * 0.4,
              decoration: BoxDecoration(
                color: AppColors.secondary.withOpacity(0.8),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 19,
                    child: Text(
                      itemName,
                      style: AppTextStyle.blackS18W800,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    "$quantity ${'product'.tr}",
                    style: AppTextStyle.blackS12Bold,
                  )
                ],
              ),
            ),
          ),
          // Positioned(
          //   top: 12,
          //   right: 12,
          //   child: Container(
          //     alignment: Alignment.bottomCenter,
          //     height: 20,
          //     width: 20,
          //     child: SvgPicture.asset(
          //       AppSVGs.icLove,
          //       height: 20,
          //       width: 20,
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
