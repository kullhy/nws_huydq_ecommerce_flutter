import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_colors.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_svgs.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_text_styles.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/widgets/switch/switch_custom.dart';

class SettingWidget extends StatefulWidget {
  const SettingWidget({
    super.key,
  });

  @override
  State<SettingWidget> createState() => _SettingWidgetState();
}

class _SettingWidgetState extends State<SettingWidget> {
  bool _enable = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 226,
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
              "Language",
              style: AppTextStyle.blackS14W800,
            ),
            const Spacer(),
            Text(
              "English",
              style: AppTextStyle.tintS10,
            ),
            const SizedBox(
              width: 8,
            ),
            const Icon(
              Icons.navigate_next_outlined,
              size: 20,
            )
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            icon(AppSVGs.icNoti),
            const SizedBox(
              width: 12,
            ),
            Text(
              "Notification",
              style: AppTextStyle.blackS14W800,
            ),
            const Spacer(),
            SizedBox(
              height: 20,
              child: CustomSwitch(
                value: _enable,
                onChanged: (bool val) {
                  setState(() {
                    _enable = val;
                  });
                },
              ),
            )
          ],
        ),
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
              "Dark Mode",
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
                value: _enable,
                onChanged: (bool val) {
                  setState(() {
                    _enable = val;
                  });
                },
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
              "Help Center",
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
