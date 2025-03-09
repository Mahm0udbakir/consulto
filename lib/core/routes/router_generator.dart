import 'package:consulto/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:consulto/features/home/presentation/screens/contactUsScreen.dart';
import 'package:consulto/features/home/presentation/screens/debtPlanningScreen.dart';
import 'package:consulto/features/home/presentation/screens/investementScreen.dart';
import 'package:consulto/features/home/presentation/screens/mainScreen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'app_routes.dart';

final GoRouter router = GoRouter(
  initialLocation: AppRoutes.home, // ✅ Now MainScreen is the entry point
  routes: [
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => MainScreen(), // ✅ Load MainScreen first
    ),
    GoRoute(
      path: AppRoutes.settings,
      builder: (context, state) => InvestmentScreen(),
    ),
    GoRoute(
      path: AppRoutes.saved,
      builder: (context, state) => DebtPlanningScreen(),
    ),
    GoRoute(
      path: AppRoutes.downloads,
      builder: (context, state) => ContactUsScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const SignInScreen(),
    ),
  ],
  errorPageBuilder: (context, state) => const MaterialPage(
    child: Scaffold(
      body: Center(child: Text('Page Not Found', style: TextStyle(fontSize: 24))),
    ),
  ),
);
