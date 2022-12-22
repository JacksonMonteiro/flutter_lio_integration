// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:stripe/app/utils/router.dart';
import 'package:stripe/app/views/create_order_view.dart';
import 'package:stripe/app/views/home_view.dart';

class AppWidget extends StatelessWidget {
  final String initRouter;
  const AppWidget({super.key, required this.initRouter});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: initRouter,
      routes: Routes.getAppRoutes(context)
    );
  }
}