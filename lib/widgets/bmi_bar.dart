// ignore_for_file: constant_identifier_names
import 'package:bmi_calculator/vars/globals.dart';
import 'package:bmi_calculator/widgets/bmi_arrow.dart';
import 'package:bmi_calculator/widgets/color_bar.dart';
import 'package:flutter/material.dart';

const double MIN_BMI = 15;
const double MAX_BMI = 40;

class BmiBar extends StatefulWidget {
  final double bmi;
  const BmiBar(this.bmi, {super.key});

  @override
  State<StatefulWidget> createState() => BmiBarState();
}

class BmiBarState extends State<BmiBar> {
  double calculateOffset() {
    double width = MediaQuery.of(context).size.width;
    double barWidth = width - BAR_PADDING_SIZE * 2;

    double min = 0 - ARROW_WIDTH / 2; // 0 - (value) to make it negative
    double max = barWidth - ARROW_WIDTH / 2;
    if (max > MESSAGE_MAX_WIDTH) {
      max = MESSAGE_MAX_WIDTH - ARROW_WIDTH / 2;
    }

    if (widget.bmi <= MIN_BMI) {
      return min;
    }
    if (widget.bmi >= MAX_BMI) {
      return max;
    }

    double offset = (barWidth / (MAX_BMI - MIN_BMI)) * (widget.bmi - MIN_BMI) -
        ARROW_WIDTH / 2;
    return offset;
  }

  @override
  Widget build(BuildContext context) {
    double offset = calculateOffset();

    return Container(
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(5),
      //   border: Border.all(color: Colors.grey),
      // ),
      constraints: const BoxConstraints(maxWidth: MESSAGE_MAX_WIDTH),
      width: double.infinity,
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              // SizedBox(
              //   width: MediaQuery.of(context).size.width,
              //   height: ARROW_HEIGHT,
              // ),
              ColorBar(bmi: widget.bmi),
              PositionedDirectional(
                top: (BAR_HEIGHT * ZOOM_IN_SCALE - ARROW_HEIGHT) / 2,
                start: offset,
                child: BmiArrow(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
