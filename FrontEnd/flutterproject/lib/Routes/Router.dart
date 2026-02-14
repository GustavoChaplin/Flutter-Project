import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path:'/',
      builder: (BuildContext context, GoRouterState state) => const AppLayout(child: AboutPage())
      ),
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) => AppLayout(child: LoginPage())
      ),
      GoRoute(
        path: '/register',
        builder: (BuildContext context, GoRouterState state) => AppLayout(child: RegisterPage())
      ),
      GoRoute(
        path: '/main/:username',
        builder: (BuildContext context, GoRouterState state) => {
          final String username = state.pathparameters['username']!;
          return AppLayout(child: HomePage());
        }
      )
      
  ]
);  