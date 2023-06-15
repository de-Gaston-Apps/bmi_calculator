// ignore_for_file: non_constant_identifier_names, constant_identifier_names
import 'package:flutter/material.dart';

const String APP_NAME = "BMI Calculator";
const int SPLASH_SCREEN_TIMER = 3;

// Underweight = <18.5
// Normal weight = 18.5–24.9
// Overweight = 25–29.9
// Obesity = BMI of 30 or greater
enum BmiCategory { under, normal, over, obese }

const double BMI_ERROR = -1;

/*
*********************************** Colors ************************************* 
*/
final Color MINT_GREEN = Colors.green.shade300;

/// Light colors
const Color TEXT_LIGHT = Colors.black;
const MaterialColor PRIMARY_SWATCH_LIGHT = Colors.blueGrey;
const List<Color> GRADIENT_COLORS_LIGHT = [
  Color.fromARGB(255, 228, 235, 243),
  Color.fromARGB(255, 184, 191, 204),
];

/// Dark colors
const Color TEXT_DARK = Colors.white;
const MaterialColor PRIMARY_SWATCH_DARK = Colors.blueGrey;
const List<Color> GRADIENT_COLORS_DARK = [
  Color.fromARGB(255, 2, 6, 25),
  Color.fromARGB(255, 2, 5, 19),
];
/*
*********************************** Colors ************************************* 
*/