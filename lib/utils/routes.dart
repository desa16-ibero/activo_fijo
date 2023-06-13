import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../ui/home/fixed_asset_screen.dart';
import '../ui/home/home_screen.dart';
import '../ui/login/login_screen.dart';
import '../ui/splash/splash_screen.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'login',
          builder: (BuildContext context, GoRouterState state) {
            return const LoginScreen();
          },
        ),
        GoRoute(
          path: 'home',
          builder: (BuildContext context, GoRouterState state) {
            return const HomeScreen();
          },
          routes: <RouteBase>[
            GoRoute(
              path: 'fixedAsset',
              builder: (BuildContext context, GoRouterState state) {
                return const FixedAssetScreen();
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
