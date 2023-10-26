import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_text_styles.dart';

class LoginWithButton extends StatelessWidget {
  const LoginWithButton({
    super.key,
    required this.image,
    required this.content,
  });
  final String image;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 46,
      decoration: BoxDecoration(
          border: Border.all(
              color: content == "Facebook"
                  ? const Color(0xff3b5999)
                  : Colors.grey.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(25),
          color:
              content == "Facebook" ? const Color(0xff3b5999) : Colors.white),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 52,
            ),
            Image.asset(
              image,
              height: 14,
            ),
            const SizedBox(
              width: 10,
            ),
            Text("${'continue_with'.tr} $content",
                style: content == "Facebook"
                    ? AppTextStyle.whiteS16Bold
                    : AppTextStyle.greyS16Bold),
          ],
        ),
      ),
    );
  }
}
