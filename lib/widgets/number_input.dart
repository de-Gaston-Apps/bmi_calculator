import 'package:flutter/material.dart';

class NumberInput extends StatefulWidget {
  final Function(String) callback;
  final String title;
  const NumberInput(this.title, this.callback, {super.key});

  @override
  State<StatefulWidget> createState() => NumberInputState();
}

class NumberInputState extends State<NumberInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(widget.title),
        ),
        //
        TextField(
          keyboardType: TextInputType.number,
          onChanged: widget.callback,
          onSubmitted: widget.callback,
        ),
      ],
    );
  }
}
