import 'package:flutter/material.dart';

class BmiNumber extends StatelessWidget {
  final double bmi;
  const BmiNumber({super.key, required this.bmi});

  @override
  Widget build(BuildContext context) {
    return Text(
      "$bmi",
      style: Theme.of(context).textTheme.displayLarge,
    );
  }
}
