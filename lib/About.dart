import 'package:flutter/material.dart';

class about extends StatelessWidget {
  const about({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "About Us",
          style: TextStyle(color: isDark ? Colors.black : Colors.white),
        ),
        backgroundColor: isDark ? Colors.green.shade800 : Colors.green.shade500,
        iconTheme: IconThemeData(color: isDark ? Colors.black : Colors.white),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // App Logo Placeholder
            Center(
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.local_florist,
                      size: 60,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Herbal Gallery",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "About Herbal Gallery",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              "Herbal Gallery is your ultimate guide to herbs from around the world. "
                  "Discover the benefits, uses, and details of a wide variety of herbs. "
                  "Our goal is to provide an easy-to-use platform for both beginners and enthusiasts.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            const Text(
              "Features",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              "- Browse herbs by region and preference\n"
                  "- Detailed information about each herb\n"
                  "- Add herbs to your favorites\n"
                  "- Contact support for queries",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            const Text(
              "Version",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              "1.0.0",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            const Text(
              "Developer",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              "Harsh Gour\nEmail: developer@example.com",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
