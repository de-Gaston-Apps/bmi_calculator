import 'package:bmi_calculator/vars/colors.dart';
import 'package:bmi_calculator/vars/strings.dart';
import 'package:flutter/material.dart';

class BmiTitle extends StatelessWidget {
  const BmiTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      BMI_STRING,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 48,
        color: MINT_GREEN,
      ),
    );
  }
}
