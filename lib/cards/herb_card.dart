// lib/widgets/herb_card.dart
import 'package:flutter/material.dart';
import '../herb_detail_screen.dart';
import '../model/herb_model.dart';

class HerbCard extends StatelessWidget {
  final Herb herb;
  const HerbCard({super.key, required this.herb});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to detail screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => HerbDetailScreen(herb: herb)),
        );
      },
      child: SizedBox(
        width: 150, // fixed width for horizontal ListView
        child: Card(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 4, // Increased elevation for a better shadow
          clipBehavior: Clip.antiAlias, // Clips the content to the card's shape
          child: AspectRatio(
            // 1. Set the desired 9:16 aspect ratio
            aspectRatio:1/1,
            // 2. Use a Stack to layer the image and text
            child: Stack(
              fit: StackFit.expand, // Make children fill the Stack
              children: [
                // The Image is the bottom layer
                Image.network(
                  herb.image,
                  fit: BoxFit.cover, // Cover the entire card area
                ),
                // Add a gradient overlay for better text readability
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      stops: const [0.0, 0.4],
                    ),
                  ),
                ),
                // 3. Position the text on top of the image
                Positioned(
                  bottom: 10.0,
                  left: 8.0,
                  right: 8.0,
                  child: Text(
                    herb.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(1.0, 1.0),
                          blurRadius: 3.0,
                          color: Colors.black54,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2, // Allow up to two lines for longer names
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
