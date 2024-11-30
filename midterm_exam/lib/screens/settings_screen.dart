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
          style:
              TextStyle(color: Colors.white), // Set title text color to white
        ),
        backgroundColor: const Color.fromARGB(255, 6, 34, 47),
      ),
      body: Container(
        color: Colors.white, // Dynamic background
        child: SettingsList(
          sections: [
            SettingsSection(
              title: const Text('General'),
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
            SettingsSection(
              title: const Text('About'),
              tiles: <SettingsTile>[
                SettingsTile(
                  title: const Text('Version'),
                  description: const Text('1.0.0'),
                  leading: const Icon(Icons.info),
                ),
                SettingsTile.navigation(
                  title: const Text('Privacy Policy'),
                  leading: const Icon(Icons.privacy_tip),
                  onPressed: (context) {
                    // Open privacy policy page
                  },
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.file_copy),
                  title: const Text('Terms of Service'),
                  onPressed: (context) {
                    // Navigate to terms of service
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
