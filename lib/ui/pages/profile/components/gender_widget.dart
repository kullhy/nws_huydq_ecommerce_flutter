import 'package:flutter/material.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_text_styles.dart';

Row genderWidget(Size size) {
  return Row(
    children: [
      Expanded(
        child: Text(
          "Gender",
          style: AppTextStyle.tintS14Bold,
        ),
      ),
      SizedBox(
        width: size.width * 0.6,
        child: Row(
          children: [
            Container(
              height: 28,
              // width: 24,
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6), color: Colors.black),
              child: Row(
                children: [
                  Container(
                    height: 10,
                    width: 10,
                    padding: const EdgeInsets.all(2),
                    margin: const EdgeInsets.only(right: 2),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 1, color: Colors.white),
                        color: Colors.transparent),
                    child: Container(
                      height: 5,
                      width: 5,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    "Male",
                    style: AppTextStyle.whiteS10Bold,
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Container(
              height: 28,
              // width: 24,
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.white),
              child: Row(
                children: [
                  Container(
                    height: 10,
                    width: 10,
                    padding: const EdgeInsets.all(2),
                    margin: const EdgeInsets.only(right: 2),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 1, color: Colors.grey),
                        color: Colors.transparent),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    "Female",
                    style: AppTextStyle.tintS10Bold,
                  )
                ],
              ),
            )
          ],
        ),
      )
    ],
  );
}
