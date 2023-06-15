import 'package:bmi_calculator/vars/globals.dart';
import 'package:bmi_calculator/widgets/number_input.dart';
import 'package:flutter/material.dart';

import '../widgets/scaffold_container.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => MainScreenState();
}

void onNumberInput(String value) {
  double? number = double.tryParse(value);
  if (number == null) {
    // There was an error
    return;
  }
  debugPrint("Number is $number");
}

class MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return MyScaffoldContainerBackground(
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
          const Padding(
            padding: EdgeInsets.only(
              left: 50,
              right: 50,
            ),
            child: NumberInput(onNumberInput),
          )
        ],
      ),
    );
  }
}
