import 'package:bmi_calculator/vars/globals.dart';
import 'package:flutter/material.dart';

class BmiMessageBox extends StatefulWidget {
  final String message;
  const BmiMessageBox(this.message, {super.key});

  @override
  State<StatefulWidget> createState() => BmiMessageBoxState();
}

class BmiMessageBoxState extends State<BmiMessageBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey),
      ),
      constraints: const BoxConstraints(maxWidth: MESSAGE_MAX_WIDTH),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(DEFALT_PADDING_SIZE),
        child: Text(
          widget.message,
          textAlign: TextAlign.center,
          softWrap: true,
        ),
      ),
    );
  }
}
