// ignore_for_file: constant_identifier_names
import 'package:bmi_calculator/data/bmi_error.dart';
import 'package:bmi_calculator/vars/globals.dart';

const INCHES_PER_FOOT = 12;
const CM_PER_METER = 100;

class BmiCalculator {
  // BMI = weight (kg)  / height^2 (meters)
  double getBmi(double weightKg, double heightM) {
    if (weightKg == BMI_ERROR || heightM == BMI_ERROR) {
      throw BmiException("At least one of the inputs was BMI_ERROR");
    }
    if (weightKg <= 0 || heightM <= 0) {
      throw BmiException("At least one of the inputs was less than or equal 0");
    }
    return weightKg / (heightM * heightM);
  }

  double metersToFeet(double meters) {
    return meters * 3.28084;
  }

  double feetToMeters(double feet) {
    return feet / 3.28084;
  }

  double kgToLb(double kg) {
    return kg * 2.20462;
  }

  double lbToKg(double lb) {
    return lb / 2.20462;
  }

  // Underweight = <18.5
  // Normal weight = 18.5–24.9
  // Overweight = 25–29.9
  // Obesity = BMI of 30 or greater
  // TODO add different specs for over, under, and obese
  BmiCategory getCategory(double bmi) {
    if (bmi <= 18.5) {
      return BmiCategory.under;
    } else if (bmi < 25) {
      return BmiCategory.normal;
    } else if (bmi < 30) {
      return BmiCategory.over;
    } else {
      return BmiCategory.obese;
    }
  }
}
