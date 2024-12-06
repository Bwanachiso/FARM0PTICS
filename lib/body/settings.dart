import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: SettingsScreen()));
}

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = false;
  bool _biometricEnabled = false;
  bool _highContrastMode = false;
  bool _darkModeEnabled = false;
  bool _betaFeaturesEnabled = false;
  String _theme = 'Light';
  String _selectedLanguage = 'English';
  double _fontSize = 14.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Settings',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // User Profile Section
            ListTile(
              title: const Text('Edit Profile'),
              leading: const Icon(Icons.person),
              onTap: () {
                // Navigate to Edit Profile screen
              },
            ),
            const Divider(),

            // Notifications Section
            SwitchListTile(
              title: const Text('Enable Notifications'),
              value: _notificationsEnabled,
              onChanged: (bool value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
            ),
            const Divider(),

            // Theme Section
            ListTile(
              title: const Text('Select Theme'),
              trailing: DropdownButton<String>(
                value: _theme,
                onChanged: (String? newTheme) {
                  setState(() {
                    _theme = newTheme!;
                  });
                },
                items: <String>['Light', 'Dark', 'System Default']
                    .map((String theme) {
                  return DropdownMenuItem<String>(
                    value: theme,
                    child: Text(theme),
                  );
                }).toList(),
              ),
            ),
            const Divider(),

            // Font Size Section
            ListTile(
              title: const Text('Font Size'),
              subtitle: Slider(
                value: _fontSize,
                min: 10.0,
                max: 24.0,
                divisions: 7,
                label: _fontSize.toStringAsFixed(1),
                onChanged: (double newSize) {
                  setState(() {
                    _fontSize = newSize;
                  });
                },
              ),
              trailing: Text('${_fontSize.toStringAsFixed(1)} pt'),
            ),
            const Divider(),

            // Language Section
            ListTile(
              title: const Text('Select Language'),
              trailing: DropdownButton<String>(
                value: _selectedLanguage,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedLanguage = newValue!;
                  });
                },
                items: <String>['English', 'Spanish', 'French', 'German']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            const Divider(),

            // Privacy & Security Section
            SwitchListTile(
              title: const Text('Enable Biometric Authentication'),
              value: _biometricEnabled,
              onChanged: (bool value) {
                setState(() {
                  _biometricEnabled = value;
                });
              },
            ),
            const Divider(),

            // Accessibility Section
            SwitchListTile(
              title: const Text('Enable High Contrast Mode'),
              value: _highContrastMode,
              onChanged: (bool value) {
                setState(() {
                  _highContrastMode = value;
                });
              },
            ),
            const Divider(),

            // Data & Storage Section
            ListTile(
              title: const Text('Clear Cache'),
              leading: const Icon(Icons.storage),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Cache cleared!')),
                );
              },
            ),
            const Divider(),

            // About Section
            ListTile(
              title: const Text('About'),
              leading: const Icon(Icons.info),
              onTap: () {
                showAboutDialog(
                  context: context,
                  applicationName: 'Settings App',
                  applicationVersion: '1.0.0',
                  applicationIcon: const Icon(Icons.settings),
                  children: [
                    const Text('This is a sample settings screen for Flutter.'),
                  ],
                );
              },
            ),
            const Divider(),

            // Backup & Restore Section
            ListTile(
              title: const Text('Backup and Restore'),
              leading: const Icon(Icons.backup),
              onTap: () {
                // Navigate to Backup and Restore screen
              },
            ),
            const Divider(),

            // Beta Features Section
            SwitchListTile(
              title: const Text('Enable Beta Features'),
              value: _betaFeaturesEnabled,
              onChanged: (bool value) {
                setState(() {
                  _betaFeaturesEnabled = value;
                });
              },
            ),
            const Divider(),

            // Logout Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Logged out!')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: const Text('Logout'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
