import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'screens/history_screen.dart';
import 'screens/home_screen.dart';
import 'screens/input_screen.dart';
import 'screens/settings_screen.dart';

void main() => runApp(const BottomNavigationBarExampleApp());

class BottomNavigationBarExampleApp extends StatelessWidget {
  const BottomNavigationBarExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Removes debug banner
      title: 'BMI Calculator App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const BottomNavigationBarExample(),
    );
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;
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

  // Add BMI entry to history
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

  // List of screens for navigation
  late final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    InputScreen(
      addBmiToHistory: _addBmiToHistory, // Pass BMI saving logic
    ),
    BmiHistoryTracker(
      bmiHistory: _bmiHistory,
      clearHistory: _clearBmiHistory,
    ),
    const SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.home, 0),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.calculate, 1),
            label: 'Calculate BMI',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.history, 2),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.settings, 3),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 255, 255, 255),
        unselectedItemColor: const Color.fromARGB(234, 240, 240, 240),
        backgroundColor: const Color.fromARGB(255, 6, 34, 47),
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(
          color: Colors.white,
        ), // Set selected text color to white
        unselectedLabelStyle: const TextStyle(
          color: Colors.white,
        ), // Set unselected text color to white
      ),
    );
  }

  Widget _buildIcon(IconData icon, int index) {
    return Container(
      padding: const EdgeInsets.all(8), // Adjust padding as needed
      decoration: BoxDecoration(
        color: _selectedIndex == index
            ? const Color.fromARGB(255, 82, 120, 215) // Highlight selected item
            : const Color.fromARGB(0, 206, 204, 204),
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: _selectedIndex == index
            ? const Color.fromARGB(255, 255, 255, 255) // Highlighted icon color
            : const Color.fromARGB(234, 255, 255, 255),
      ),
    );
  }
}
