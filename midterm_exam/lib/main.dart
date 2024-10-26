import 'package:flutter/material.dart';
import 'screens/history_screen.dart';
import 'screens/home_screen.dart';
import 'screens/input_screen.dart';
import 'screens/result_screen.dart';
import 'screens/settings_screen.dart';

void main() => runApp(const BottomNavigationBarExampleApp());

class BottomNavigationBarExampleApp extends StatelessWidget {
  const BottomNavigationBarExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const BottomNavigationBarExample(),
      routes: {
        '/input_screen': (context) => const InputScreen(),
        '/result_screen': (context) => const ResultScreen(),
      },
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
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const InputScreen(), // Navigate to InputScreen when "Calculate" is pressed
    BmiHistoryTracker(),
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
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
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
            color: Colors.white), // Set selected text color to white
        unselectedLabelStyle: const TextStyle(
            color: Colors.white), // Set unselected text color to white
      ),
    );
  }

  Widget _buildIcon(IconData icon, int index) {
    return Container(
      padding: const EdgeInsets.all(8), // Adjust padding as needed
      decoration: BoxDecoration(
        color: _selectedIndex == index
            ? const Color.fromARGB(
                255, 82, 120, 215) // Background color for selected item
            : const Color.fromARGB(0, 206, 204, 204),
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: _selectedIndex == index
            ? const Color.fromARGB(
                255, 255, 255, 255) // Icon color for selected item
            : const Color.fromARGB(234, 255, 255, 255),
      ),
    );
  }
}
