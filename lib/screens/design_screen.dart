import 'package:bmi_calculator/data/bmi_calculator.dart';
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
  String hTitleOne = "Feet", hTitleTwo = "Inches", wTitle = "Lbs";

  void callbackTest(double height) {}

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
          const Text(
            "20.2",
            style: TextStyle(
              color: TEXT_LIGHT,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 40),
          Image.asset("images/bmi_bar.png"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              WeightSelector(callbackTest),
              HeightSelector(callbackTest),
            ],
          ),
        ],
      ),
    );
  }
}
