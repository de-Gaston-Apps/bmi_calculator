import 'package:flutter/material.dart';
import '../vars/globals.dart';

class MyTheme {
/*
********************************* LIGHT MODE *********************************** 
*/
  static ThemeData themeDataLight = ThemeData(
    brightness: Brightness.light,
    primarySwatch: PRIMARY_SWATCH_LIGHT,
    scaffoldBackgroundColor: Colors.transparent,
    textTheme: const TextTheme(
      displaySmall: TextStyle(
        color: TEXT_LIGHT,
        fontSize: 15,
      ),
      displayMedium: TextStyle(
        color: TEXT_LIGHT,
        fontSize: 22,
      ),
      displayLarge: TextStyle(
        color: TEXT_LIGHT,
        fontSize: 40,
        fontWeight: FontWeight.w500,
      ),
    ),
  );

  static BoxDecoration lightBackgroundBoxDecoration = const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      // Add one stop for each color. Stops should increase from 0 to 1
      // stops: const [0.1, 0.5, 0.7, 0.9],
      colors: GRADIENT_COLORS_LIGHT,
    ),
  );

/*
********************************* DARK MODE *********************************** 
*/
  static ThemeData themeDataDark = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: PRIMARY_SWATCH_DARK,
    scaffoldBackgroundColor: Colors.transparent,
    textTheme: const TextTheme(
      displaySmall: TextStyle(
        color: TEXT_DARK,
        fontSize: 15,
      ),
      displayMedium: TextStyle(
        color: TEXT_DARK,
        fontSize: 22,
      ),
      displayLarge: TextStyle(
        color: TEXT_DARK,
        fontSize: 40,
        fontWeight: FontWeight.w500,
      ),
    ),
  );

  static BoxDecoration darkBackgroundBoxDecoration = const BoxDecoration(
    // Box decoration takes a gradient
    gradient: LinearGradient(
      // Where the linear gradient begins and ends
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      // Add one stop for each color. Stops should increase from 0 to 1
      // stops: [0.1, 0.5, 0.7, 0.9],
      colors: GRADIENT_COLORS_DARK,
    ),
  );
}
