import 'package:bmi_calculator/vars/globals.dart';
import 'package:flutter/material.dart';

class MessageBox extends StatefulWidget {
  final String message;
  const MessageBox(this.message, {super.key});

  @override
  State<StatefulWidget> createState() => MessageBoxState();
}

class MessageBoxState extends State<MessageBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey),
      ),
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
