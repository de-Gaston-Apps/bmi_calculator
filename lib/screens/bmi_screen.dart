import 'package:bmi_calculator/data/bmi_calculator.dart';
import 'package:bmi_calculator/data/bmi_error.dart';
import 'package:bmi_calculator/vars/globals.dart';
import 'package:bmi_calculator/widgets/bmi_bar.dart';
import 'package:bmi_calculator/widgets/bmi_message_box.dart';
import 'package:bmi_calculator/widgets/bmi_number.dart';
import 'package:bmi_calculator/widgets/bmi_title.dart';
import 'package:bmi_calculator/widgets/weight_selector.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/widgets/height_selector.dart';
import 'package:bmi_calculator/handlers/database_handler.dart';
import 'package:bmi_calculator/widgets/scaffold_container.dart';
import 'package:bmi_calculator/screens/chart_screen.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => BmiScreenState();
}

class BmiScreenState extends State<BmiScreen> {
  bool isWeightMetric = false;
  double bmi = DEFAULT_BMI;
  double height = BMI_ERROR;
  double weight = BMI_ERROR;
  BmiCalculator bmiCalculator = BmiCalculator();
  late DatabaseHandler databaseHandler;

  @override
  void initState() {
    super.initState();
    databaseHandler = DatabaseHandler.instance;
  }

  void heightCallback(double h, bool isMetric) {
    if (!isMetric) {
      height = bmiCalculator.feetToMeters(h);
    } else {
      height = h;
    }
    updateBmi();
  }

  void weightCallback(double w, bool isMetric) {
    isWeightMetric = isMetric;
    if (!isMetric) {
      weight = bmiCalculator.lbToKg(w);
    } else {
      weight = w;
    }
    updateBmi();
  }

  void updateBmi() {
    double newBmi;
    try {
      newBmi = bmiCalculator.getBmi(weight, height);
      newBmi = makeBmiPretty(newBmi);
      // Save BMI record if the calculation is valid
      if (newBmi != DEFAULT_BMI && weight > 0 && height > 0 && newBmi != BMI_ERROR && newBmi != LOW_BMI_ERROR && newBmi != HIGH_BMI_ERROR) {
        try {
          databaseHandler.saveBmiRecord(newBmi, weight);
        } catch (e) {
          debugPrint("Error saving BMI record: $e");
          // Optionally, show a SnackBar or other user notification
        }
      }
      bmi = newBmi;
    } on BmiException catch (e) {
      bmi = DEFAULT_BMI;
      debugPrint("There was some kind of error! ${e.cause}");
    }
    // Update the widgets
    setState(() {});
  }

  double makeBmiPretty(double bmi) {
    // Round to one decimal point
    return (bmi * 10).round() / 10;
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffoldContainerBackground(
      showAppBar: true,
      child: GestureDetector(
        //  THIS IS HOW YOU UNFOCUS THE KEYBOARD
        onTap: () {
          {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const BmiTitle(),
            BmiNumber(bmi: bmi),
            const SizedBox(height: BIGGER_PADDING_SIZE),
            Padding(
              padding: const EdgeInsets.only(
                left: BAR_PADDING_SIZE,
                right: BAR_PADDING_SIZE,
              ),
              child: BmiBar(bmi),
            ),
            const SizedBox(height: BIGGER_PADDING_SIZE),
            Container(
              constraints: const BoxConstraints(maxWidth: MESSAGE_MAX_WIDTH),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  WeightSelector(weightCallback),
                  HeightSelector(heightCallback),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(BIGGER_PADDING_SIZE),
              child: BmiMessageBox(bmi, height, isWeightMetric),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: DEFAULT_PADDING_SIZE),
              child: ElevatedButton.icon(
                icon: const Icon(Icons.history),
                label: const Text("View History"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ChartScreen()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
