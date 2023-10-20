import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nws_huydq_ecommerce_flutter/models/detail_categories/detail_category.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/check_home/check_home_cubit.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/detail_categories/detail_category_page.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/home/home_pages.dart';

class CheckHomePage extends StatelessWidget {
  const CheckHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return CheckHomeCubit();
      },
      child: const CheckHomeView(),
    );
  }
}

class CheckHomeView extends StatefulWidget {
  const CheckHomeView({super.key});

  @override
  State<CheckHomeView> createState() => _CheckHomeViewState();
}

class _CheckHomeViewState extends State<CheckHomeView> {
  late CheckHomeCubit _checkHomeCubit;
  @override
  void initState() {
    super.initState();
    _checkHomeCubit = context.read<CheckHomeCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckHomeCubit, CheckHomeState>(
        builder: (context, state) {
      return Scaffold(
        body: _checkHomeCubit.checkHome(),
      );
    });
  }
}
