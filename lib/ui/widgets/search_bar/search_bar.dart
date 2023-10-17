import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_colors.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_svgs.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_text_styles.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
    required this.textEditingController,
    required this.ontap,
    required this.onChange,
    required this.hintText,
  });
  final String hintText;
  final TextEditingController textEditingController;
  final Function() ontap;
  final Function(String) onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.searchBar,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: ontap,
              child: SvgPicture.asset(
                AppSVGs.icSearch,
                height: 16,
                width: 16,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: TextFormField(
                controller: textEditingController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your value';
                  }
                  return null;
                },
                onChanged: onChange,
                onEditingComplete: ontap,
                maxLines: 1,
                decoration: InputDecoration(
                    hintStyle: AppTextStyle.tintS10Bold,
                    hintText: hintText,
                    border: InputBorder.none),
              ),
            ),
            //  InkWell(
            //           onTap: onTap,
            //           child: const Icon(
            //             Icons.clear,
            //             size: 24,
            //           ))
            //       : Container(),
          ],
        ),
      ),
    );
  }
}
