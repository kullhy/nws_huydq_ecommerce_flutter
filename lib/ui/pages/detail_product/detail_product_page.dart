import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_images.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_svgs.dart';

class DetailProductPage extends StatelessWidget {
  const DetailProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          Stack(
            children: [
              Image.asset(
                AppImages.splashScreen,
                height: 500,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(
                        AppSVGs.icBack,
                        height: 32,
                        width: 32,
                      ),
                    ),
                    SvgPicture.asset(
                      AppSVGs.icSearch,
                      height: 18,
                      width: 18,
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: SvgPicture.asset(
                  AppSVGs.icWhiteLove,
                  height: 18,
                  width: 18,
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
