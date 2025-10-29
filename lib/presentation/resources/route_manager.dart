import 'package:app_with_riverpod/app/constant.dart';
import 'package:app_with_riverpod/ui/pages/detail_page.dart';
import 'package:app_with_riverpod/ui/pages/home.dart';
import 'package:app_with_riverpod/ui/widgets/failed_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static const String splashRoute = "/splash";
  static const String onBoardingRoute = "/onBoarding";
  static const String homeRoute = "/";
  static const String registerRoute = "/register";
  static const String loginRoute = "/login";
  static const String forgotPasswordRoute = "/forgotPaswword";
  static const String detailRoute = "/detail";
}

final routeGenerator = GoRouter(
  routes: [
    GoRoute(
      path: Routes.homeRoute,
      builder: (context, routeState) {
        return Home();
      },
    ),
    GoRoute(
      path: '${Routes.detailRoute}/:$countryName',
      builder: (context, routeState) {
        //passing data (parameters)
        String? firstParam = routeState.pathParameters[countryName] ?? "";
        String? secondParam = routeState.uri.queryParameters[official] ?? "";
        return CountryDetailPage(
          countryName: firstParam,
          official: secondParam,
        );
      },
    ),
  ],
  errorBuilder: (context, state) {
    return Material(
      child: FailedWidget(
        errorMessage: 'Invalid Route',
        tryAgain: () {
          context.go('/');
        },
      ),
    );
  },
);
