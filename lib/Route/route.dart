import 'package:flutter/material.dart';
import 'package:food_delivery_appb/auth/screens/login.dart';
import 'package:food_delivery_appb/auth/screens/forgot_password.dart';
import 'package:food_delivery_appb/auth/screens/otp_verfication.dart';
import 'package:food_delivery_appb/auth/screens/password_reset.dart';
import 'package:food_delivery_appb/auth/screens/signup.dart';
import 'package:food_delivery_appb/common/bottom_navigation.dart';
import 'package:food_delivery_appb/on_boarding/on_boarding_1.dart';
import 'package:food_delivery_appb/on_boarding/on_boarding_2.dart';
import 'package:food_delivery_appb/on_boarding/splash.dart';
import 'package:go_router/go_router.dart';
import 'package:food_delivery_appb/home/home_view.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

GoRouter router = GoRouter(
    initialLocation: '/splash',
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: '/',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const StartupView(),
      ),
      GoRoute(
          path: '/splash',
          parentNavigatorKey: _rootNavigatorKey,
          builder: (context, state) => const StartupView()),
      GoRoute(
          path: '/onboarding1',
          builder: (context, state) => const FirstOnBoarding()),
      GoRoute(
          path: '/onboarding2',
          parentNavigatorKey: _rootNavigatorKey,
          builder: ((context, state) => const SecondOnBoarding())),
      GoRoute(
        path: '/signup',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const Signup(),
      ),
      GoRoute(path: '/login', builder: (context, state) => const Login()),
      // GoRoute(
      //   path: '/passwordReset',
      //   builder: (context, state) => const PasswordReset(),
      // )
      GoRoute(
        path: '/ForgotPassword',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const ForgotPassword(),
      ),
      GoRoute(
          path: '/otp-verification/:phone',
          parentNavigatorKey: _rootNavigatorKey,
          pageBuilder: (context, state) {
            final phone = state.pathParameters['phone'];
            return MaterialPage(child: OtpVerification(phoneNumber: phone!));
          }),
      GoRoute(
        path: '/password-reset',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const PasswordReset(),
      ),
      ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) => BottomBar(child: child),
          routes: [
            GoRoute(
              path: '/home',
              parentNavigatorKey: _shellNavigatorKey,
              builder: (context, state) => const HomeView(),
            )
          ])
    ]);
