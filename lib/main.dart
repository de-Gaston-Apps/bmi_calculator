import 'package:bmi_calculator/screens/splash_screen.dart';
import 'package:bmi_calculator/vars/colors.dart';
import 'package:bmi_calculator/vars/strings.dart';
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
      theme: ThemeData(
        brightness: Brightness.light,
        colorSchemeSeed: MINT_GREEN,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorSchemeSeed: const Color.fromRGBO(86, 80, 14, 171),
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
