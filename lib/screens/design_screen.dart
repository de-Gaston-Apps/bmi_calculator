import 'package:bmi_calculator/data/bmi_calculator.dart';
import 'package:bmi_calculator/data/bmi_error.dart';
import 'package:bmi_calculator/vars/globals.dart';
import 'package:bmi_calculator/widgets/weight_selector.dart';
import 'package:flutter/material.dart';

import '../widgets/height_selector.dart';
import '../widgets/scaffold_container.dart';

class DesignScreen extends StatefulWidget {
  const DesignScreen({super.key});

  @override
  State<DesignScreen> createState() => DesignScreenState();
}

class DesignScreenState extends State<DesignScreen> {
  double bmi = BMI_ERROR;
  double height = BMI_ERROR;
  double weight = BMI_ERROR;
  BmiCalculator bmiCalculator = BmiCalculator();

  void heightCallback(double h, bool isMetric) {
    if (!isMetric) {
      height = bmiCalculator.feetToMeters(h);
    }
    updateBmi();
  }

  void weightCallback(double w, bool isMetric) {
    if (!isMetric) {
      weight = bmiCalculator.lbToKg(w);
    }
    updateBmi();
  }

  void updateBmi() {
    double newBmi;
    try {
      newBmi = bmiCalculator.getBmi(weight, height);
    } on BmiException catch (e) {
      debugPrint(e.cause);
      return;
    }

    newBmi = makeBmiPretty(newBmi);

    setState(() {
      bmi = newBmi;
    });
  }

  double makeBmiPretty(double bmi) {
    // Round to one decimal point
    return (bmi * 10).round() / 10;
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffoldContainerBackground(
      showAppBar: true,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text(
            "BMI",
            style: TextStyle(
              color: MINT_GREEN,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "$bmi",
            style: const TextStyle(
              color: TEXT_LIGHT,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 40),
          Image.asset("images/bmi_bar.png"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              WeightSelector(weightCallback),
              HeightSelector(heightCallback),
            ],
          ),
        ],
      ),
    );
  }
}
