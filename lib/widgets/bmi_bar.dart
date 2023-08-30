// ignore_for_file: constant_identifier_names
import 'package:bmi_calculator/vars/globals.dart';
import 'package:flutter/material.dart';

const int MIN_BMI = 1;
const int MAX_BMI = 45;

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

    double min = 0 - ARROW_WIDTH / 2; // 0 - (something) to make it negative
    double max = barWidth - ARROW_WIDTH / 2;

    //1 is the min bmi and 45 is the max bmi
    if (widget.bmi <= MIN_BMI) {
      return min;
    }
    if (widget.bmi >= MAX_BMI) {
      return max;
    }

    double offset = (barWidth / MAX_BMI) * (widget.bmi) - ARROW_WIDTH / 2;
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

    // return Container(
    //   child: Stack(
    //     alignment: Alignment.bottomCenter,
    //     children: [
    //       Image.asset(
    //         "assets/images/bmi_bar.png",
    //       ),
    //       Align(
    //         alignment: const Alignment(1.0, 0.0),
    //         child: Image.asset("assets/images/arrow.png"),
    //       ),
    //     ],
    //   ),
    // );

    // return SizedBox(
    //   height: (ARROW_HEIGHT + BAR_HEIGHT),
    //   width: double.infinity,
    //   child: Stack(
    //     alignment: Alignment.bottomCenter,
    //     children: [
    //       Padding(
    //         padding: const EdgeInsets.fromLTRB(
    //           ARROW_WIDTH / 2,
    //           0,
    //           ARROW_WIDTH / 2,
    //           0,
    //         ),
    //         child: Image.asset(
    //           "assets/images/bmi_bar.png",
    //           width: double.infinity,
    //           fit: BoxFit.fitWidth,
    //         ),
    //       ),
    //       PositionedDirectional(
    //         top: 4,
    //         start: offset,
    //         child: Image.asset("assets/images/arrow.png"),
    //       ),
    //     ],
    //   ),
    // );
  }
}
