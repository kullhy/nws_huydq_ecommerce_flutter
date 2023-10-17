import 'package:flutter/material.dart';

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
