import 'package:bmi_calculator/vars/globals.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class BmiArrow extends StatelessWidget {
  const BmiArrow({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      // Align the top of the BmiArrow with the top of the ColoBar
      height: ARROW_HEIGHT,
      width: ARROW_WIDTH,
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(5),
      //   border: Border.all(color: Colors.grey),
      // ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -ARROW_SIZE / 3 - 2,
            left: -ARROW_SIZE / 10,
            child: Transform.rotate(
              angle: math.pi / 2,
              child: const Icon(
                Icons.play_arrow,
                size: ARROW_SIZE,
              ),
            ),
          ),
          Align(
            child: Container(
              width: ARROW_LINE_WIDTH,
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black
                    : Colors.white,
              ),
            ),
          ),
          Positioned(
            bottom: -ARROW_SIZE / 3 - 3,
            left: -ARROW_SIZE / 10,
            child: Transform.rotate(
              angle: -math.pi / 2,
              child: const Icon(
                Icons.play_arrow,
                size: ARROW_SIZE,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
