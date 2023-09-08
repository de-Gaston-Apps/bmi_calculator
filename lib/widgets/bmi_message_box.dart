import 'package:bmi_calculator/data/bmi_calculator.dart';
import 'package:bmi_calculator/vars/globals.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BmiMessageBox extends StatefulWidget {
  final double bmi;
  final double height;
  final bool isMetric;
  const BmiMessageBox(this.bmi, this.height, this.isMetric, {super.key});

  @override
  State<StatefulWidget> createState() => BmiMessageBoxState();
}

class BmiMessageBoxState extends State<BmiMessageBox> {
  @override
  Widget build(BuildContext context) {
    BmiCalculator calculator = BmiCalculator();
    final String header = calculator.getBmiMessageHeader(widget.bmi);
    // final String subtitle = calculator.getBmiMessageSubtitle(widget.bmi);
    final String text = calculator.getBmiMessageText(widget.bmi);
    final String idealWeight = widget.bmi == DEFAULT_BMI
        ? ""
        : calculator.getIdealWeight(widget.height, widget.isMetric);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey),
      ),
      constraints: const BoxConstraints(maxWidth: MESSAGE_MAX_WIDTH),
      width: double.infinity,
      child: Column(
        children: [
          // ----------------- Header ----------------- //
          Padding(
            padding: const EdgeInsets.only(
              left: DEFALT_PADDING_SIZE,
              right: DEFALT_PADDING_SIZE,
            ),
            child: Text(
              header,
              textAlign: TextAlign.center,
              softWrap: true,
              style: GoogleFonts.robotoCondensed(
                color: const Color.fromARGB(255, 48, 47, 47),
                textStyle: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ),

          // ----------------- Subtitle BMI Range ----------------- //
          // Padding(
          //   padding: const EdgeInsets.only(
          //     left: DEFALT_PADDING_SIZE,
          //     right: DEFALT_PADDING_SIZE,
          //   ),
          //   child: Text(
          //     subtitle,
          //     textAlign: TextAlign.center,
          //     softWrap: true,
          //     style: Theme.of(context).textTheme.titleMedium,
          //   ),
          // ),

          // ----------------- Ideal Weight ----------------- //
          Padding(
            padding: const EdgeInsets.only(
              left: DEFALT_PADDING_SIZE,
              right: DEFALT_PADDING_SIZE,
            ),
            child: Text(
              idealWeight,
              textAlign: TextAlign.center,
              softWrap: true,
              style: GoogleFonts.roboto(
                color: Colors.black87,
                textStyle: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),

          // ----------------- Main text ----------------- //
          Padding(
            padding: const EdgeInsets.all(DEFALT_PADDING_SIZE),
            child: Text(
              "        $text",
              softWrap: true,
              style: GoogleFonts.roboto(
                color: Colors.black54,
                textStyle: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
