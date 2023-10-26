import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_colors.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_vector.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_text_styles.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/profile/profile_cubit.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/widgets/switch/switch_custom.dart';

class SettingWidget extends StatelessWidget {
  const SettingWidget({
    super.key,
    required this.changeNoti,
    required this.changeLang,
    required this.language,
  });

  final Function(bool) changeNoti;
  final Function(String?) changeLang;
  final String language;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      padding: const EdgeInsets.fromLTRB(20, 28, 10, 28),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.grey.withOpacity(0.5),
        ),
      ),
      child: Column(children: [
        Row(
          children: [
            icon(AppSVGs.icLanguage),
            const SizedBox(
              width: 12,
            ),
            Text(
              'language'.tr,
              style: AppTextStyle.blackS14W800,
            ),
            const Spacer(),
            DropdownButton<String>(
                value: language,
                icon: const Icon(Icons.navigate_next_rounded),
                elevation: 0,
                underline: null,
                onChanged: changeLang,
                items: [
                  DropdownMenuItem(
                    value: 'English',
                    child: Text(
                      'english'.tr,
                      style: AppTextStyle.tintS10,
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'Vietnamese',
                    child: Text(
                      'vietnamese'.tr,
                      style: AppTextStyle.tintS10,
                    ),
                  ),
                ])
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
          return Row(
            children: [
              icon(AppSVGs.icNoti),
              const SizedBox(
                width: 12,
              ),
              Text(
                'notification'.tr,
                style: AppTextStyle.blackS14W800,
              ),
              const Spacer(),
              SizedBox(
                height: 20,
                child: CustomSwitch(
                  value: state.isNoti,
                  onChanged: changeNoti,
                ),
              )
            ],
          );
        }),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            icon(AppSVGs.icDarkMode),
            const SizedBox(
              width: 12,
            ),
            Text(
              'dark_mode'.tr,
              style: AppTextStyle.blackS14W800,
            ),
            const Spacer(),
            Text(
              "off",
              style: AppTextStyle.tintS10,
            ),
            const SizedBox(
              width: 8,
            ),
            SizedBox(
              height: 20,
              child: CustomSwitch(
                value: true,
                onChanged: (bool val) {},
              ),
            )
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            icon(AppSVGs.icHelpCenter),
            const SizedBox(
              width: 12,
            ),
            Text(
              "help_center".tr,
              style: AppTextStyle.blackS14W800,
            ),
            const Spacer(),
            // Text(
            //   "English",
            //   style: AppTextStyle.tintS10,
            // ),
            const SizedBox(
              width: 8,
            ),
            const Icon(
              Icons.navigate_next_outlined,
              size: 20,
            )
          ],
        )
      ]),
    );
  }

  Container icon(String image) {
    return Container(
      height: 36,
      width: 36,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: AppColors.iconBackground),
      child: SvgPicture.asset(
        image,
        height: 20,
        width: 20,
      ),
    );
  }
}

List<String> list = <String>['english'.tr, 'vietnamese'.tr];
