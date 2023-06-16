import 'package:flutter/material.dart';

class HeightTypeSelector extends StatefulWidget {
  final Function(String) callback;
  const HeightTypeSelector(this.callback, {super.key});

  @override
  State<StatefulWidget> createState() => HeightTypeSelectorState();
}

class HeightTypeSelectorState extends State<HeightTypeSelector> {
  @override
  Widget build(BuildContext context) {
    return Text("Selector");
  }
}
