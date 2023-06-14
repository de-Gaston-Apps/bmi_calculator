import 'package:bmi_calculator/vars/globals.dart';

import 'bmi_error.dart';

class BmiCalculator {
// BMI = weight (kg)  / height^2 (meters)
  double getBmi({
    double weightKg = 0,
    double weightLb = 0,
    double heightM = 0,
    double heightFt = 0,
  }) {
    if (weightKg == 0 && weightLb == 0) {
      throw BmiException("Didn't specify a weight");
    }
    if (heightM == 0 && heightFt == 0) {
      throw BmiException("Didn't specify a height");
    }
    if (weightLb != 0) {
      weightKg = lbToKg(weightLb);
    }
    if (heightFt != 0) {
      heightM = feetToMeters(heightFt);
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
