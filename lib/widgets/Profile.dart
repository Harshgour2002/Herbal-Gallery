import 'package:flutter/material.dart';
import 'package:herbal_gallary/About.dart';
import 'package:herbal_gallary/Authentication/LoginScreen.dart';
import 'package:herbal_gallary/PrivacyPolicy.dart';
import 'package:herbal_gallary/TermsAndCondition.dart';
import 'package:herbal_gallary/contact_us.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../HelpAndFAQ.dart';

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
    var selectedLanguage = "English"; // Placeholder for selected language
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),

              // ---------------- User Info ----------------
              Stack(
                children: [
                  // Main Avatar
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage("assets/logo.png"),
                  ),
                  // Small edit icon
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: (){
                        // Add edit profile picture logic here
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("clicked edit icon"),
                            duration: Duration(seconds: 1),
                          )
                        );
                      },
                      child: CircleAvatar(
                        radius: 16, // smaller circle
                        backgroundColor: Colors.grey.shade800,
                        child: const Icon(
                          Icons.edit,
                          size: 17,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
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
                  activeColor: Colors.amber,
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

              // ---------------- Language & Help ----------------
              ListTile(
                leading: const Icon(Icons.language, color: Colors.cyan),
                title: const Text("Language"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  // Show about dialog for selecting languages
                  _showDialog(context, selectedLanguage);
                },
              ),

              const Divider(),


              ListTile(
                leading: const Icon(Icons.help, color: Colors.indigo),
                title: const Text("Help & FAQ"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  // Navigate to help/FAQ
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Helpandfaq()));
                },
              ),

              // ---------------- Privacy Policy & Terms & Condition ----------------
              ListTile(
                leading: const Icon(Icons.privacy_tip, color: Colors.teal),
                title: const Text("Privacy Policy"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  // Navigate to Privacy Policy page
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Privacypolicy()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.description, color: Colors.blue),
                title: const Text("Terms & Conditions"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  // Navigate to Terms & Conditions page
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Termsandcondition()));
                },
              ),

              const Divider(),

              // ---------------- Contact ----------------
              ListTile(
                leading: const Icon(Icons.support_agent_outlined, color: Colors.green),
                title: const Text("Contact us"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  // Navigate to Contact Us page
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUsScreen()));
                },
              ),


              // ---------------- Language ----------------
              ListTile(
                leading: const Icon(Icons.error, color: Colors.redAccent),
                title: const Text("About"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  // Navigate to about selection
                  Navigator.push(context, MaterialPageRoute(builder: (context) => about()));
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
                          onPressed: () async {
                            Navigator.pop(context);
                            final prefs = await SharedPreferences.getInstance();
                            await prefs.clear();
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
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

  void _showDialog(BuildContext context, String selectedLanguage) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Select Language'),
          backgroundColor: Theme.of(context).brightness == Brightness.dark
              ? Colors.grey.shade900
              : Colors.white,
          content: StatefulBuilder(
            builder: (context, setStateDialog) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RadioListTile<String>(
                    title: const Text('English'),
                    value: 'English',
                    activeColor: Colors.green,
                    groupValue: selectedLanguage,
                    onChanged: (value) {
                      setStateDialog(() {
                        selectedLanguage = value!;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: const Text('Hindi'),
                    value: 'Hindi',
                    activeColor: Colors.green,
                    groupValue: selectedLanguage,
                    onChanged: (value) {
                      setStateDialog(() {
                        selectedLanguage = value!;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: const Text('Marathi'),
                    value: 'Marathi',
                    activeColor: Colors.green,
                    groupValue: selectedLanguage,
                    onChanged: (value) {
                      setStateDialog(() {
                        selectedLanguage = value!;
                      });
                    },
                  ),
                ],
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel', style: TextStyle(color:Colors.green,),),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK', style: TextStyle(color: Colors.green,),),
            ),
          ],
        );
      },
    );
  }
}

