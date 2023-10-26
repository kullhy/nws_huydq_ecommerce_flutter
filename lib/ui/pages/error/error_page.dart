import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_images.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_text_styles.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage(
      {super.key, this.onPress, this.icon, this.textButton, this.errorMessage});

  final Function()? onPress;
  final IconData? icon;
  final String? textButton;
  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.pageNotFound,
            width: size.width * 0.8,
          ),
          Text(
            "Whoops",
            style: AppTextStyle.blackS24Bold,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            errorMessage ?? "Have a error",
            style: AppTextStyle.blackS16,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: onPress ??
                  () {
                    GoRouter.of(context).pop();
                  },
              child: Container(
                width: size.width * 0.4,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    Icon(icon ?? Icons.arrow_back_ios_new),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      textButton ?? "BACK",
                      style: AppTextStyle.blackS18Bold,
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
