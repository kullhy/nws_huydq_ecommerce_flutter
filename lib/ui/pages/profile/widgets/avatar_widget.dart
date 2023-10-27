import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:nws_huydq_ecommerce_flutter/common/app_shadow.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_vector.dart';
import 'package:nws_huydq_ecommerce_flutter/models/enums/load_status.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/widgets/images/image_network.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/profile/profile_cubit.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    super.key,
    required ProfileCubit profileCubit,
    required this.imageUrl,
    required this.loadStatus,
  }) : _profileCubit = profileCubit;

  final ProfileCubit _profileCubit;
  final String imageUrl;
  final LoadStatus loadStatus;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 84,
      width: 84,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            child: ImageNetwork(
              imgUrl: imageUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: InkWell(
              onTap: _profileCubit.getImage,
              child: Container(
                height: 20,
                padding: const EdgeInsets.all(5),
                width: 20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: [AppShadow.productColor],
                    color: Colors.white),
                child: SvgPicture.asset(
                  AppSVGs.icEdit,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
