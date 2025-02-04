import 'package:ecommerce_with_bloc_and_firebase/ecommerce_app/src/data/services/auth_service.dart';
import 'package:ecommerce_with_bloc_and_firebase/ecommerce_app/src/presentations/screens/screens.dart';
import 'package:ecommerce_with_bloc_and_firebase/ecommerce_app/src/presentations/screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'routes.dart';

class RoutePages {
  // for using GoRouter,
  // use the "context.goNamed()" for completely replaced, not cable to back again
  // use the "context.pushNamed()" , if you need to back this file again.
  // use the "goNamed" for completely replaced

  static final authService = AuthService();
  static final ROUTER = GoRouter(
    redirect: (context, state) {
      if (authService.checkLoginStatus()) {
        if (state.fullPath == Routes.LOGIN_ROUTE ||
            state.fullPath == Routes.REGISTER_ROUTE ||
            state.fullPath == Routes.WELCOME_ROUTE) {
          return Routes.HOME_ROUTE;
        } else {
          return state.fullPath;
        }
      } else {
        if (state.fullPath == Routes.LOGIN_ROUTE ||
            state.fullPath == Routes.REGISTER_ROUTE) {
          return state.fullPath;
        }
        return Routes.WELCOME_ROUTE;
      }
    },
    routes: [
      //forgot_password
      GoRoute(
        path: Routes.FORGOT_PASSWORD_ROUTE,
        name: Routes.FORGOT_PASSWORD_ROUTE,
        pageBuilder: (context, state) => MaterialPage(
          child: ForgotPasswordScreen(),
        ),
      ),

      //new_password
      GoRoute(
        path: Routes.NEW_PASSWORD_ROUTE,
        name: Routes.NEW_PASSWORD_ROUTE,
        pageBuilder: (context, state) =>
            const MaterialPage(child: NewPasswordScreen()),
      ),

      //resister
      GoRoute(
        path: Routes.REGISTER_ROUTE,
        name: Routes.REGISTER_ROUTE,
        pageBuilder: (context, state) => MaterialPage(
          child: SignUpScreen(),
        ),
      ),

      //splash
      GoRoute(
        path: Routes.SPLASH_ROUTE,
        name: Routes.SPLASH_ROUTE,
        pageBuilder: (context, state) => const MaterialPage(
          child: SplashScreen(),
        ),
      ),

      //welcome
      GoRoute(
        path: Routes.WELCOME_ROUTE,
        name: Routes.WELCOME_ROUTE,
        pageBuilder: (context, state) => MaterialPage(
          child: WelcomeScreen(),
        ),
      ),

//_________________________________________________________________________//

      //home
      GoRoute(
        path: Routes.ADD_TO_CART_ROUTE,
        name: Routes.ADD_TO_CART_ROUTE,
        pageBuilder: (context, state) =>
            const MaterialPage(child: AddCartScreen()),
      ),
      //home
      GoRoute(
        path: Routes.ADD_NEW_PAYMENT_CARD_ROUTE,
        name: Routes.ADD_NEW_PAYMENT_CARD_ROUTE,
        pageBuilder: (context, state) =>
            const MaterialPage(child: AddNewPaymentCardScreen()),
      ),
      //home
      GoRoute(
        path: Routes.ADD_REVIEW_ROUTE,
        name: Routes.ADD_REVIEW_ROUTE,
        pageBuilder: (context, state) =>
            const MaterialPage(child: AddReviewScreen()),
      ),
      GoRoute(
        path: Routes.ADDRESS_ROUTE,
        name: Routes.ADDRESS_ROUTE,
        pageBuilder: (context, state) =>
            const MaterialPage(child: AddressScreen()),
      ),
      GoRoute(
        path: Routes.CART_ROUTE,
        name: Routes.CART_ROUTE,
        pageBuilder: (context, state) =>
            const MaterialPage(child: CartScreen()),
      ),
      GoRoute(
        path: Routes.HOME_ROUTE,
        name: Routes.HOME_ROUTE,
        pageBuilder: (context, state) =>
            const MaterialPage(child: HomeScreen()),
      ),
      GoRoute(
        path: Routes.ORDER_CONFIRMED_ROUTE,
        name: Routes.ORDER_CONFIRMED_ROUTE,
        pageBuilder: (context, state) =>
            const MaterialPage(child: OrderConfirmedScreen()),
      ),
      GoRoute(
        path: Routes.PAYMENT_ROUTE,
        name: Routes.PAYMENT_ROUTE,
        pageBuilder: (context, state) =>
            const MaterialPage(child: PaymentScreen()),
      ),
      GoRoute(
        path: Routes.REVIEWS_ROUTE,
        name: Routes.REVIEWS_ROUTE,
        pageBuilder: (context, state) =>
            const MaterialPage(child: ReviewsScreen()),
      ),
      ShellRoute(
          builder: (context, state, child) => Wrapper(child: child),
          routes: [
            //login
            GoRoute(
              path: Routes.LOGIN_ROUTE,
              name: Routes.LOGIN_ROUTE,
              pageBuilder: (context, state) => MaterialPage(
                child: LoginScreen(),
              ),
            ),
          ]),
    ],
  );
}
