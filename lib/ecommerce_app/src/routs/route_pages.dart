import 'package:ecommerce_with_bloc_and_firebase/ecommerce_app/src/presentations/screens/home_screen.dart';
import 'package:ecommerce_with_bloc_and_firebase/ecommerce_app/src/presentations/screens/login_screen.dart';
import 'package:ecommerce_with_bloc_and_firebase/ecommerce_app/src/presentations/screens/signup_screen.dart';
import 'package:ecommerce_with_bloc_and_firebase/ecommerce_app/src/presentations/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../presentations/screens/splash_screen.dart';

part 'routes.dart';

class RoutePages {
  static final ROUTER = GoRouter(
    routes: [
      GoRoute(
        path: Routes.SPLASH_ROUTE,
        name: Routes.SPLASH_ROUTE,
        pageBuilder: (context, state) => const MaterialPage(
          child: SplashScreen(),
        ),
      ),
      GoRoute(
        path: Routes.HOME_ROUTE,
        name: Routes.HOME_ROUTE,
        pageBuilder: (context, state) =>
            const MaterialPage(child: HomeScreen()),
      ),
      GoRoute(
        path: Routes.LOGIN_ROUTE,
        name: Routes.LOGIN_ROUTE,
        pageBuilder:(context, state)=>MaterialPage(
          child: LoginScreen(),
        ),
      ),

      GoRoute(
        path: Routes.REGISTER_ROUTE,
        name: Routes.REGISTER_ROUTE,
        pageBuilder: (context, state)=> MaterialPage(
          child: SignupScreen(),
        ),
      ),
      GoRoute(
        path: Routes.WELCOME_ROUTE,
        name: Routes.WELCOME_ROUTE,
        pageBuilder: (context, state)=>MaterialPage(
          child: WelcomeScreen(),
        ),
      ),

    ],
  );
}
