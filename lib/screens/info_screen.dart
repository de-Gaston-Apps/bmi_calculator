import 'dart:io';
import 'package:bmi_calculator/vars/globals.dart';
import 'package:bmi_calculator/vars/strings.dart';
import 'package:bmi_calculator/widgets/scaffold_container.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => InfoScreenState();
}

class InfoScreenState extends State<InfoScreen> {
  bool isDarkMode = false;

  void callback() {
    setState(() {});
  }

  void onOtherAppClick() {
    String url = "";
    if (Platform.isAndroid) {
      url = ANDROID_STORE_URL;
    } else if (Platform.isIOS) {
      url = IOS_STORE_URL;
    }
    launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    );
  }

  void onContactClick() {
    launchUrl(
      Uri.parse(
          "mailto:<$MY_CONTACT_EMAIL>?subject=$DEFAULT_EMAIL_SUBJECT&body=$DEFAULT_EMAIL_BODY"),
      mode: LaunchMode.externalApplication,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffoldContainerBackground(
      showAppBar: true,
      child: Column(
        children: [
          Text("Learn more about BMI"),
////////////////////////////////////////////////////////////////////////////////
          const Spacer(),
////////////////////////////////////////////////////////////////////////////////
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: RichText(
              text: TextSpan(
                text: OTHER_APPS_STRING,
                style: const TextStyle(color: Colors.blue, fontSize: 22),
                recognizer: TapGestureRecognizer()..onTap = onOtherAppClick,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
            child: RichText(
              text: TextSpan(
                text: CONTACT_US_STRING,
                style: const TextStyle(color: Colors.blue, fontSize: 22),
                recognizer: TapGestureRecognizer()..onTap = onContactClick,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
