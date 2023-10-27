import 'package:flutter/material.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_colors.dart';

import 'package:nws_huydq_ecommerce_flutter/common/app_text_styles.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/widgets/images/image_network.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/notification/noti_cubit.dart';
import 'package:nws_huydq_ecommerce_flutter/utils/date_utils.dart';

class NotiItem extends StatelessWidget {
  const NotiItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
    required this.time,
    required this.notiCubit,
  });

  final String title;
  final String subTitle;
  final String image;
  final DateTime time;
  final NotiCubit notiCubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 48,
            width: 48,
            child: CircleAvatar(
              backgroundColor: Colors.amber,
              backgroundImage: null,
              child: ClipOval(
                child: ImageNetwork(
                  imgUrl: image,
                  width: 84,
                  height: 84,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyle.blackS11W800,
                ),
                Text(
                  subTitle,
                  style: AppTextStyle.greyS11,
                  maxLines: 3,
                  overflow: TextOverflow.clip,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  DateTimeUtils().formatTimeAgo(time),
                  style: AppTextStyle.tintS11,
                  maxLines: 3,
                  overflow: TextOverflow.clip,
                )
              ],
            ),
          ),
        ]),
        const Divider(
            height: 20,
            thickness: 1.5,
            indent: 0,
            endIndent: 0,
            color: AppColors.boderLine)
      ],
    );
  }
}
