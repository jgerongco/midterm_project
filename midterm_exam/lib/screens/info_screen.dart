import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'What is BMI?',
          style: TextStyle(
            color:
                Color.fromARGB(255, 255, 255, 255), // Set the text color here
          ),
        ),
        backgroundColor: Color.fromARGB(255, 6, 34, 47),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'BMI (Body Mass Index) is a value derived from the weight and height of a person. '
                'It is used as an indicator of whether a person has a healthy body weight for a given height. '
                'Maintaining a healthy BMI is important for overall well-being and helps prevent various health risks.',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.justify, // Justifies the text
              ),
            ],
          ),
        ),
      ),
    );
  }
}
