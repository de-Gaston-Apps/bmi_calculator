// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';

const int RATING_MIN_SESSIONS = 5;

class MyRating {
  final InAppReview _inAppReview = InAppReview.instance;

  Future<bool> shouldShowPopup() async {
    if (await _inAppReview.isAvailable() == false) {
      return false;
    }
    return true;
  }

  void showPopup() {
    _inAppReview.requestReview().then((value) {
      debugPrint("The review is done");
    });
  }
}
