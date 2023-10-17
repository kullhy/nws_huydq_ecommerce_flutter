import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_svgs.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_text_styles.dart';
import 'package:nws_huydq_ecommerce_flutter/models/enums/load_status.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/cart/cart_cubit.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/cart/cart_navigator.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/cart/components/cart_item_widget.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return CartCubit(
          navigator: CartNavigator(context: context),
        );
      },
      child: const CartView(),
    );
  }
}

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  late CartCubit _cartCubit;

  @override
  void initState() {
    super.initState();
    _cartCubit = context.read<CartCubit>();
    _cartCubit.getListCart();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: BlocBuilder<CartCubit, CartState>(builder: (context, state) {
        if (state.loadStatus == LoadStatus.initial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Column(
            children: [
              SizedBox(
                height: size.height * 0.65,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: InkWell(
                        onTap: () {
                          // Navigator.pop(context);
                        },
                        child: SvgPicture.asset(
                          AppSVGs.icBack,
                          height: 32,
                          width: 32,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        "My Cart",
                        style: AppTextStyle.blackS18Bold,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      height: size.height * 0.5,
                      child: ListView.builder(
                          itemCount: state.productCarts.length,
                          itemBuilder: (BuildContext context, int index) {
                            return CartItemWidget(
                              size: size,
                              productCart: state.productCarts[index],
                              cartCubit: _cartCubit,
                            );
                          }),
                    )
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total (${state.productCarts.length} item):",
                      style: AppTextStyle.tintS14Bold,
                    ),
                    Text(
                      r"$" "${state.totalPrice}",
                      style: AppTextStyle.blackS18W800,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
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
          );
        }
      })),
    );
  }
}
