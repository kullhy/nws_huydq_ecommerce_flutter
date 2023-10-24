import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nws_huydq_ecommerce_flutter/blocs/app_cubit.dart';
import 'package:nws_huydq_ecommerce_flutter/router/router_config.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/check_home/check_home_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>(create: (context) {
          return AppCubit();
        }),
        BlocProvider<CheckHomeCubit>(create: (context) {
          return CheckHomeCubit();
        }),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
