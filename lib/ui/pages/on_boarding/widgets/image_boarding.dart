import 'package:flutter/material.dart';

ClipRRect imageBoarding(BuildContext context, String imagePath) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(30),
    child: Container(
      transform: Matrix4.skewY(-0.07),
      height: MediaQuery.of(context).size.height / 2 + 30,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        ),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            imagePath,
          ),
        ),
      ),
    ),
  );
}
