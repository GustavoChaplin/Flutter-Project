import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../pages/login.dart';
/*import '../pages/register_page.dart';
import '../pages/about_page.dart';
*/import '../layouts/layout.dart';
/*import '../pages/profile_page.dart';*/

final GoRouter router = GoRouter(
  routes: [
    /*GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) =>
          const AppLayout(child: AboutPage()),
    ),*/
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) =>
        AppLayout(child: LoginPage()),
    )/*,
    GoRoute(
      path: '/register',
      builder: (BuildContext context, GoRouterState state) =>
          AppLayout(child: RegisterPage()),
    ),
    GoRoute(
      path: '/profile/:username',
      builder: (BuildContext context, GoRouterState state) {
        final String username = state.pathParameters['username']!;
        return AppLayout(child: ProfilePage(username: username));
      },
    ),*/
  ],
);
