import 'package:bmi_calculator/vars/globals.dart';
import 'package:flutter/material.dart';
import '../vars/theme.dart';

class MyScaffoldContainerBackground extends StatefulWidget {
  final Widget? child;
  final bool showAppBar;
  const MyScaffoldContainerBackground(
      {super.key, required this.child, this.showAppBar = false});

  @override
  State<MyScaffoldContainerBackground> createState() =>
      MyScaffoldContainerBackgroundState();
}

class MyScaffoldContainerBackgroundState
    extends State<MyScaffoldContainerBackground> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.showAppBar ? AppBar(title: const Text(APP_NAME)) : null,
      body: Container(
        alignment: Alignment.center,
        decoration: Theme.of(context).brightness == Brightness.dark
            ? MyTheme.darkBackgroundBoxDecoration
            : MyTheme.lightBackgroundBoxDecoration,
        child: widget.child,
      ),
    );
  }
}
