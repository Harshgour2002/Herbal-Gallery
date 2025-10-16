import 'package:flutter/material.dart';
import '../dummyData/dummy_data.dart';
class Explorewidget extends StatefulWidget {
  const Explorewidget({super.key});

  @override
  State<Explorewidget> createState() => _ExplorewidgetState();
}

class _ExplorewidgetState extends State<Explorewidget> {
  final TextEditingController _searchController = TextEditingController();

  final List<String> filter = [
    "Leafy",
    "Medicinal",
    "Spices",
    "Aromatic",
    "Culinary",
    "Wild",
    "Flowering",
    "Shrubs",
    "Climbers",
    "Fruity",
    "Desert",
    "Aquatic",
  ];

  int selectedIndex = -1;
  String searchQuery = "";

  void handleFilterPress(int index) {
    setState(() {
      selectedIndex = selectedIndex == index ? -1 : index;
    });
    print("Selected filter: ${filter[index]}");
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        searchQuery = _searchController.text.trim().toLowerCase();
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // 🔍 Apply search filtering
    final filteredCategories = categories.map((category) {
      final List<dynamic> items = category["items"];
      final filteredItems = items
          .where((item) =>
          item["title"].toString().toLowerCase().contains(searchQuery))
          .toList();
      return {
        "name": category["name"],
        "items": filteredItems,
      };
    }).where((cat) => (cat["items"] as List).isNotEmpty).toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),

          // 🔍 Search box
          Container(
            height: 47,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green, width: 1),
              color: isDark ? Colors.grey.shade400 : Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextField(
              style: TextStyle(color: Colors.black),
              controller: _searchController,
              textAlignVertical: TextAlignVertical.center,
              cursorColor: Colors.green,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                hintText: "Search herbs...",
                hintStyle: TextStyle(
                  color: isDark ? Colors.grey.shade600 : Colors.grey.shade400,
                ),
                border: InputBorder.none,
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.search,
                        color: isDark
                            ? Colors.grey.shade600
                            : Colors.grey.shade400),
                    const SizedBox(width: 12),
                    Icon(Icons.mic,
                        color: isDark
                            ? Colors.grey.shade600
                            : Colors.grey.shade400),
                    const SizedBox(width: 18),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 12),

          // Filter buttons
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(filter.length, (index) {
                final bool isSelected = selectedIndex == index;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: ElevatedButton(
                    onPressed: () => handleFilterPress(index),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                      isSelected ? Colors.green : Colors.grey.shade300,
                      foregroundColor:
                      isSelected ? Colors.white : Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      elevation: isSelected ? 2 : 0,
                    ),
                    child: Text(filter[index]),
                  ),
                );
              }),
            ),
          ),

          const SizedBox(height: 12),

          // Dynamic category sections (filtered)
          if (filteredCategories.isEmpty)
            const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 40),
                child: Text(
                  "No herbs found 🌿",
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ),
            )
          else
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: filteredCategories.map((category) {
                final items = category["items"] as List<dynamic>;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 🏷️ Category Title
                      Text(
                        category["name"],
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),

                      // 🪴 Grid layout — 2x2
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 1,
                        ),
                        itemCount: items.length > 4 ? 4 : items.length,
                        itemBuilder: (context, index) {
                          final item = items[index];
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 1,
                            child: Column(
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(12),
                                    ),
                                    child: Image.network(
                                      item["image"],
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                      const Icon(Icons.broken_image),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 8),
                                  child: Text(
                                    item["title"],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
        ],
      ),
    );
  }
}
