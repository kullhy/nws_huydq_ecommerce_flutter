import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_text_styles.dart';

class BottomBarItemWidget extends StatefulWidget {
  const BottomBarItemWidget({
    super.key,
    required this.iconItem,
    required this.title,
    required this.index, // Thêm thuộc tính index
    required this.onItemTap,
    required this.isSelect, // Thêm thuộc tính onItemTap
  });

  final String iconItem;
  final String title;
  final int index;
  final bool isSelect;
  final Function(int index) onItemTap;

  @override
  State<BottomBarItemWidget> createState() => _BottomBarItemWidgetState();
}

class _BottomBarItemWidgetState extends State<BottomBarItemWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onItemTap(widget.index);
      },
      child: Container(
        height: 28,
        width: 70,
        decoration: BoxDecoration(
            color: widget.isSelect
                ? Colors.grey.withOpacity(0.4)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(25)),
        child: Row(
            mainAxisAlignment: widget.isSelect
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
            children: [
              Container(
                height: 28,
                width: 28,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.isSelect
                        ? Colors
                            .black // Màu sắc của biểu tượng trong item đã chọn
                        : Colors.white),
                child: SvgPicture.asset(
                  widget.iconItem,
                  width: 10,
                  height: 10,
                  colorFilter: ColorFilter.mode(
                      widget.isSelect ? Colors.white : Colors.black,
                      BlendMode.srcIn),
                ),
              ),
              widget.isSelect
                  ? const SizedBox(
                      width: 3,
                    )
                  : Container(),
              widget.isSelect
                  ? Text(
                      widget.title,
                      style: AppTextStyle.blackS11W800,
                    )
                  : Container(),
            ]),
      ),
    );
  }
}
