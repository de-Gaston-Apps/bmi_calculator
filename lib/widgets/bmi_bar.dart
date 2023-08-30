// ignore_for_file: constant_identifier_names
import 'package:bmi_calculator/vars/globals.dart';
import 'package:flutter/material.dart';

const double MIN_BMI = 16.5;
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

    //1 is the min bmi and 45 is the max bmi
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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey),
      ),
      constraints: const BoxConstraints(maxWidth: MESSAGE_MAX_WIDTH),
      width: double.infinity,
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              SizedBox(width: MediaQuery.of(context).size.width, height: 48),
              PositionedDirectional(
                top: 0,
                start: offset,
                child: Image.asset("assets/images/arrow.png"),
              ),
            ],
          ),
          Image.asset(
            "assets/images/bmi_bar.png",
            fit: BoxFit.fill,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
