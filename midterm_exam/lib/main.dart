import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/input_screen.dart';
import 'screens/result_screen.dart';
import 'screens/info_screen.dart';
import 'screens/settings_screen.dart';

void main() {
  runApp(BMICalculatorApp());
}

class BMICalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      routes: {
        '/input': (context) => InputScreen(),
        '/result': (context) => ResultScreen(),
        '/info': (context) => InfoScreen(),
        '/settings': (context) => SettingsScreen(),
      },
    );
  }
}
