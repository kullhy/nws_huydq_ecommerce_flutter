import 'package:flutter/material.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_colors.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomSwitch({Key? key, required this.value, required this.onChanged})
      : super(key: key);

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  Animation? _circleAnimation;
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 60));
    _circleAnimation = AlignmentTween(
            begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
            end: widget.value ? Alignment.centerLeft : Alignment.centerRight)
        .animate(CurvedAnimation(
            parent: _animationController!, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController!,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (_animationController!.isCompleted) {
              _animationController!.reverse();
            } else {
              _animationController!.forward();
            }
            widget.value == false
                ? widget.onChanged(true)
                : widget.onChanged(false);
          },
          child: Container(
            width: 28.0,
            height: 16.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: _circleAnimation!.value == Alignment.centerLeft
                  ? Colors.black
                  : AppColors.iconBackground,
            ),
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Container(
                alignment: widget.value
                    ? ((Directionality.of(context) == TextDirection.rtl)
                        ? Alignment.centerRight
                        : Alignment.centerLeft)
                    : ((Directionality.of(context) == TextDirection.rtl)
                        ? Alignment.centerLeft
                        : Alignment.centerRight),
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _circleAnimation!.value == Alignment.centerLeft
                          ? AppColors.iconBackground
                          : Colors.black),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
