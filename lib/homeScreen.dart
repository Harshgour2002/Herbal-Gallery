import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

// ---------------- Herb Detail Screen ----------------
class HerbDetailScreen extends StatelessWidget {
  final Map<String, String> herb;

  const HerbDetailScreen({super.key, required this.herb});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ✅ FIXED: use shade200 / shade700
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Colors.green.shade200
            : Colors.green.shade700,
        title: Text(herb['name'] ?? "Unknown Herb"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                herb['image']!,
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              herb['name'] ?? "Unknown",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              herb['description'] ?? "No description available",
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------- Home Screen ----------------
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // carousel index
  int _selectedIndex = 0; // bottom nav index

  final List<Map<String, String>> herbList = [
    {
      "image": "https://picsum.photos/id/1011/800/400",
      "name": "Basil",
      "description": "A common herb used in cooking."
    },
    {
      "image": "https://picsum.photos/id/1012/800/400",
      "name": "Mint",
      "description": "Refreshing herb, great for drinks."
    },
    {
      "image": "https://picsum.photos/id/1013/800/400",
      "name": "Rosemary",
      "description": "Perfect for roasted dishes."
    },
    {
      "image": "https://picsum.photos/id/1014/800/400",
      "name": "Thyme",
      "description": "A versatile herb for many recipes."
    },
    {
      "image": "https://picsum.photos/id/1015/800/400",
      "name": "Cilantro",
      "description": "Adds a fresh flavor to dishes."
    },
    {
      "image": "https://picsum.photos/id/1016/800/400",
      "name": "Parsley",
      "description": "Common garnish and flavor enhancer."
    }
  ];

  final List<String> imageList = [
    "https://picsum.photos/id/1011/800/400",
    "https://picsum.photos/id/1012/800/400",
    "https://picsum.photos/id/1013/800/400",
    "https://picsum.photos/id/1014/800/400",
    "https://picsum.photos/id/1015/800/400",
    "https://picsum.photos/id/1016/800/400",
    "https://picsum.photos/id/1018/800/400",
    "https://picsum.photos/id/1020/800/400",
  ];

  bool _showSearch = false;
  final TextEditingController _searchController = TextEditingController();

  // -------- Home Content (carousel + grid) --------
  Widget _buildHomeContent() {
    return Column(
      children: [
        const SizedBox(height: 20),
        // Carousel
        CarouselSlider(
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height * 0.25,
            autoPlay: true,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() => _currentIndex = index);
            },
          ),
          items: imageList.asMap().entries.map((entry) {
            int index = entry.key;
            String url = entry.value;
            return GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Clicked on image index: $index")),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(url, fit: BoxFit.cover, width: double.infinity),
              ),
            );
          }).toList(),
        ),
        // Dots
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imageList.asMap().entries.map((entry) {
            int index = entry.key;
            return Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green.withOpacity(_currentIndex == index ? 0.9 : 0.2),
              ),
            );
          }).toList(),
        ),
        // Herbs Grid
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(8.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 8.0, mainAxisSpacing: 8.0, childAspectRatio: 3 / 4,
            ),
            itemCount: herbList.length,
            itemBuilder: (context, index) {
              final herb = herbList[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => HerbDetailScreen(herb: herb)),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  elevation: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        child: Image.network(herb['image']!, fit: BoxFit.cover, height: 100),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                        child: Text(
                          herb['name']!,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          herb['description']!,
                          style: const TextStyle(fontSize: 14, color: Colors.grey),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // -------- Scaffold --------
  @override
  Widget build(BuildContext context) {
    final screens = [
      _buildHomeContent(),
      const Center(child: Text("Favorites", style: TextStyle(fontSize: 20))),
      const Center(child: Text("Profile", style: TextStyle(fontSize: 20))),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade200,
        title: const Text("Herbal Gallery", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(_showSearch ? Icons.close : Icons.search),
            onPressed: () {
              // You can replace with SearchScreen later
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Search tapped")),
              );
            },
          ),
        ],
      ),
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorites"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

// ---------------- Main ----------------
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.green,
    ),
    darkTheme: ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.green,
    ),
    themeMode: ThemeMode.system, // auto switch
    home: const HomeScreen(),
  ));
}
