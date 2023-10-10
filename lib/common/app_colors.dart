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
}
