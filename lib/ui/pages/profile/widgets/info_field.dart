import 'package:flutter/material.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_text_styles.dart';

class InfoField extends StatelessWidget {
  const InfoField(
      {super.key,
      required this.size,
      required this.textEditingController,
      required this.name});
  final String name;
  final Size size;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
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
            readOnly: true,
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
}
