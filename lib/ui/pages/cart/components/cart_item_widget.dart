import 'package:flutter/material.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_colors.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_images.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_shadow.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_text_styles.dart';

class CartItemWidget extends StatefulWidget {
  const CartItemWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: Container(
        color: Colors.green,
        child: const Align(
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 20,
              ),
              Icon(
                Icons.edit,
                color: Colors.white,
              ),
              Text(
                " Edit",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ),
      secondaryBackground: Container(
        color: Colors.red,
        child: const Align(
          alignment: Alignment.centerRight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Icon(
                Icons.delete,
                color: Colors.white,
              ),
              Text(
                " Delete",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.right,
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
        ),
      ),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.endToStart) {
          final bool res = await showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: const Text("Are you sure you want to delete?"),
                  actions: <Widget>[
                    ElevatedButton(
                      child: const Text(
                        "Cancel",
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    ElevatedButton(
                      child: const Text(
                        "Delete",
                        style: TextStyle(color: Colors.red),
                      ),
                      onPressed: () {
                        // TODO: Delete the item from DB etc..
                        setState(() {});
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              });
          return res;
        } else {
          // TODO: Navigate to edit page;
        }
        return null;
      },
      key: const Key(""),
      child: Container(
        height: 100,
        padding: const EdgeInsets.all(8),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [AppShadow.productColor],
          color: Colors.white,
        ),
        child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              AppImages.noImage,
              width: 84,
              height: 84,
              fit: BoxFit.cover,
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return Image.network(
                  AppImages.noImage,
                  width: widget.size.width * 0.4,
                  height: 150,
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          const SizedBox(
            width: 6,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 2,
              ),
              Text(
                "Roller Rabbit",
                style: AppTextStyle.blackS14Bold,
              ),
              Text(
                "Roller Rabbit",
                style: AppTextStyle.tintS10Bold,
              ),
              const Spacer(),
              Text(
                r"$" "198.00",
                style: AppTextStyle.blackS14W800,
              ),
              const SizedBox(
                height: 2,
              ),
            ],
          ),
          const Spacer(),
          Container(
            width: 70,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: AppColors.boderLine.withOpacity(0.3),
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(
                    width: 2,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "−",
                      style: AppTextStyle.blackS18,
                    ),
                  ),
                  Text(
                    "1",
                    style: AppTextStyle.blackS14,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "+",
                      style: AppTextStyle.blackS18,
                    ),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
