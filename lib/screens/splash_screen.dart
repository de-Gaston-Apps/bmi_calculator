import 'package:flutter/material.dart';

import '../vars/globals.dart';
import '../widgets/scaffold_container.dart';
import 'design_screen.dart';
import 'main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  // I'm thinking that for this splash screen, we should have a
  // throbbing mint green color in the background that slowly makes it's way
  // around the screen.

  void switchScreenOnWait() {
    Future.delayed(const Duration(seconds: SPLASH_SCREEN_TIMER)).then(
      (value) => {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const DesignScreen()),
        )
      },
    );
  }

  @override
  void initState() {
    switchScreenOnWait();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffoldContainerBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Splash Screen",
            style: TextStyle(
              color: MINT_GREEN,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
