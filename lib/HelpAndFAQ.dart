import 'package:flutter/material.dart';

class Helpandfaq extends StatelessWidget {
  const Helpandfaq({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Help & FAQ",
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
              "Help & FAQ",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              "Q1: How do I search for herbs?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              "A: Use the search bar on the home screen and type the herb name or region.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 12),
            Text(
              "Q2: How can I add herbs to my favorites?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              "A: Tap the heart icon on any herb's detail page to add it to your favorites list.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 12),
            Text(
              "Q3: How do I contact support?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              "A: Go to the Contact Us page in the app and submit your query. We will respond via email.",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
