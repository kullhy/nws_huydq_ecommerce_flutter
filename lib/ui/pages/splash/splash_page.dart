import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_images.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/splash/splash_cubit.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/splash/splash_navigator.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return SplashCubit(navigator: SplashNavigator(context: context));
      },
      child: const SplashView(),
    );
  }
}

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late SplashCubit _splashCubit;

  @override
  void initState() {
    super.initState();
    _splashCubit = context.read<SplashCubit>();
    _splashCubit.checkLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            AppImages.splashScreen,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _splashCubit.close();
    super.dispose();
  }
}
