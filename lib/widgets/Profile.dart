import 'package:flutter/material.dart';

// Theme Controller to handle theme switching
class ThemeController {
  static final ValueNotifier<ThemeMode> themeMode = ValueNotifier(ThemeMode.system);

  static void toggleTheme(bool isLight) {
    themeMode.value = isLight ? ThemeMode.light : ThemeMode.dark;
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),

              // ---------------- User Info ----------------
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/logo.png"),
              ),
              const SizedBox(height: 10),
              const Text(
                "Harsh Gour",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              const Text(
                "harsh@example.com",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              const Divider(),

              // ---------------- Notifications ----------------
              ListTile(
                leading: const Icon(Icons.notifications, color: Colors.amber),
                title: const Text("Notifications"),
                trailing: Switch(
                  value: true,
                  onChanged: (val) {
                    // Add notification toggle logic here
                  },
                  activeColor: Colors.yellow,
                ),
              ),

              // ---------------- Theme Switch ----------------
              ListTile(
                leading: const Icon(Icons.dark_mode),
                title: const Text("Theme"),
                trailing: ValueListenableBuilder<ThemeMode>(
                  valueListenable: ThemeController.themeMode,
                  builder: (context, currentTheme, _) {
                    final isLight = currentTheme == ThemeMode.light;
                    return Switch(
                      value: isLight,
                      onChanged: (val) {
                        ThemeController.toggleTheme(val);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(val ? "Light Mode" : "Dark Mode"),
                            duration: const Duration(seconds: 1),
                          ),
                        );
                      },
                      activeColor: Colors.green,
                    );
                  },
                ),
              ),

              const Divider(),

              // ---------------- About & Help ----------------
              ListTile(
                leading: const Icon(Icons.info, color: Colors.deepOrange),
                title: const Text("About"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  // Show about dialog or page
                },
              ),
              ListTile(
                leading: const Icon(Icons.help, color: Colors.indigo),
                title: const Text("Help & FAQ"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  // Navigate to help/FAQ
                },
              ),

              const Divider(),

              // ---------------- Privacy Policy & Terms & Condition ----------------
              ListTile(
                leading: const Icon(Icons.privacy_tip, color: Colors.teal),
                title: const Text("Privacy Policy"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  // Show Privacy Policy page
                },
              ),
              ListTile(
                leading: const Icon(Icons.description, color: Colors.blue),
                title: const Text("Terms & Conditions"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  // Navigate to Terms & Conditions page
                },
              ),

              const Divider(),

              // ---------------- Language ----------------
              ListTile(
                leading: const Icon(Icons.language, color: Colors.cyan),
                title: const Text("Language"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  // Navigate to language selection
                },
              ),

              // ---------------- Logout ----------------
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title: const Text("Logout"),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text("Logout"),
                      content: const Text("Are you sure you want to logout?"),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Cancel"),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            // Add logout logic here
                          },
                          child: const Text("Logout", style: TextStyle(color: Colors.red)),
                        ),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
