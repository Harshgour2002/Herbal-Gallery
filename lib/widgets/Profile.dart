import 'package:flutter/material.dart';

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
                backgroundImage: AssetImage("assets/logo.png"), // user avatar or placeholder
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

              // ---------------- Favorites / Recently Viewed ----------------
              ListTile(
                leading: const Icon(Icons.favorite, color: Colors.red),
                title: const Text("Favorites"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  // Navigate to favorites screen
                },
              ),
              ListTile(
                leading: const Icon(Icons.history, color: Colors.blue),
                title: const Text("Recently Viewed"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  // Navigate to history screen
                },
              ),

              const Divider(),

              // ---------------- Preferences ----------------
              ListTile(
                leading: const Icon(Icons.settings, color: Colors.green),
                title: const Text("Preferences"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  // Navigate to preferences/settings screen
                },
              ),
              ListTile(
                leading: const Icon(Icons.dark_mode),
                title: const Text("Theme"),
                trailing: Switch(
                  value: false,
                  onChanged: (val) {
                    // toggle light/dark theme
                  },
                  activeColor: Colors.green,
                ),
              ),

              const Divider(),

              // ---------------- About & Help ----------------
              ListTile(
                leading: const Icon(Icons.info, color: Colors.orange),
                title: const Text("About"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  // Show about dialog or page
                },
              ),
              ListTile(
                leading: const Icon(Icons.help, color: Colors.purple),
                title: const Text("Help & FAQ"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  // Navigate to help/FAQ
                },
              ),

              const Divider(),

              // ---------------- Logout ----------------
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title: const Text("Logout"),
                onTap: () {
                  // Handle logout
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
