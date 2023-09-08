// ignore_for_file: non_constant_identifier_names, constant_identifier_names
import 'package:flutter/material.dart';

const int SPLASH_SCREEN_TIMER = 1;
const int ANIMATION_DURATION_MILLIS = 200;
const double ZOOM_IN_SCALE = 1.2;

const double DEFALT_PADDING_SIZE = 10;
const double BIGGER_PADDING_SIZE = DEFALT_PADDING_SIZE * 2;
const double BAR_PADDING_SIZE = DEFALT_PADDING_SIZE * 2;
const double MESSAGE_MAX_WIDTH = 600;

const double BAR_HEIGHT = 32;
const double ARROW_HEIGHT = 48;
const double ARROW_WIDTH = 24;
const double ARROW_SIZE = 30;
const double ARROW_LINE_WIDTH = 3;

const double BOX_BORDER_WIDTH = 0.5;
const double BOX_BLUR_RADIUS = 5;
const double BOX_BORDER_RADIUS = 5;

const double TEXT_INPUT_HEIGHT = 50;
const double TEXT_INPUT_WIDTH = 100;

const int RANGE_BMI_UNDER = 20;
const int RANGE_BMI_NORM = 65;
const int RANGE_BMI_OVER = 50;
const int RANGE_BMI_OBESE1 = 50;
const int RANGE_BMI_OBESE2 = 50;

const double BAR_MIN_BMI = 16.5;
const double BAR_MAX_BMI = 40;

const double BMI_ERROR = -1;
const double DEFAULT_BMI = 0.0;

const String ANDROID_STORE_URL =
    "https://play.google.com/store/apps/dev?id=8230997084127446105";
const String IOS_STORE_URL =
    "https://apps.apple.com/us/developer/jonathan-de-gaston/id1656029142";
const String CDC_BMI_ABOUT_URL =
    "https://www.cdc.gov/healthyweight/assessing/bmi/adult_bmi/index.html";

/*
*********************************** Colors ************************************* 
*/
final Color MINT_GREEN = Colors.green.shade300;
final Color SOFT_GREY = Colors.grey.shade300;

const Color UNDER_BMI_COLOR = Colors.lightBlue;
const Color NORM_BMI_COLOR = Colors.lightGreen;
const Color OVER_BMI_COLOR = Colors.yellow;
const Color OBESE1_BMI_COLOR = Colors.orange;
const Color OBESE2_BMI_COLOR = Colors.red;

/// Light colors
const Color TEXT_LIGHT = Colors.black;
const MaterialColor PRIMARY_SWATCH_LIGHT = Colors.blueGrey;
const List<Color> GRADIENT_COLORS_LIGHT = [
  Color.fromARGB(255, 250, 252, 255),
  Color.fromARGB(255, 210, 211, 212),
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
