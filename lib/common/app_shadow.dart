import 'package:flutter/material.dart';

class AppShadow {
  static BoxShadow productColor = BoxShadow(
    color: Colors.grey.withOpacity(0.1),
    spreadRadius: 5,
    blurRadius: 7,
    offset: const Offset(0, 4), // changes position of shadow
  );
}
