import 'package:flutter/cupertino.dart';
import 'package:stripe/app/views/create_order_view.dart';
import 'package:stripe/app/views/home_view.dart';
import 'package:stripe/app/views/summary_view.dart';

class Routes {
  static const HOME_VIEW_ROUTE = '/home';
  static const CREATE_ORDER_VIEW_ROUTE = '/createOrder';
  static const SUMMARY_VIEW_ROUTE = '/summary';

  static getAppRoutes(BuildContext context) {
    return {
        Routes.HOME_VIEW_ROUTE: (context) => const HomeView(),
        Routes.CREATE_ORDER_VIEW_ROUTE: (context) => const CreateOrderView(),
        Routes.SUMMARY_VIEW_ROUTE: (context) => const SummaryView(),
    };
  }
}