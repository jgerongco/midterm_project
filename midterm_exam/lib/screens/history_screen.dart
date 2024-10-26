import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class BmiHistoryTracker extends StatefulWidget {
  @override
  _BmiHistoryTrackerState createState() => _BmiHistoryTrackerState();
}

class _BmiHistoryTrackerState extends State<BmiHistoryTracker> {
  List<Map<String, dynamic>> _bmiHistory = [];

  @override
  void initState() {
    super.initState();
    _loadBmiHistory();
  }

  // Load BMI history from SharedPreferences
  Future<void> _loadBmiHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? history = prefs.getString('bmiHistory');
    if (history != null) {
      setState(() {
        _bmiHistory = List<Map<String, dynamic>>.from(jsonDecode(history));
      });
    }
  }

  // Save BMI calculation to history
  Future<void> _addBmiToHistory(double bmi) async {
    final now = DateTime.now();
    Map<String, dynamic> newEntry = {
      'bmi': bmi,
      'date': '${now.year}-${now.month}-${now.day} ${now.hour}:${now.minute}'
    };

    setState(() {
      _bmiHistory.insert(0, newEntry); // Add the latest BMI at the top
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('bmiHistory', jsonEncode(_bmiHistory));
  }

  // Clear BMI history
  Future<void> _clearBmiHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('bmiHistory');
    setState(() {
      _bmiHistory.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'History',
          style: TextStyle(
            color:
                Color.fromARGB(255, 255, 255, 255), // Set the text color here
          ),
        ),
        backgroundColor: Color.fromARGB(255, 6, 34, 47),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: _clearBmiHistory,
          ),
        ],
      ),
      body: _bmiHistory.isEmpty
          ? Center(child: Text("No history available."))
          : ListView.builder(
              itemCount: _bmiHistory.length,
              itemBuilder: (context, index) {
                final entry = _bmiHistory[index];
                return ListTile(
                  leading: Icon(Icons.fitness_center),
                  title: Text("BMI: ${entry['bmi'].toStringAsFixed(2)}"),
                  subtitle: Text("Date: ${entry['date']}"),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addBmiToHistory(22.5), // Example: adds a sample BMI
        child: Icon(Icons.add),
      ),
    );
  }
}
