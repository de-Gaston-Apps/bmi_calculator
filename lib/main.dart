import 'package:bmi_calculator/screens/splash_screen.dart';
import 'package:bmi_calculator/vars/globals.dart';
import 'package:bmi_calculator/vars/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_NAME,
      theme: MyTheme.themeDataLight,
      darkTheme: MyTheme.themeDataDark,
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
