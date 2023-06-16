import 'package:bmi_calculator/data/bmi_calculator.dart';
import 'package:bmi_calculator/vars/globals.dart';
import 'package:bmi_calculator/widgets/number_input.dart';
import 'package:bmi_calculator/widgets/weight_type_selector.dart';
import 'package:flutter/material.dart';

import '../widgets/height_type_selector.dart';
import '../widgets/scaffold_container.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  String hTitleOne = "Feet", hTitleTwo = "Inches", wTitle = "Lbs";
  BmiCalculator bmiCalculator = BmiCalculator();
  double bmi = 0;

  void onHeightOneInput(String value) {
    double? number = double.tryParse(value);
    if (number == null) {
      return;
    }
    debugPrint("Height one is $number");
  }

  void onHeightTwoInput(String value) {
    double? number = double.tryParse(value);
    if (number == null) {
      return;
    }
    debugPrint("Height two is $number");
  }

  void onWeightInput(String value) {
    double? number = double.tryParse(value);
    if (number == null) {
      return;
    }
    debugPrint("Weight is $number");
  }

  void onHeightTypeChange(String value) {
    if (!HEIGHT_OPTIONS.contains(value)) {
      return; // error
    }
    debugPrint("HeightType is $value");
  }

  void onWeightTypeChange(String value) {
    if (!WEIGHT_OPTIONS.contains(value)) {
      return; // error
    }
    debugPrint("WeightType is $value");
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffoldContainerBackground(
      showAppBar: true,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "BMI Calculator",
            style: TextStyle(
              color: MINT_GREEN,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          NumberInput(hTitleOne, onHeightOneInput),
          HeightTypeSelector(onHeightTypeChange),
          NumberInput(hTitleTwo, onHeightTwoInput),
          NumberInput(wTitle, onWeightInput),
          WeightTypeSelector(onWeightTypeChange),
          Text(
            "$bmi",
            style: TextStyle(color: Colors.black, fontSize: 40),
          ),
        ],
      ),
    );
  }
}
