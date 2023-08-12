import 'package:flutter/material.dart';

import '../vars/globals.dart';

class HeightSelector extends StatefulWidget {
  /* Returns the height (in cm) as a double that the user inputted. */
  final Function(double) callback;
  const HeightSelector(this.callback, {super.key});

  @override
  State<StatefulWidget> createState() => HeightSelectorState();
}

class HeightSelectorState extends State<HeightSelector> {
  void textChanged(String s) {
    double? d = double.tryParse(s);
    if (d != null) {
      widget.callback(d);
      debugPrint("Sent $d to the callback");
    } else {
      debugPrint("Could not parse $s into a double");
    }
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
                SizedBox(
                  height: 50,
                  width: 150,
                  child: TextField(
                    decoration: const InputDecoration(labelText: HEIGHT_TEXT),
                    keyboardType: TextInputType.number,
                    onChanged: textChanged,
                    onSubmitted: textChanged,
                  ),
                ),
                Text("data"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
