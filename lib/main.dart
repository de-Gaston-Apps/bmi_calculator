import 'package:bmi_calculator/screens/splash_screen.dart';
import 'package:bmi_calculator/vars/strings.dart';
import 'package:bmi_calculator/vars/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  // Ensure that Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();
  // Lock the screen orientation
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
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
