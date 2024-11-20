import 'package:flutter/material.dart';
import 'package:flutter_assignment/w6-s1/EXERCISE-3/screen/welcome.dart';
import 'screen/temperature.dart';
//import 'package:test1/W5-S2-List-Inputs/1%20-%20START%20CODE/EXERCISE-3/screen/welcome.dart';

class TemperatureApp extends StatefulWidget {
  const TemperatureApp({super.key});

  @override
  State<TemperatureApp> createState() => _TemperatureAppState();
}

class _TemperatureAppState extends State<TemperatureApp> {
  // Manage the current screen state
  bool showWelcomeScreen = true;

  // Callback to switch screens
  void switchScreen() {
    setState(() {
      showWelcomeScreen = false; // Switch to Temperature screen
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff16C062),
                Color(0xff00BCDC),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          // Conditionally render the screens based on state
          child: showWelcomeScreen
              ? Welcome(onStart: switchScreen) // Pass callback to Welcome
              : Temperature(), // Show Temperature screen
        ),
      ),
    );
  }
}

void main() {
  runApp(const TemperatureApp());
}