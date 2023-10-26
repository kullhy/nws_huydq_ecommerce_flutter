import 'package:flutter/material.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_text_styles.dart';

Future<void> showAlertDialog(
    {required BuildContext context,
    required String title,
    required String content,
    required Function() onConfirm}) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(onPressed: onConfirm, child: const Text('Ok')),
        ],
      );
    },
  );
}

Future<void> showCustomDialog(
    {required BuildContext context,
    required String title,
    required String content,
    required Function() onConfirm}) async {
  Size size = MediaQuery.of(context).size;
  showGeneralDialog(
    context: context,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (_, __, ___) {
      return Center(
        child: Container(
          height: size.height * 0.25,
          width: size.width * 0.7,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(28)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            DefaultTextStyle(
              style: AppTextStyle.blackS20Bold,
              child: Text(
                title,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            DefaultTextStyle(
              style: AppTextStyle.blackS12,
              child: Text(
                content,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(onPressed: onConfirm, child: const Text('Ok')),
              ],
            )
          ]),
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      Tween<Offset> tween;
      if (anim.status == AnimationStatus.reverse) {
        tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
      } else {
        tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
      }

      return SlideTransition(
        position: tween.animate(anim),
        child: FadeTransition(
          opacity: anim,
          child: child,
        ),
      );
    },
  );
}
