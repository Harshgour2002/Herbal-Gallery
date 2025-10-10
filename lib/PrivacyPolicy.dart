import 'package:flutter/material.dart';

class Privacypolicy extends StatelessWidget {
  const Privacypolicy({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Privacy Policy",
          style: TextStyle(color: isDark ? Colors.black : Colors.white),
        ),
        backgroundColor: isDark ? Colors.green.shade800 : Colors.green.shade500,
        centerTitle: true,
        iconTheme: IconThemeData(color: isDark ? Colors.black : Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Privacy Policy",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              "Your privacy is important to us. We collect and use information only for the purpose of enhancing your experience in Herbal Gallery app. "
              "We do not share your personal data with third parties without your consent.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 12),
            Text(
              "Information We Collect:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              "- Name and email\n- App usage data\n- Preferences and feedback",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 12),
            Text(
              "How We Use Information:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              "- Improve app experience\n- Provide personalized content\n- Respond to your queries",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
