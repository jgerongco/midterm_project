import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool darkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(
            color:
                Color.fromARGB(255, 255, 255, 255), // Set the text color here
          ),
        ),
        backgroundColor: Color.fromARGB(255, 6, 34, 47),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: const Text(
              'General',
              style: TextStyle(
                color:
                    Color.fromARGB(255, 14, 14, 14), // Set the text color here
              ),
            ),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: const Icon(Icons.language),
                title: const Text('Language'),
                value: const Text('English'),
                onPressed: (context) {
                  // Handle language change
                },
              ),
              SettingsTile.switchTile(
                onToggle: (value) {
                  setState(() {
                    darkModeEnabled = value;
                  });
                },
                initialValue: darkModeEnabled,
                leading: const Icon(Icons.dark_mode),
                title: const Text('Enable Dark Mode'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
