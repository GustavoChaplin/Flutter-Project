import 'package:flutter/material.dart';
import 'package:flutter_app/states/user_state.dart';
import 'package:provider/provider.dart';
import 'routes/router.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => UserState(),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter App',
      routerConfig: router,
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}