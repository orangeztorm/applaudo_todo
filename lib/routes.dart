import 'package:applaudo_todo/features/features.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  const AppRouter._();

  static final navigatorKey = GlobalKey<NavigatorState>();

  static GoRouter router = GoRouter(
    routes: <GoRoute>[


      // Counter Page
      GoRoute(
        path: '/',
        builder: (context, state) => const CounterPage(),
        
      ),


      // // Home Module
      // GoRoute(
      //   path: '/home',
      //   builder: (context, state) => const HomePage(),
      // ),

      // // Settings Module
      // GoRoute(
      //   path: '/settings',
      //   builder: (context, state) => const SettingsPage(),
      // ),
    ],
    errorBuilder: (context, state) {
      return Text('Error Page : ${state.error}');
    },
    urlPathStrategy: UrlPathStrategy.path,
    debugLogDiagnostics: kDebugMode,
  );
}
