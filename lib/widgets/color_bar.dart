import 'package:bmi_calculator/data/bmi_calculator.dart';
import 'package:bmi_calculator/vars/globals.dart';
import 'package:flutter/material.dart';

class ColorBar extends StatelessWidget {
  final double bmi;
  const ColorBar({super.key, required this.bmi});

  Widget buildBox(int flex, Color color) {
    BmiCategory category = BmiCalculator().getCategory(bmi);
    double scale = 1.0;
    if (category == BmiCategory.veryUnder && color == UNDER_BMI_COLOR ||
        category == BmiCategory.obese3 && color == OBESE2_BMI_COLOR ||
        category == BmiCategory.under && color == UNDER_BMI_COLOR ||
        category == BmiCategory.normal && color == NORM_BMI_COLOR ||
        category == BmiCategory.over && color == OVER_BMI_COLOR ||
        category == BmiCategory.obese1 && color == OBESE1_BMI_COLOR ||
        category == BmiCategory.obese2 && color == OBESE2_BMI_COLOR) {
      scale = ZOOM_IN_SCALE;
    }

    flex = (flex * scale).toInt();

    return Expanded(
      flex: flex,
      child: Container(
        height: BAR_HEIGHT * scale,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: color,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          buildBox(RANGE_BMI_UNDER, UNDER_BMI_COLOR),
          buildBox(RANGE_BMI_NORM, NORM_BMI_COLOR),
          buildBox(RANGE_BMI_OVER, OVER_BMI_COLOR),
          buildBox(RANGE_BMI_OBESE1, OBESE1_BMI_COLOR),
          buildBox(RANGE_BMI_OBESE2, OBESE2_BMI_COLOR),
        ],
      ),
    );
  }
}
