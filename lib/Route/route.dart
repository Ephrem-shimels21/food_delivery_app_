import 'package:flutter/material.dart';
import 'package:food_delivery_appb/auth/screens/login.dart';
import 'package:food_delivery_appb/auth/screens/forgot_password.dart';
import 'package:food_delivery_appb/auth/screens/otp_verfication.dart';
import 'package:food_delivery_appb/auth/screens/signup.dart';
import 'package:food_delivery_appb/on_boarding/on_boarding_1.dart';
import 'package:food_delivery_appb/on_boarding/on_boarding_2.dart';
import 'package:food_delivery_appb/on_boarding/splash.dart';
import 'package:go_router/go_router.dart';

GoRouter router = GoRouter(initialLocation: '/splash', routes: [
  GoRoute(path: '/', builder: (context, state) => const StartupView()),
  GoRoute(path: '/splash', builder: (context, state) => const StartupView()),
  GoRoute(
      path: '/onboarding1',
      builder: (context, state) => const FirstOnBoarding()),
  GoRoute(
      path: '/onboarding2',
      builder: ((context, state) => const SecondOnBoarding())),
  GoRoute(
    path: '/signup',
    builder: (context, state) => const Signup(),
  ),
  GoRoute(path: '/login', builder: (context, state) => const Login()),
  // GoRoute(
  //   path: '/passwordReset',
  //   builder: (context, state) => const PasswordReset(),
  // )
  GoRoute(
    path: '/passwordReset',
    builder: (context, state) => const PasswordReset(),
  ),
  GoRoute(
      path: '/otp-verification/:phone',
      pageBuilder: (context, state) {
        final phone = state.pathParameters['phone'];
        return MaterialPage(child: OtpVerification(phoneNumber: phone!));
      }),
]);
