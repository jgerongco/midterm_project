import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(
            color:
                Color.fromARGB(255, 255, 255, 255), // Set the text color here
          ),
        ),
        backgroundColor: Color.fromARGB(
            255, 6, 34, 47), // Set the AppBar background color here
      ),
      backgroundColor: Color.fromARGB(
          255, 249, 249, 249), // Set the Scaffold background color here
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome to BMI Calculator!',
              style: TextStyle(
                fontSize: 24,
                color: Color.fromARGB(255, 4, 0, 0), // Set the text color here
              ),
            ),
            SizedBox(height: 20), // Add spacing between text and info section
            BmiInfoSection(), // Add the BmiInfoSection widget here
          ],
        ),
      ),
    );
  }
}

// Info section for BMI explanation and FAQ
class BmiInfoSection extends StatefulWidget {
  @override
  _BmiInfoSectionState createState() => _BmiInfoSectionState();
}

class _BmiInfoSectionState extends State<BmiInfoSection> {
  bool _isFaqExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title for the Info Section
          Text(
            'What is BMI?',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          SizedBox(height: 8),
          // Description Text
          Text(
            'BMI (Body Mass Index) is a measure that uses your height and weight to estimate if you’re within a healthy weight range. '
            'It helps identify if you’re underweight, normal weight, overweight, or obese.',
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
          SizedBox(height: 16),
          // FAQ Expansion Tile
          ExpansionTile(
            title: Text(
              'Frequently Asked Questions',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
            initiallyExpanded: _isFaqExpanded,
            onExpansionChanged: (bool expanded) {
              setState(() => _isFaqExpanded = expanded);
            },
            children: <Widget>[
              ListTile(
                title: Text(
                  'Is BMI accurate?',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  'BMI is a useful screening tool but may not account for muscle mass and other individual factors. '
                  'It’s best used as a general guide rather than a precise measure of body health.',
                ),
              ),
              ListTile(
                title: Text(
                  'What is a healthy BMI range?',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  'A healthy BMI typically falls between 18.5 and 24.9. BMI below or above this range may indicate '
                  'an increased risk of health issues.',
                ),
              ),
              ListTile(
                title: Text(
                  'Can BMI be used for everyone?',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  'BMI might not be as accurate for athletes, children, the elderly, or pregnant women due to variations in body composition.',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
