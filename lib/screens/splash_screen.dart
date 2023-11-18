import 'package:bmi_calculator/handlers/my_rating.dart';
import 'package:bmi_calculator/vars/strings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:in_app_review/in_app_review.dart';

import 'package:bmi_calculator/vars/colors.dart';
import '../vars/globals.dart';
import '../widgets/scaffold_container.dart';
import 'bmi_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  // I'm thinking that for this splash screen, we should have a
  // throbbing mint green color in the background that slowly makes it's way
  // around the screen.
  bool zoomIn = true;
  void switchScreenOnWait() {
    Future.delayed(const Duration(seconds: SPLASH_SCREEN_TIMER)).then(
      (value) => {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const BmiScreen()),
        )
      },
    );
  }

  @override
  void initState() {
    super.initState();
    switchScreenOnWait();
    // make the zoom in/out happen
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        zoomIn = !zoomIn;
      });
    });

    // Show a Rating popup!
    MyRating rating = MyRating();
    rating.shouldShowPopup().then((value) {
      if (value) {
        debugPrint("Showing the popup rating");
        rating.showPopup();
      } else {
        debugPrint("Not showing popup rating");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffoldContainerBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            WELCOME_MESSAGE,
            style: GoogleFonts.robotoCondensed(
              color: MINT_GREEN,
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: BIGGER_PADDING_SIZE),
          AnimatedScale(
            scale: zoomIn ? 1.1 : 1,
            duration: Duration(milliseconds: zoomIn ? 1000 : 300),
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: Image.asset(
                "assets/images/icon.png",
                height: 130,
                width: 130,
              ),
            ),
            onEnd: () {
              setState(() {
                zoomIn = !zoomIn;
              });
            },
          ),
        ],
      ),
    );
  }
}
