import 'package:flutter/material.dart';
import 'package:stripe/app/app_widget.dart';
import 'package:stripe/app/utils/router.dart';

void main() {
  runApp(const AppWidget(
    initRouter: Routes.HOME_VIEW_ROUTE,
  ));
}

