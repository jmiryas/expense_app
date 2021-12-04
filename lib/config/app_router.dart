import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/error_screen.dart';
import '../screens/summary_screen.dart';
import '../config/custom_app_route.dart';
import '../screens/tutorial_screen.dart';
import '../screens/expense_category_screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case CustomAppRoute.homeScreen:
        return CustomAppRoute.goToRoute(
            const HomeScreen(), CustomAppRoute.homeScreen);
      case CustomAppRoute.summaryScreen:
        return CustomAppRoute.goToRoute(
            const SummaryScreen(), CustomAppRoute.summaryScreen);
      case CustomAppRoute.expenseCategoryScreen:
        return CustomAppRoute.goToRoute(const ExpenseCategoryScreen(),
            CustomAppRoute.expenseCategoryScreen);
      case CustomAppRoute.tutorialScreen:
        return CustomAppRoute.goToRoute(
            const TutorialScreen(), CustomAppRoute.tutorialScreen);
      default:
        return CustomAppRoute.goToRoute(
            const ErrorScreen(), CustomAppRoute.errorScreen);
    }
  }
}
