import 'package:flutter/material.dart';
import 'package:schoolapplication/pages/splash.dart';
import 'package:schoolapplication/routers/page_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(),
      routerConfig: goRouter,

    );
  }
}
