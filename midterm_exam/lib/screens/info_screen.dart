import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('What is BMI?'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
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
