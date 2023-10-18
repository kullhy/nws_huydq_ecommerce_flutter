import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/widgets/bottom_bar/bottom_bar_item_widget.dart';

import 'package:nws_huydq_ecommerce_flutter/ui/widgets/bottom_bar/model/bottom_bar_item_model.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({
    super.key,
    required this.listBottomBarItem,
    required this.onChangePage,
  });

  final List<BottomBarItem> listBottomBarItem;
  final Function(int index) onChangePage;

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  List<bool> itemSelectStates = [];

  @override
  void initState() {
    itemSelectStates =
        List.generate(widget.listBottomBarItem.length, (index) => index == 0);
    log(itemSelectStates.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.08,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 4),
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: widget.listBottomBarItem.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          return BottomBarItemWidget(
            iconItem: item.iconItem,
            title: item.title,
            isSelect: itemSelectStates[index],
            index: index,
            onItemTap: (selectedIndex) {
              setState(() {
                for (int i = 0; i < itemSelectStates.length; i++) {
                  itemSelectStates[i] = i == selectedIndex;
                }
                widget.onChangePage(selectedIndex);
              });
            },
          );
        }).toList(),
      ),
    );
  }
}
