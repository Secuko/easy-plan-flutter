import 'package:easy_plan/screens/login_screen.dart';
import 'package:easy_plan/screens/main_page_screen.dart';
import 'package:easy_plan/screens/registration_screen.dart';
import 'package:easy_plan/utils/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Easy plan',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const MainPageScreen(),
        '/registration_screen': (context) => const RegistrationWindow(),
        '/login_screen': (context) => const LoginWindow(),
      },
      theme: ThemeData(
        fontFamily: 'RobotoSlab',
        scaffoldBackgroundColor: AppColors.white,
      ),
    );
  }
}

