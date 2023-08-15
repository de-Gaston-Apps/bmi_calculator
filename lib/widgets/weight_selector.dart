// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../vars/globals.dart';

class WeightSelector extends StatefulWidget {
  final Function(double, bool) callback;
  const WeightSelector(this.callback, {super.key});

  @override
  State<StatefulWidget> createState() => WeightSelectorState();
}

class WeightSelectorState extends State<WeightSelector> {
  bool isMetric = false;
  int toggleIndex = 0;
  final int IMPER_INDEX = 0;
  final int METRIC_INDEX = 1;
  List<String> labels = [WEIGHT_IMPER_TEXT, WEIGHT_METRIC_TEXT];
  TextEditingController controller = TextEditingController();

  void textChanged(String s) {
    double? weight = double.tryParse(s);
    if (weight != null) {
      widget.callback(weight, isMetric);
      debugPrint("Sent $weight (weight) to the callback");
    } else {
      debugPrint("Could not parse $s into a double");
    }
  }

  void onSwitch(int? value) {
    debugPrint("Switch index is $value");
    isMetric = (value == METRIC_INDEX);
    textChanged(controller.text);
    setState(() {
      toggleIndex = value ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.black),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Text(WEIGHT_TEXT), // Subtitle for the box
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 50,
                  width: 150,
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      labelText:
                          isMetric ? WEIGHT_LABEL_METRIC : WEIGHT_LABEL_IMPER,
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: textChanged,
                    onSubmitted: textChanged,
                  ),
                ),
                ToggleSwitch(
                  isVertical: true,
                  radiusStyle: true,
                  initialLabelIndex: toggleIndex,
                  inactiveBgColor: SOFT_GREY,
                  activeBgColors: [
                    [MINT_GREEN],
                    [MINT_GREEN],
                  ],
                  labels: labels,
                  onToggle: onSwitch,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
