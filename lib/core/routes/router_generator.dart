import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'app_routes.dart';


final GoRouter router = GoRouter(
  initialLocation: AppRoutes.home,
  routes: [
    // GoRoute(path: AppRoutes.home, builder: (context, state) => HomeScreen()),
    // GoRoute(path: AppRoutes.downloads, builder: (context, state) => DownloadsScreen()),
    // GoRoute(path: AppRoutes.saved, builder: (context, state) => SavedScreen()),
    // GoRoute(path: AppRoutes.settings, builder: (context, state) => SettingsScreen()),
  ],
  errorPageBuilder: (context, state) => const MaterialPage(
    child: Scaffold(
      body: Center(child: Text('Page Not Found', style: TextStyle(fontSize: 24))),
    ),
  ),
);
