import 'package:bmi_calculator/data/bmi_calculator.dart';
import 'package:bmi_calculator/vars/globals.dart';
import 'package:flutter/material.dart';

class BmiMessageBox extends StatefulWidget {
  final double bmi;
  const BmiMessageBox(this.bmi, {super.key});

  @override
  State<StatefulWidget> createState() => BmiMessageBoxState();
}

class BmiMessageBoxState extends State<BmiMessageBox> {
  @override
  Widget build(BuildContext context) {
    BmiCalculator calculator = BmiCalculator();
    final String header = calculator.getBmiMessageHeader(widget.bmi);
    final String subtitle = calculator.getBmiMessageSubtitle(widget.bmi);
    final String text = calculator.getBmiMessageText(widget.bmi);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey),
      ),
      constraints: const BoxConstraints(maxWidth: MESSAGE_MAX_WIDTH),
      width: double.infinity,
      child: Column(
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.all(DEFALT_PADDING_SIZE),
            child: Text(
              header,
              textAlign: TextAlign.center,
              softWrap: true,
            ),
          ),
          // Subtitle and emojis
          Padding(
            padding: const EdgeInsets.all(DEFALT_PADDING_SIZE),
            child: Text(
              subtitle,
              textAlign: TextAlign.center,
              softWrap: true,
            ),
          ),
          // Main text
          Padding(
            padding: const EdgeInsets.all(DEFALT_PADDING_SIZE),
            child: Text(
              text,
              textAlign: TextAlign.center,
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
