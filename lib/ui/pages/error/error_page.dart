import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_images.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_text_styles.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.pageNotFound,
              width: size.width * 0.8,
            ),
            ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).pop();
                },
                child: SizedBox(
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(Icons.arrow_back_ios_new),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        "BACK",
                        style: AppTextStyle.blackS18Bold,
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
