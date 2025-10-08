// lib/screens/herb_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'model/herb_model.dart';

class HerbDetailScreen extends StatefulWidget {
  final Herb herb;

  const HerbDetailScreen({super.key, required this.herb});

  @override
  State<HerbDetailScreen> createState() => _HerbDetailScreenState();
}

class _HerbDetailScreenState extends State<HerbDetailScreen> {
  bool isLiked = false;
  final List<String> tags = ["Medicinal", "Leafy", "Ayurvedic", "Pain Relief"];
  int _currentIndex = 0; // For carousel indicator

  void _toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  void _onShare() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Share clicked')));
  }

  void _onComment() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Comment clicked')));
  }

  @override
  Widget build(BuildContext context) {
    final herb = widget.herb;

    // Carousel images list
    final List<String> images = [herb.image]; // Add more URLs if available

    return Scaffold(
      appBar: AppBar(
        title: Text(herb.name),
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Colors.green.shade500
            : Colors.green.shade800,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Carousel
            CarouselSlider(
              options: CarouselOptions(
                height: 250,
                enlargeCenterPage: true,
                autoPlay: true,
                viewportFraction: 0.9,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              items: images.map((imageUrl) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 8),

            // Carousel indicators
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: images.asMap().entries.map((entry) {
                int idx = entry.key;
                return Container(
                  width: 5,
                  height: 5,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: _currentIndex == idx
                        ? Colors.green
                        : Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 5),

            // Like / Comment / Share Row
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Like icon
                IconButton(
                  icon: Icon(
                    isLiked ? Icons.favorite : Icons.favorite_border,
                    color: isLiked
                        ? Colors.red
                        : Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.grey,
                  ),
                  onPressed: _toggleLike,
                ),
                // Comment icon
                IconButton(
                  icon: Icon(
                    Icons.comment,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.grey,
                  ),
                  onPressed: _onComment,
                ),
                // Share icon
                IconButton(
                  icon: Icon(
                    Icons.share,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.grey,
                  ),
                  onPressed: _onShare,
                ),
              ],
            ),

            // Example: dynamic list of tags
            Wrap(
              spacing: 8, // horizontal space between tags
              runSpacing: 6, // vertical space when wrapping to new line
              children: tags.map((tag) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.green),
                  ),
                  child: Text(
                    "#$tag",
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 16),

            // --------Herb Name & short Description --------
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12.0),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    herb.name,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    herb.description,
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),

            const Divider(),

            // ------- Region Found --------
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12.0),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Region Found",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Originally from Arabian Peninsula,"
                    "now cultivated worldwide in tropical,"
                    "semi-tropical, and arid climates."
                    "Commonly found in Africa, India, and Mediterranean regions.",
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),

            const Divider(),

            // ------- Basic Detail & Types --------
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12.0),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Basic Details & Types",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Originally from Arabian Peninsula,"
                    "now cultivated worldwide in tropical,"
                    "semi-tropical, and arid climates."
                    "Commonly found in Africa, India, and Mediterranean regions.",
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),

            const Divider(),

            // ------- Daily Life Use --------
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12.0),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Daily Life Use",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Originally from Arabian Peninsula,"
                    "now cultivated worldwide in tropical,"
                    "semi-tropical, and arid climates."
                    "Commonly found in Africa, India, and Mediterranean regions.",
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),

            const Divider(),

            // ------- Precautions --------
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Precautions",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Originally from Arabian Peninsula,"
                    "now cultivated worldwide in tropical,"
                    "semi-tropical, and arid climates."
                    "Commonly found in Africa, India, and Mediterranean regions.",
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
