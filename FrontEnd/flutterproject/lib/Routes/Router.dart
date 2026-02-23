import 'package:flutter/material.dart';
import 'package:flutterproject/Pages/home.dart';
import 'package:go_router/go_router.dart';
import '../pages/login.dart';
import '../pages/register.dart';
import '../pages/about.dart';
import '../layouts/layout.dart';
/*import '../pages/profile_page.dart';*/

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/about',
      builder: (BuildContext context, GoRouterState state) =>
        AppLayout(child: AboutPage()),
    ),
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) =>
        AppLayout(child: LoginPage()),
    ),
    GoRoute(
      path: '/register',
      builder: (BuildContext context, GoRouterState state) =>
          AppLayout(child: RegisterPage()),
    ),
    
    GoRoute(
      path: '/profile/:username',
      builder: (BuildContext context, GoRouterState state) {
        final String username = state.pathParameters['username']!;
        return AppLayout(child: HomePage(username: username));
      },
    )
  ],
);
