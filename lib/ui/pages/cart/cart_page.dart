import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_images.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_vector.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_text_styles.dart';
import 'package:nws_huydq_ecommerce_flutter/models/enums/load_status.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/cart/cart_cubit.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/cart/cart_navigator.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/cart/widgets/cart_item_widget.dart';

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
        child: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            if (state.loadStatus == LoadStatus.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Column(
                children: [
                  Expanded(
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
                              Navigator.canPop(context)
                                  ? Navigator.pop(context)
                                  : _cartCubit.navigator.openMainPage();
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
                            "my_cart".tr,
                            style: AppTextStyle.blackS18Bold,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        state.productCarts.isEmpty
                            ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "OPPS",
                                      style: AppTextStyle.blackS24W900,
                                    ),
                                    Image.asset(
                                      AppImages.noCart,
                                      height: 120,
                                    )
                                  ],
                                ),
                              )
                            : Expanded(
                                // height: size.height * 0.5,
                                child: ListView.builder(
                                  itemCount: state.productCarts.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return CartItemWidget(
                                      size: size,
                                      productCart: state.productCarts[index],
                                      cartCubit: _cartCubit,
                                    );
                                  },
                                ),
                              )
                      ],
                    ),
                  ),
                  // const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${'total'.tr} (${state.productCarts.length} ${'item'.tr}):",
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
                  InkWell(
                    onTap: state.productCarts.isEmpty ? null : () {},
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      padding: const EdgeInsets.only(left: 20, right: 10),
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: state.productCarts.isEmpty
                            ? Colors.grey
                            : Colors.black,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('proceed_to_checkout'.tr,
                              style: AppTextStyle.whiteS16Bold),
                          SvgPicture.asset(
                            AppSVGs.icCheckout,
                            height: 30,
                            width: 30,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
