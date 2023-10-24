import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_shadow.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_vector.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_text_styles.dart';
import 'package:nws_huydq_ecommerce_flutter/global/global_data.dart';
import 'package:nws_huydq_ecommerce_flutter/models/detail_categories/product.dart';
import 'package:nws_huydq_ecommerce_flutter/models/product_cart/product_cart.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/detail_product/widgets/add_to_cart_widget.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/detail_product/widgets/product_info_widget.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/detail_product/detail_product_cubit.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/detail_product/detail_product_navigator.dart';

class DetailProductPage extends StatelessWidget {
  const DetailProductPage({super.key, required this.product, this.productCart});
  final Product product;
  final ProductCart? productCart;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return DetailProductCubit(
            navigator: DetailProductNavigator(context: context),
            product: product);
      },
      child: const DetailProductView(),
    );
  }
}

class DetailProductView extends StatefulWidget {
  const DetailProductView({super.key});

  @override
  State<DetailProductView> createState() => _DetailProductViewState();
}

class _DetailProductViewState extends State<DetailProductView>
    with TickerProviderStateMixin {
  late DetailProductCubit _detailProductCubit;

  @override
  void initState() {
    super.initState();
    _detailProductCubit = context.read<DetailProductCubit>();
    _detailProductCubit.pageController = PageController(initialPage: 1);
    _detailProductCubit.setProductCart();
    _detailProductCubit.addToCartPopUpAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
  }

  @override
  void dispose() {
    _detailProductCubit.pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<DetailProductCubit, DetailProductState>(
        builder: (context, state) {
      return WillPopScope(
                onWillPop: () async {
                  Navigator.pop(context,true);
                  return false;
                },
        child: Scaffold(
          body: Stack(
            children: [
              SizedBox(
                height: size.height,
                width: size.width,
              ),
              SizedBox(
                height: size.height * 0.6,
                child: PageView.builder(
                    controller: _detailProductCubit.pageController,
                    itemCount: state.product!.images.length,
                    onPageChanged: _detailProductCubit.onChangedPage,
                    itemBuilder: (context, index) {
                      return Image.network(
                        _detailProductCubit.product.images[index],
                        height: size.height * 0.55,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      );
                    }),
              ),
              SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      InkWell(
                        onTap: _detailProductCubit.openCartPage,
                        child: SizedBox(
                          height: 30,
                          width: 30,
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 0,
                                child: Container(
                                  height: 28,
                                  width: 28,
                                  padding: const EdgeInsets.all(7),
                                  decoration: BoxDecoration(
                                      boxShadow: [AppShadow.productColor],
                                      shape: BoxShape.circle,
                                      color: Colors.white),
                                  child: SvgPicture.asset(
                                    AppSVGs.icAddToCart,
                                    height: 12,
                                    width: 12,
                                    colorFilter: const ColorFilter.mode(
                                        Colors.black, BlendMode.srcIn),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 0,
                                top: 0,
                                child: Container(
                                    height: 16,
                                    width: 16,
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black),
                                    child: Text(
                                      "${GlobalData.instance.quantityCart}",
                                      style: AppTextStyle.whiteS10,
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: size.height * 0.5 + 20,
                right: 30,
                child: SvgPicture.asset(
                  AppSVGs.icWhiteLove,
                  height: 32,
                  width: 32,
                ),
              ),
              Positioned(
                bottom: size.height * 0.5 + 20,
                right: size.width * 0.5 - 22,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    state.product!.images.length,
                    (index) => buildDot(index, state.curIndex, context),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: ProductInfoWidget(
                  size: size,
                  detailProductCubit: _detailProductCubit,
                ),
              ),
              addToCartPopUp(
                  _detailProductCubit.addToCartPopUpAnimationController,
                  _detailProductCubit.openCartPage),
            ],
          ),
        ),
      );
    });
  }

  Container buildDot(int index, int curIndex, BuildContext context) {
    return Container(
      height: 12,
      width: 12,
      padding: const EdgeInsets.all(2),
      margin: const EdgeInsets.only(right: 2),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              width: 1,
              color: index == curIndex ? Colors.white : Colors.transparent),
          color: Colors.transparent),
      child: Container(
        height: 6,
        width: 6,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
      ),
    );
  }
}
