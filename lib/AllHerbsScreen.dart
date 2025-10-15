import 'package:flutter/material.dart';
import '../model/herb_model.dart';
import '../cards/herb_card.dart';

class AllHerbsScreen extends StatelessWidget {
  final String category; // category name
  final List<Herb> allHerbs; // list passed from home screen

  const AllHerbsScreen({
    super.key,
    required this.category,
    required this.allHerbs,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          category,
          style: TextStyle(color: isDark ? Colors.black : Colors.white),
        ),
        iconTheme: IconThemeData(color: isDark ? Colors.black : Colors.white),
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Colors.green.shade500
            : Colors.green.shade800,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 columns
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 3 / 4,
        ),
        itemCount: allHerbs.length,
        itemBuilder: (context, index) {
          return HerbCard(herb: allHerbs[index]);
        },
      ),
    );
  }
}
