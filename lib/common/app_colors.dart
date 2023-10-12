import 'package:flutter/material.dart';

class AppColors {
  static Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return const Color.fromARGB(203, 140, 138, 138);
  }

  static const Color primary = Color(0xFF173d7e);
  static const Color secondary = Color.fromARGB(181, 255, 255, 255);

  //home
  static const Color searchBar = Color.fromARGB(40, 173, 171, 171);
  static const Color star = Color.fromARGB(255, 255, 171, 7);
  static const Color boderLine = Color.fromARGB(120, 202, 200, 200);

  //product
  static const List<Color> listColor = [
    Colors.white,
    Colors.black,
    Color(0xffcadca7),
    Color(0xfff79f1f),
  ];
}
