import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../vars/globals.dart';

class WeightSelector extends StatefulWidget {
  /* Returns the weight (in kg) as a double that the user inputted. */
  final Function(double) callback;
  const WeightSelector(this.callback, {super.key});

  @override
  State<StatefulWidget> createState() => WeightSelectorState();
}

class WeightSelectorState extends State<WeightSelector> {
  bool isMetric = false;
  List<String> labels = [WEIGHT_IMPER_TEXT, WEIGHT_METRIC_TEXT];

  void textChanged(String s) {
    double? d = double.tryParse(s);
    if (d != null) {
      widget.callback(d);
      debugPrint("Sent $d to the callback function");
    } else {
      debugPrint("Could not parse $s into a double");
    }
  }

  void onSwitch(int? value) {
    debugPrint("Switch index is $value");
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
                    decoration: const InputDecoration(labelText: WEIGHT_TEXT),
                    keyboardType: TextInputType.number,
                    onChanged: textChanged,
                    onSubmitted: textChanged,
                  ),
                ),
                // FlutterSwitch(
                //   showOnOff: true,
                //   value: isMetric,
                //   onToggle: onSwitch,
                //   activeColor: MINT_GREEN,
                //   activeText: WEIGHT_METRIC_TEXT,
                //   inactiveText: WEIGHT_IMPER_TEXT,
                //   activeTextFontWeight: FontWeight.normal,
                //   inactiveTextFontWeight: FontWeight.normal,
                // ),
                ToggleSwitch(
                  isVertical: true,
                  radiusStyle: true,
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

class test {
  Color a = Colors.purpleAccent;
}
