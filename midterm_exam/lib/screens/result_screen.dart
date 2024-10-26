import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your BMI Result',
          style: TextStyle(
            color:
                Color.fromARGB(255, 255, 255, 255), // Set the text color here
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 6, 34, 47),
        iconTheme: const IconThemeData(
          color: Colors.white, // Set the back arrow color here
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'BMI Result will be shown here',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.popUntil(
            //         context, ModalRoute.withName('/screens/home_screen'));
            //   },
            //   child: const Text('Go Back to Home'),
            // ),
          ],
        ),
      ),
    );
  }
}
