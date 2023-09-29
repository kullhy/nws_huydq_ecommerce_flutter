import 'package:flutter/material.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/on_boarding/on_boarding_page.dart';



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const OnBoardingPage(),
    );
  }
}
