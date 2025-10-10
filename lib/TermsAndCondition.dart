import 'package:flutter/material.dart';

class Termsandcondition extends StatelessWidget {
  const Termsandcondition({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Terms And Condition",
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
              "Terms & Conditions",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              "By using Herbal Gallery, you agree to the following terms:",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 12),
            Text(
              "1. Content Usage",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              "All content in the app is for personal use only. Redistribution or commercial use is prohibited.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 12),
            Text(
              "2. User Responsibilities",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              "You must not misuse the app, provide false information, or attempt unauthorized access.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 12),
            Text(
              "3. Liability",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              "We are not responsible for any harm or loss caused by the use of this app or the information provided.",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
