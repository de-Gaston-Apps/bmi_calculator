// import 'package:bmi_calculator/vars/colors.dart';
// import 'package:flutter/material.dart';

// List<LinearGradient> GRADIENTS = [
//   // Start like this
//   LinearGradient(
//     begin: Alignment.topRight,
//     end: Alignment.bottomLeft,
//     colors: GRADIENT_COLORS_LIGHT,
//   ),
//   // End like this
//   LinearGradient(
//     begin: Alignment.bottomRight,
//     end: Alignment.topLeft,
//     colors: [
//       Colors.green.shade300,
//       Colors.green.shade400,
//     ],
//   ),
// ];

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => SplashScreenState();
// }

// class SplashScreenState extends State<SplashScreen>
//     with TickerProviderStateMixin {
//   late AnimationController _controller;
//   BoxDecoration? darkShadowDecoration;

//   @override
//   void initState() {
//     super.initState();

//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 2), // Adjust the animation duration
//     )..repeat(reverse: true);

//     // Define an animation that interpolates between two gradients
//     final gradientTween = LinearGradientTween(
//       begin: GRADIENTS[0],
//       end: GRADIENTS[1],
//     );

//     _controller.addListener(() {
//       setState(() {
//         // Update the decoration with the interpolated gradient
//         darkShadowDecoration = BoxDecoration(
//           gradient: gradientTween.lerp(_controller.value),
//         );
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white, // Set your background color
//       body: Center(
//         child: AnimatedContainer(
//           width: double.infinity,
//           height: double.infinity,
//           curve: Curves.easeInSine,
//           duration:
//               const Duration(seconds: 1), // Animation duration //does nothing
//           decoration: darkShadowDecoration,
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }

// class LinearGradientTween extends Tween<LinearGradient> {
//   LinearGradientTween(
//       {required LinearGradient begin, required LinearGradient end})
//       : super(begin: begin, end: end);

//   @override
//   LinearGradient lerp(double t) {
//     return LinearGradient(
//       begin: Alignment.topRight,
//       end: Alignment.bottomLeft,
//       colors: <Color>[
//         Color.lerp(begin!.colors[0], end!.colors[0], t)!,
//         Color.lerp(begin!.colors[1], end!.colors[1], t)!,
//       ],
//     );
//   }
// }
