import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_text_styles.dart';
import 'package:nws_huydq_ecommerce_flutter/models/enums/load_status.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/sign_up/sign_up_cubit.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/sign_up/sign_up_navigator.dart';

class SuccessfulPage extends StatelessWidget {
  const SuccessfulPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return SignUpCubit(navigator: SignUpNavigator(context: context));
      },
      child: const SuccessfulView(),
    );
  }
}

class SuccessfulView extends StatefulWidget {
  const SuccessfulView({super.key});

  @override
  State<SuccessfulView> createState() => _SuccessfulViewState();
}

class _SuccessfulViewState extends State<SuccessfulView> {
  late SignUpCubit _signUpCubit;

  @override
  void initState() {
    super.initState();
    _signUpCubit = context.read<SignUpCubit>();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: size.height * 0.35,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.check_circle_outline_outlined,
                  color: Colors.green,
                  size: 56,
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Successful!",
                  style: AppTextStyle.blackS24W900,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: Text(
                    "You have successfully registered in our app and start workin in it",
                    style: AppTextStyle.greyS14,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.25,
          ),
          BlocBuilder<SignUpCubit, SignUpState>(builder: (context, state) {
            return InkWell(
              onTap: _signUpCubit.openMainPage,
              child: Container(
                width: double.infinity,
                height: 46,
                margin: const EdgeInsets.only(left: 20, right: 20),
                // margin: const EdgeInsets.only(bottom: 50),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.black),
                child: Center(
                  child: state.loadStatus == LoadStatus.loading
                      ? const CircularProgressIndicator()
                      : Text(
                          "Start Shoping",
                          style: AppTextStyle.whiteS16Bold,
                        ),
                ),
              ),
            );
          }),
          SizedBox(
            height: size.height * 0.1,
          ),
        ],
      ),
    );
  }
}
