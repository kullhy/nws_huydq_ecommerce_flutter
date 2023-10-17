import 'package:flutter/material.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_text_styles.dart';

Row infoField(
    Size size, String name, TextEditingController textEditingController) {
  return Row(
    children: [
      Expanded(
        child: Text(
          name,
          style: AppTextStyle.tintS14Bold,
        ),
      ),
      SizedBox(
        width: size.width * 0.6,
        child: TextFormField(
          controller: textEditingController,
          style: AppTextStyle.blackS14w500,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            isDense: true,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.withOpacity(0.4),
                width: 1,
              ),
            ),
            contentPadding: const EdgeInsets.only(left: 16),
          ),
        ),
      )
    ],
  );
}
