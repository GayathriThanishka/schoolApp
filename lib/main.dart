import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schoolapplication/providers/add_student_record_provider.dart';
import 'package:schoolapplication/providers/login_provider.dart';
import 'package:schoolapplication/routers/page_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginProvider>(
          create: (context) => LoginProvider(),
        ),
        ChangeNotifierProvider<StudentProvider>(
          create: (context) => StudentProvider(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(),
        routerConfig: goRouter,
      ),
    );
  }
}
