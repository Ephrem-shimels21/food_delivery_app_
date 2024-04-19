import 'package:flutter/material.dart';
import 'package:food_delivery_appb/auth/screens/login.dart';
import 'package:food_delivery_appb/auth/screens/forgot_password.dart';
import 'package:food_delivery_appb/auth/screens/otp_verfication.dart';
import 'package:food_delivery_appb/auth/screens/password_reset.dart';
import 'package:food_delivery_appb/auth/screens/signup.dart';
import 'package:food_delivery_appb/common/bottom_navigation.dart';
import 'package:food_delivery_appb/food/screens/food_detail.dart';
import 'package:food_delivery_appb/home/Screens/filtering_page.dart';
import 'package:food_delivery_appb/home/Screens/home_view.dart';
import 'package:food_delivery_appb/home/Screens/popular_menus.dart';
import 'package:food_delivery_appb/home/Screens/popular_restaurants.dart';
import 'package:food_delivery_appb/on_boarding/on_boarding_1.dart';
import 'package:food_delivery_appb/on_boarding/on_boarding_2.dart';
import 'package:food_delivery_appb/on_boarding/splash.dart';
import 'package:food_delivery_appb/restaurant/screens/restaurant_detail.dart';
import 'package:go_router/go_router.dart';

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
      GoRoute(
        path: '/filteringPage',
        builder: (context, state) => const FilterPage(),
      ),
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
      GoRoute(
          path: '/restaurantDetail/:name/:image',
          parentNavigatorKey: _rootNavigatorKey,
          pageBuilder: (context, state) {
            final name = state.pathParameters['name'];
            final image = state.pathParameters['image'];
            return MaterialPage(
                child: RestaurantDetail(title: name!, imagePath: image!));
          }),
      GoRoute(
          path: '/foodDetail/:name/:image',
          parentNavigatorKey: _rootNavigatorKey,
          pageBuilder: (context, state) {
            final name = state.pathParameters['name'];
            final image = state.pathParameters['image'];
            return MaterialPage(
                child: FoodDetail(title: name!, imagePath: image!));
          }),
      ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) => BottomBar(child: child),
          routes: [
            GoRoute(
              path: '/home',
              parentNavigatorKey: _shellNavigatorKey,
              builder: (context, state) => const HomeView(),
            ),
            GoRoute(
              path: '/popularRestaurants',
              parentNavigatorKey: _shellNavigatorKey,
              builder: (context, state) => const PopularRestaurants(),
            ),
            GoRoute(
              path: '/popularMenu',
              parentNavigatorKey: _shellNavigatorKey,
              builder: (context, state) => const PopularMenu(),
            )
          ])
    ]);
