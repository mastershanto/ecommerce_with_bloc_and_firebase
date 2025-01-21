import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../presentations/screens/splash_screen.dart';

part 'routes.dart';

class RoutePages {
  static final Router = GoRouter(routes: [
    GoRoute(
      path: Routes.SPLASH_ROUTE,
      name: Routes.SPLASH_ROUTE,
      pageBuilder: (context, state) => const MaterialPage(
        child: SplashScreen(),
      ),
    ),
  ]);
}
