// ignore_for_file: constant_identifier_names
import 'dart:math';
import 'package:bmi_calculator/data/bmi_error.dart';
import 'package:bmi_calculator/vars/globals.dart';
import 'package:bmi_calculator/vars/strings.dart';

const INCHES_PER_FOOT = 12;
const CM_PER_METER = 100;

// Very underweight = < 16.5
// Underweight = 16.5 - 18.5
// Normal weight = 18.5 – 24.9
// Overweight = 25 – 29.9
// Obesity1 = 30 - 35
// Obesity2 = 35 - 40
// Obesity3 = BMI > 40
enum BmiCategory { veryUnder, under, normal, over, obese1, obese2, obese3, DEFAULT_BMI }

class BmiCalculator {
  Map<String, String>? _currentBmiMessages;
  double _currentBmiValueForMessages = DEFAULT_BMI;
  BmiCategory _currentBmiCategory = BmiCategory.DEFAULT_BMI; // Store current category

  // BMI = weight (kg)  / height^2 (meters)
  double getBmi(double weightKg, double heightM) {
    if (weightKg == BMI_ERROR || heightM == BMI_ERROR) {
      _currentBmiCategory = BmiCategory.DEFAULT_BMI; // Reset on error
      _currentBmiMessages = null;
      throw BmiException("At least one of the inputs was BMI_ERROR");
    }
    if (weightKg <= 0 || heightM <= 0) {
      _currentBmiCategory = BmiCategory.DEFAULT_BMI; // Reset on error
      _currentBmiMessages = null;
      throw BmiException("At least one of the inputs was less than or equal 0");
    }
    double bmi = weightKg / (heightM * heightM);
    // Update category and messages when BMI is calculated
    _currentBmiValueForMessages = bmi;
    _currentBmiCategory = getCategory(bmi);
    _currentBmiMessages = _getRandomPersonaMessages(_currentBmiCategory);
    return bmi;
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

  // See comment above
  BmiCategory getCategory(double bmi) {
    if (bmi == DEFAULT_BMI) return BmiCategory.DEFAULT_BMI; // Handle DEFAULT_BMI case
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

  Map<String, String> _getRandomPersonaMessages(BmiCategory category) {
    final random = Random();
    int persona = random.nextInt(3); // 0: SF, 1: PT, 2: CF

    String header = "";
    String subtitle = "";
    String text = "";

    switch (category) {
      case BmiCategory.veryUnder:
        subtitle = VERY_UNDER_MESSAGE_SUBTITLE_SF; // Subtitle is same for all
        if (persona == 0) {
          header = VERY_UNDER_MESSAGE_HEADER_SF;
          text = VERY_UNDER_MESSAGE_TEXT_SF;
        } else if (persona == 1) {
          header = VERY_UNDER_MESSAGE_HEADER_PT;
          text = VERY_UNDER_MESSAGE_TEXT_PT;
        } else {
          header = VERY_UNDER_MESSAGE_HEADER_CF;
          text = VERY_UNDER_MESSAGE_TEXT_CF;
        }
        break;
      case BmiCategory.under:
        subtitle = UNDER_WEIGHT_MESSAGE_SUBTITLE_SF;
        if (persona == 0) {
          header = UNDER_WEIGHT_MESSAGE_HEADER_SF;
          text = UNDER_WEIGHT_MESSAGE_TEXT_SF;
        } else if (persona == 1) {
          header = UNDER_WEIGHT_MESSAGE_HEADER_PT;
          text = UNDER_WEIGHT_MESSAGE_TEXT_PT;
        } else {
          header = UNDER_WEIGHT_MESSAGE_HEADER_CF;
          text = UNDER_WEIGHT_MESSAGE_TEXT_CF;
        }
        break;
      case BmiCategory.normal:
        subtitle = NORMAL_WEIGHT_MESSAGE_SUBTITLE_SF;
        if (persona == 0) {
          header = NORMAL_WEIGHT_MESSAGE_HEADER_SF;
          text = NORMAL_WEIGHT_MESSAGE_TEXT_SF;
        } else if (persona == 1) {
          header = NORMAL_WEIGHT_MESSAGE_HEADER_PT;
          text = NORMAL_WEIGHT_MESSAGE_TEXT_PT;
        } else {
          header = NORMAL_WEIGHT_MESSAGE_HEADER_CF;
          text = NORMAL_WEIGHT_MESSAGE_TEXT_CF;
        }
        break;
      case BmiCategory.over:
        subtitle = OVER_WEIGHT_MESSAGE_SUBTITLE_SF;
        if (persona == 0) {
          header = OVER_WEIGHT_MESSAGE_HEADER_SF;
          text = OVER_WEIGHT_MESSAGE_TEXT_SF;
        } else if (persona == 1) {
          header = OVER_WEIGHT_MESSAGE_HEADER_PT;
          text = OVER_WEIGHT_MESSAGE_TEXT_PT;
        } else {
          header = OVER_WEIGHT_MESSAGE_HEADER_CF;
          text = OVER_WEIGHT_MESSAGE_TEXT_CF;
        }
        break;
      case BmiCategory.obese1:
        subtitle = OBESE1_WEIGHT_MESSAGE_SUBTITLE_SF;
        if (persona == 0) {
          header = OBESE1_WEIGHT_MESSAGE_HEADER_SF;
          text = OBESE1_WEIGHT_MESSAGE_TEXT_SF;
        } else if (persona == 1) {
          header = OBESE1_WEIGHT_MESSAGE_HEADER_PT;
          text = OBESE1_WEIGHT_MESSAGE_TEXT_PT;
        } else {
          header = OBESE1_WEIGHT_MESSAGE_HEADER_CF;
          text = OBESE1_WEIGHT_MESSAGE_TEXT_CF;
        }
        break;
      case BmiCategory.obese2:
        subtitle = OBESE2_WEIGHT_MESSAGE_SUBTITLE_SF;
        if (persona == 0) {
          header = OBESE2_WEIGHT_MESSAGE_HEADER_SF;
          text = OBESE2_WEIGHT_MESSAGE_TEXT_SF;
        } else if (persona == 1) {
          header = OBESE2_WEIGHT_MESSAGE_HEADER_PT;
          text = OBESE2_WEIGHT_MESSAGE_TEXT_PT;
        } else {
          header = OBESE2_WEIGHT_MESSAGE_HEADER_CF;
          text = OBESE2_WEIGHT_MESSAGE_TEXT_CF;
        }
        break;
      case BmiCategory.obese3:
        subtitle = OBESE3_WEIGHT_MESSAGE_SUBTITLE_SF;
        if (persona == 0) {
          header = OBESE3_WEIGHT_MESSAGE_HEADER_SF;
          text = OBESE3_WEIGHT_MESSAGE_TEXT_SF;
        } else if (persona == 1) {
          header = OBESE3_WEIGHT_MESSAGE_HEADER_PT;
          text = OBESE3_WEIGHT_MESSAGE_TEXT_PT;
        } else {
          header = OBESE3_WEIGHT_MESSAGE_HEADER_CF;
          text = OBESE3_WEIGHT_MESSAGE_TEXT_CF;
        }
        break;
      case BmiCategory.DEFAULT_BMI: // Should not happen if called correctly
        return {
          'header': DEFAULT_WEIGHT_MESSAGE_HEADER,
          'subtitle': DEFAULT_WEIGHT_MESSAGE_SUBTITLE,
          'text': DEFAULT_WEIGHT_MESSAGE_TEXT,
        };
    }
    return {'header': header, 'subtitle': subtitle, 'text': text};
  }

  void _ensureMessagesAreUpToDate(double bmi) {
    if (bmi == DEFAULT_BMI) {
      if (_currentBmiCategory != BmiCategory.DEFAULT_BMI) {
        _currentBmiMessages = {
          'header': DEFAULT_WEIGHT_MESSAGE_HEADER,
          'subtitle': DEFAULT_WEIGHT_MESSAGE_SUBTITLE,
          'text': DEFAULT_WEIGHT_MESSAGE_TEXT,
        };
        _currentBmiCategory = BmiCategory.DEFAULT_BMI;
        _currentBmiValueForMessages = DEFAULT_BMI;
      }
    } else if (bmi != _currentBmiValueForMessages || _currentBmiMessages == null) {
      // This case is mostly handled by getBmi, but good for safety
      _currentBmiValueForMessages = bmi;
      _currentBmiCategory = getCategory(bmi);
      _currentBmiMessages = _getRandomPersonaMessages(_currentBmiCategory);
    }
  }

  String getBmiMessageHeader(double bmi) {
    _ensureMessagesAreUpToDate(bmi);
    if (bmi == DEFAULT_BMI || _currentBmiMessages == null) {
      return DEFAULT_WEIGHT_MESSAGE_HEADER;
    }
    return _currentBmiMessages!['header']!;
  }

  String getBmiMessageSubtitle(double bmi) {
    _ensureMessagesAreUpToDate(bmi);
    if (bmi == DEFAULT_BMI || _currentBmiMessages == null) {
      return DEFAULT_WEIGHT_MESSAGE_SUBTITLE;
    }
    return _currentBmiMessages!['subtitle']!;
  }

  String getBmiMessageText(double bmi) {
    _ensureMessagesAreUpToDate(bmi);
    if (bmi == DEFAULT_BMI || _currentBmiMessages == null) {
      return DEFAULT_WEIGHT_MESSAGE_TEXT;
    }
    return _currentBmiMessages!['text']!;
  }

  double _roundOneDecimal(double d) {
    return (d * 10).round() / 10;
  }

  String getIdealWeight(double heightM, bool isWeightMetric) {
    // BMI = weight (kg)  / height^2 (meters)
    // So, I just need to reverse engineer the BMI into the ideal weight for normal range
    // Normal range is 18.5 - 24.9
    // fudge a little to make it always true
    const double BMI_NORM_LOW = 18.5;
    const double BMI_NORM_HIGH = 24.9;

    double low = BMI_NORM_LOW * heightM * heightM;
    double high = BMI_NORM_HIGH * heightM * heightM;
    String unit = WEIGHT_METRIC_TEXT;

    if (!isWeightMetric) {
      low = kgToLb(low);
      high = kgToLb(high);
      unit = WEIGHT_IMPER_TEXT;
    }
    low = _roundOneDecimal(low);
    high = _roundOneDecimal(high);
    return "$IDEAL_WEIGHT_MESSAGE $low$unit - $high$unit";
  }
}
