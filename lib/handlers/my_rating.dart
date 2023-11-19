// ignore_for_file: constant_identifier_names

import 'package:bmi_calculator/handlers/my_shared_pref_handler.dart';
import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';

const String PREF_KEY_PREFIX = "rating_";
const String PREF_SESSIONS = "sessions";
const int RATING_MIN_SESSIONS = 5;

class MyRating {
  final InAppReview _inAppReview = InAppReview.instance;

  Future<bool> shouldShowPopup() async {
    if (await _inAppReview.isAvailable() == false) {
      return false;
    }

    // Get the shared preference values
    MySharedPreferenceHandler prefs = MySharedPreferenceHandler();
    dynamic sessions = await prefs.getValue(PREF_KEY_PREFIX + PREF_SESSIONS);
    sessions ??= 0;
    prefs.setValue(PREF_KEY_PREFIX + PREF_SESSIONS, sessions + 1);

    // Return false if there haven't been enough sessions yet
    if (sessions < RATING_MIN_SESSIONS) {
      debugPrint("Not enough sessions yet");
      return false;
    }

    return true;
  }

  void showPopup() {
    _inAppReview.requestReview().then((value) {
      debugPrint("The review popup is done launching");
    });
  }
}
