import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_svgs.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/detail_product/detail_product_page.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/home/home_pages.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/widgets/bottom_bar/custom_bottom_bar.dart';

import '../../widgets/bottom_bar/model/bottom_bar_item_model.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int pageIndex = 0;

  List<Widget> listPage = [
    const HomePage(),
    const DetailProductPage(),
    const HomePage(),
    const HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    log(pageIndex.toString());
    return Scaffold(
      bottomNavigationBar: CustomBottomBar(
        listBottomBarItem: [
          BottomBarItem(
            iconItem: AppSVGs.icHome,
            title: 'Home',
          ),
          BottomBarItem(
            iconItem: AppSVGs.icCart,
            title: 'Cart',
          ),
          BottomBarItem(
            iconItem: AppSVGs.icNoti,
            title: 'Noti',
          ),
          BottomBarItem(
            iconItem: AppSVGs.icProfile,
            title: 'Profile',
          ),
        ],
        onChangePage: (index) {
          setState(() {
            pageIndex = index;
          });
        },
      ),
      body: listPage[pageIndex],
    );
  }
}
