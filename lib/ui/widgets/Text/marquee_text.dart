import 'package:flutter/material.dart';
import 'package:marquee_widget/marquee_widget.dart';

class MarqueeText extends StatelessWidget {
  const MarqueeText({super.key, required this.text, required this.style});
  final String text;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Marquee(
      child: Text('This project'),
      direction: Axis.horizontal,
      textDirection: TextDirection.rtl,
      animationDuration: Duration(seconds: 1),
      backDuration: Duration(milliseconds: 5000),
      pauseDuration: Duration(milliseconds: 2500),
      directionMarguee: DirectionMarguee.oneDirection,
    );
  }
}
