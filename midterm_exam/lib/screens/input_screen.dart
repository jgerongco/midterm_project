import 'package:flutter/material.dart';
import 'package:midterm_exam/screens/result_screen.dart';

class InputScreen extends StatelessWidget {
  final Function(double) addBmiToHistory;

  InputScreen({super.key, required this.addBmiToHistory});

  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calculate BMI',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 6, 34, 47),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Enter your Height and Weight',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: heightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Height (cm)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Weight (kg)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final double? height = double.tryParse(heightController.text);
                  final double? weight = double.tryParse(weightController.text);

                  if (height != null && weight != null && height > 0) {
                    final double bmi =
                        weight / ((height / 100) * (height / 100));
                    addBmiToHistory(bmi); // Save BMI to history
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultScreen(
                          bmi: bmi,
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please enter valid height and weight!'),
                      ),
                    );
                  }
                },
                child: const Text('Show Result'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
