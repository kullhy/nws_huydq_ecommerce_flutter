import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_vector.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_text_styles.dart';
import 'package:nws_huydq_ecommerce_flutter/models/onboarding.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/on_boarding/on_boarding_cubit.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/on_boarding/widgets/image_boarding.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return OnBoardingCubit();
      },
      child: const OnBoardingView(),
    );
  }
}

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late OnBoardingCubit _onBoardingCubit;
  // int state.curIndex = 0;

  @override
  void initState() {
    _onBoardingCubit = context.read<OnBoardingCubit>();
    _onBoardingCubit.pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _onBoardingCubit.pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OnBoardingCubit,OnBoardingState>(
        builder: (context,state) {
          return SafeArea(
            child: Container(
              color: Colors.white,
              // padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 12,
                    child: PageView.builder(
                      controller: _onBoardingCubit.pageController,
                      itemCount: 3,
                      onPageChanged: _onBoardingCubit.onPageChange,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              imageBoarding(context, contents[index].image),
                              const SizedBox(
                                height: 36,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  contents[index].title,
                                  style: AppTextStyle.blackS24W900,
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Text(
                                contents[index].discription,
                                style: AppTextStyle.greyS14,
                                overflow: TextOverflow.clip,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            3,
                            (index) => buildDot(index, state.curIndex, context),
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: (){
                            _onBoardingCubit.nextPage(context);
                          },
                          child: SvgPicture.asset(
                            AppSVGs.icNext,
                            height: 80,
                            width: 80,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }

  Container buildDot(int index, int curIndex, BuildContext context) {
    return Container(
      height: 5,
      width: curIndex == index ? 20 : 5,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: curIndex == index ? Colors.black : Colors.grey.shade300,
      ),
    );
  }
}
