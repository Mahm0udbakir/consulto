import 'package:consulto/features/auth/domain/repositories/auth_repositories.dart';
import 'package:consulto/features/auth/domain/usecases/auth_usecases.dart';
import 'package:consulto/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:consulto/features/home/presentation/screens/contactUsScreen.dart';
import 'package:consulto/features/home/presentation/screens/debtPlanningScreen.dart';
import 'package:consulto/features/home/presentation/screens/investementScreen.dart';
import 'package:consulto/features/home/presentation/screens/mainScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'app_routes.dart';

final GoRouter router = GoRouter(
  initialLocation: AppRoutes.login, // ✅ Start on login screen
  redirect: (context, state) {
    final isLoggedIn = FirebaseAuth.instance.currentUser != null;
    final loggingIn = state.matchedLocation == AppRoutes.login;

    if (!isLoggedIn && !loggingIn) {
      return AppRoutes.login; // Redirect to login if not logged in
    }
    if (isLoggedIn && loggingIn) {
      return AppRoutes.home; // Redirect to home if already logged in
    }
    return null;
  },
  routes: [
    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) => SignInScreen(
        signIn: SignIn(GetIt.I<AuthRepository>()),
        signUp: SignUp(GetIt.I<AuthRepository>()),
      ),
    ),
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => MainScreen(),
    ),
    GoRoute(
      path: AppRoutes.investement,
      builder: (context, state) => InvestmentScreen(),
    ),
    GoRoute(
      path: AppRoutes.deptPlanning,
      builder: (context, state) => DebtPlanningScreen(),
    ),
    GoRoute(
      path: AppRoutes.contactUs,
      builder: (context, state) => ContactUsScreen(),
    ),
  ],
  errorPageBuilder: (context, state) => const MaterialPage(
    child: Scaffold(
      body: Center(child: Text('Page Not Found', style: TextStyle(fontSize: 24))),
    ),
  ),
);
