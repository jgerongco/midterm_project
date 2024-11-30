import 'package:flutter/material.dart';

class BmiHistoryTracker extends StatelessWidget {
  final List<Map<String, dynamic>> bmiHistory;
  final VoidCallback clearHistory;

  const BmiHistoryTracker({
    super.key,
    required this.bmiHistory,
    required this.clearHistory,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'History',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 6, 34, 47),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: clearHistory,
          ),
        ],
      ),
      body: bmiHistory.isEmpty
          ? const Center(child: Text("No history available."))
          : ListView.builder(
              itemCount: bmiHistory.length,
              itemBuilder: (context, index) {
                final entry = bmiHistory[index];
                return ListTile(
                  leading: const Icon(Icons.fitness_center),
                  title: Text("BMI: ${entry['bmi'].toStringAsFixed(2)}"),
                  subtitle: Text("Date: ${entry['date']}"),
                );
              },
            ),
    );
  }
}
