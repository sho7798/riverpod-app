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
    return MaterialApp.router(
      routerConfig: GoRouter(
        routes: [
          GoRoute(
            path: '/',
            builder: (context, routeState) {
              return Home();
            },
          ),
          GoRoute(
            path: '/name/:name',
            builder: (context, routeState) {
              String? name = routeState.pathParameters['name'] ?? "";
              return CountryDetailPage(name: name);
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
      ),
    );
  }
}
