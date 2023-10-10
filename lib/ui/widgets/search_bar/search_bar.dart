import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_colors.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_svgs.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_text_styles.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/home/home_cubit.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
    required this.homeCubit,
  });
  final HomeCubit homeCubit;

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
              onTap: () {
                homeCubit.searchCategoriesByName(
                    homeCubit.searchEditingController.text);
              },
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
                controller: homeCubit.searchEditingController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your value';
                  }
                  return null;
                },
                onChanged: (value) {
                  homeCubit.searchCategoriesByName(value);
                },
                onEditingComplete: () {
                  homeCubit.searchCategoriesByName(
                      homeCubit.searchEditingController.text);
                },
                maxLines: 1,
                decoration: InputDecoration(
                    hintStyle: AppTextStyle.tintS10Bold,
                    hintText: 'Search Categories',
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
