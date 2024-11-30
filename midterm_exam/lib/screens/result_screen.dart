import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final double bmi;

  const ResultScreen({super.key, required this.bmi});

  @override
  Widget build(BuildContext context) {
    String getBmiCategory(double bmi) {
      if (bmi < 18.5) return 'Underweight';
      if (bmi < 24.9) return 'Normal';
      if (bmi < 29.9) return 'Overweight';
      return 'Obese';
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI Result',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 6, 34, 47),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your BMI: ${bmi.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              'Category: ${getBmiCategory(bmi)}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
