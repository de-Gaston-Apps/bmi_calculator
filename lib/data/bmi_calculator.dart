// ignore_for_file: constant_identifier_names
import 'package:bmi_calculator/data/bmi_error.dart';
import 'package:bmi_calculator/vars/globals.dart';
import 'package:bmi_calculator/vars/strings.dart';

const INCHES_PER_FOOT = 12;
const CM_PER_METER = 100;

// Underweight = <18.5
// Normal weight = 18.5–24.9
// Overweight = 25–29.9
// Obesity = BMI of 30 or greater
enum BmiCategory { veryUnder, under, normal, over, obese1, obese2, obese3 }

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
    if (bmi <= 16.5) {
      return BmiCategory.veryUnder;
    } else if (bmi < 18.5) {
      return BmiCategory.under;
    } else if (bmi < 25) {
      return BmiCategory.normal;
    } else if (bmi < 30) {
      return BmiCategory.over;
    } else if (bmi < 35) {
      return BmiCategory.obese1;
    } else if (bmi < 40) {
      return BmiCategory.obese2;
    } else {
      return BmiCategory.obese3;
    }
  }

  String getBmiMessage(double bmi) {
    BmiCategory category = getCategory(bmi);
    if (category == BmiCategory.veryUnder) {
      return VERY_UNDER_WEIGHT_MESSAGE;
    } else if (category == BmiCategory.normal) {
      return NORMAL_WEIGHT_MESSAGE;
    } else if (category == BmiCategory.normal) {
      return NORMAL_WEIGHT_MESSAGE;
    } else if (category == BmiCategory.over) {
      return OVER_WEIGHT_MESSAGE;
    } else if (category == BmiCategory.obese1) {
      return OBESE1_WEIGHT_MESSAGE;
    } else if (category == BmiCategory.obese2) {
      return OBESE2_WEIGHT_MESSAGE;
    } else if (category == BmiCategory.obese3) {
      return OBESE3_WEIGHT_MESSAGE;
    }
    return DEFAULT_WEIGHT_MESSAGE;
  }
}
