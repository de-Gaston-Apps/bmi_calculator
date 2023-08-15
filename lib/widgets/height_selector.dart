// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:bmi_calculator/data/bmi_calculator.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../vars/globals.dart';

class HeightSelector extends StatefulWidget {
  final Function(double, bool) callback;
  const HeightSelector(this.callback, {super.key});

  @override
  State<StatefulWidget> createState() => HeightSelectorState();
}

class HeightSelectorState extends State<HeightSelector> {
  bool isMetric = false;
  int toggleIndex = 0;
  final int IMPER_INDEX = 0;
  final int METRIC_INDEX = 1;
  List<String> labels = [HEIGHT1_IMPER_TEXT, HEIGHT1_METRIC_TEXT];
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  void textChanged(String s) {
    // Ignore the actual input because we actually need to check both
    updateHeight();
  }

  void updateHeight() {
    double totalHeight = 0;
    // The first height input will be feet or meters
    double? height1 = double.tryParse(controller1.text);
    if (height1 != null) {
      totalHeight += height1;
    }
    // The second height input will be inches or centimeters
    double? height2 = double.tryParse(controller2.text);
    if (height2 != null) {
      if (!isMetric) {
        totalHeight += height2 / INCHES_PER_FOOT;
      } else {
        totalHeight += height2 / CM_PER_METER;
      }
    }
    widget.callback(totalHeight, isMetric);
    debugPrint("Sent $totalHeight (height) to the callback");
  }

  void onSwitch(int? value) {
    debugPrint("Switch index is $value");
    isMetric = (value == METRIC_INDEX);
    textChanged(controller1.text);
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
            const Text(HEIGHT_TEXT), // Subtitle for the box
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 150,
                      child: TextField(
                        controller: controller1,
                        decoration: InputDecoration(
                          labelText: isMetric
                              ? HEIGHT1_LABEL_METRIC
                              : HEIGHT1_LABEL_IMPER,
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: textChanged,
                        onSubmitted: textChanged,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: 150,
                      child: TextField(
                        controller: controller2,
                        decoration: InputDecoration(
                          labelText: isMetric
                              ? HEIGHT2_LABEL_METRIC
                              : HEIGHT2_LABEL_IMPER,
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: textChanged,
                        onSubmitted: textChanged,
                      ),
                    ),
                  ],
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
