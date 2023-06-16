import 'package:flutter/material.dart';

class WeightTypeSelector extends StatefulWidget {
  final Function(String) callback;
  const WeightTypeSelector(this.callback, {super.key});

  @override
  State<StatefulWidget> createState() => WeightTypeSelectorState();
}

class WeightTypeSelectorState extends State<WeightTypeSelector> {
  @override
  Widget build(BuildContext context) {
    return Text("Weight selector");
  }
}
