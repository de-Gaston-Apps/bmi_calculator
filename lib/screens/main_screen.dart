import 'package:bmi_calculator/data/bmi_calculator.dart';
import 'package:bmi_calculator/vars/globals.dart';
import 'package:bmi_calculator/widgets/number_input.dart';
import 'package:bmi_calculator/widgets/weight_selector.dart';
import 'package:flutter/material.dart';

import '../widgets/height_selector.dart';
import '../widgets/scaffold_container.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  String hTitleOne = "Feet", hTitleTwo = "Inches", wTitle = "Lbs";
  BmiCalculator bmiCalculator = BmiCalculator();
  double height1 = BMI_ERROR, height2 = BMI_ERROR, weight = BMI_ERROR;

  void onHeightOneInput(String value) {
    double? h1 = double.tryParse(value);
    if (h1 == null) {
      debugPrint("The input $value is not a valid height1");
      return;
    }
    debugPrint("Height1 is $h1");
    height1 = h1;
  }

  void onHeightTwoInput(String value) {
    double? h2 = double.tryParse(value);
    if (h2 == null) {
      debugPrint("The input $value is not a valid height2");
      return;
    }
    debugPrint("Height two is $h2");
    height2 = h2;
  }

  void onWeightInput(String value) {
    double? w = double.tryParse(value);
    if (w == null) {
      debugPrint("The input $value is not a valid weight");
      return;
    }
    debugPrint("Weight is $w");
    weight = w;
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffoldContainerBackground(
      showAppBar: true,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "BMI",
            style: TextStyle(
              color: MINT_GREEN,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          // NumberInput(hTitleOne, onHeightOneInput),
          // NumberInput(hTitleTwo, onHeightTwoInput),
          // NumberInput(wTitle, onWeightInput),
          Text(
            "###",
            style: TextStyle(color: Colors.black, fontSize: 40),
          ),
        ],
      ),
    );
  }
}
