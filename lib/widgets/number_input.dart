import 'package:flutter/material.dart';

class NumberInput extends StatefulWidget {
  final Function(String) callback;
  const NumberInput(this.callback, {super.key});

  @override
  State<StatefulWidget> createState() => NumberInputState();
}

class NumberInputState extends State<NumberInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      onChanged: widget.callback,
      onSubmitted: widget.callback,
    );
  }
}
