import 'package:flutter/material.dart';

class AppColors {
  static const LinearGradient backgroundGadient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFF2B5876), // Màu đầu tiên
      Color(0xFF4E4376), // Màu thứ hai
    ],
    stops: [0.0, 1.0], // Điểm dừng (100%)
  );
  static LinearGradient itemBackgroundGadient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      const Color(0xff6b66a6).withOpacity(0.5),
      const Color(0xff74d0dd).withOpacity(0.2),
    ],
  );

  static const LinearGradient mostPopular = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0x00121212), Color.fromARGB(255, 0, 0, 0)],
  );

  static const LinearGradient category = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Color(0x30A6A1E0), Color(0x30A1F3FE), Color(0x30A1F3FE)],
  );

  static const Color primary = Color(0xFF173d7e);
  static const Color secondary = Color.fromARGB(127, 255, 255, 255);
}
