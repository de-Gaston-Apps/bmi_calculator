import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BmiNumber extends StatelessWidget {
  final double bmi;
  const BmiNumber({super.key, required this.bmi});

  @override
  Widget build(BuildContext context) {
    return Text(
      "$bmi",
      style: GoogleFonts.roboto(
        fontSize: 45,
      ),
    );
  }
}
