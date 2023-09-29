import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_text_styles.dart';
import 'package:nws_huydq_ecommerce_flutter/models/onboarding.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/on_boarding/on_boarding_cubit.dart';

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
  PageController pageController = PageController();
  int currentIndex = 0;

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      color: Colors.white,
      // padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 600,
            child: PageView.builder(
                controller: pageController,
                itemCount: 3,
                onPageChanged: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          contents[index].image,
                          height: 400,
                          width: double.infinity - 30,
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            contents[index].title,
                            style: AppTextStyle.blackS24W900,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          contents[index].discription,
                          style: AppTextStyle.blackS14,
                          overflow: TextOverflow.clip,
                        ),
                      ],
                    ),
                  );
                }),
          ),
          const Spacer(),
          Row(
            children: [
              const SizedBox(
                width: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3,
                  (index) => buildDot(index, currentIndex, context),
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  // currentIndex = currentIndex + 1;
                  pageController.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeOut,
                  );
                },
                child: SvgPicture.asset(
                  "assets/icons/next_icon.svg",
                  height: 50,
                  width: 50,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    )));
  }

  Container buildDot(int index, int curIndex, BuildContext context) {
    return Container(
      height: 6,
      width: curIndex == index ? 18 : 6,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: curIndex == index ? Colors.black : Colors.grey.shade300,
      ),
    );
  }
}
