import 'package:bmi_calculator/vars/globals.dart';
import 'package:bmi_calculator/vars/strings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BmiTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "$BMI_STRING ",
      style: GoogleFonts.notoSans(
        color: MINT_GREEN,
        fontSize: 50,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
