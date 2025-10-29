import 'package:app_with_riverpod/ui/pages/detail_page.dart';
import 'package:app_with_riverpod/ui/pages/home.dart';
import 'package:app_with_riverpod/ui/widgets/failed_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: goRouter);
  }
}

final goRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, routeState) {
        return Home();
      },
    ),
    GoRoute(
      path: '/detail/:countryName',
      builder: (context, routeState) {
        //passing data (parameters)
        String? countryName = routeState.pathParameters['countryName'] ?? "";
        String? official = routeState.uri.queryParameters['official'] ?? "";
        return CountryDetailPage(countryName: countryName, official: official);
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
