import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_svgs.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_text_styles.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/cart/components/cart_item_widget.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      AppSVGs.icBack,
                      height: 32,
                      width: 32,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    "My Cart",
                    style: AppTextStyle.blackS18Bold,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Wrap(
                    alignment: WrapAlignment.start,
                    // spacing: 30,
                    runSpacing: 16,
                    children: List.generate(3, (index) {
                      return CartItemWidget(size: size);
                    }),
                  )
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total (3 item):",
                  style: AppTextStyle.tintS14Bold,
                ),
                Text(
                  r"$" "500",
                  style: AppTextStyle.blackS18W800,
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 10),
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black,
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Proceed to Checkout",
                        style: AppTextStyle.whiteS16Bold),
                    SvgPicture.asset(
                      AppSVGs.icCheckout,
                      height: 30,
                      width: 30,
                    )
                  ]),
            )
          ],
        ),
      )),
    );
  }
}
