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

  void onLearnMoreClick() {
    launchUrl(
      Uri.parse(CDC_BMI_ABOUT_URL),
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
      showAppBar: false,
      child: Column(
        children: [
          AppBar(
            title: const Text(APP_NAME),
          ),
          const SizedBox(height: BIGGER_PADDING_SIZE),
          const Text(LEARN_MORE_ABOUT_BMI),
          const SizedBox(height: DEFALT_PADDING_SIZE),
          ElevatedButton(
            onPressed: onLearnMoreClick,
            child: const Text(LEARN_MORE),
          ),
////////////////////////////////////////////////////////////////////////////////
          const Spacer(),
////////////////////////////////////////////////////////////////////////////////
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, DEFALT_PADDING_SIZE),
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
