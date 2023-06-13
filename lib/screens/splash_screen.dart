import 'package:flutter/material.dart';

import 'home_screen.dart';

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
    Future.delayed(const Duration(seconds: 3)).then(
      (value) => {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
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
    return const Text("This is the splash screen");
  }
}
