// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:herbal_gallary/SearchScreen.dart';
import '../model/herb_model.dart';
import '../cards/herb_card.dart';
import 'AllHerbsScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  int _carouselIndex = 0;

  double cardHeight = 150;

  final List<String> _appBarTitles = [
    "Home",
    "Search",
    "Favorites",
    "Explore",
    "Profile",
  ];

  final List<Herb> herbList = [
    Herb(
      image: "https://picsum.photos/id/1011/800/400",
      name: "Basil",
      description: "A common herb used in cooking.",
    ),
    Herb(
      image: "https://picsum.photos/id/1012/800/400",
      name: "Mint",
      description: "Refreshing herb, great for drinks.",
    ),
    Herb(
      image: "https://picsum.photos/id/1013/800/400",
      name: "Rosemary",
      description: "Perfect for roasted dishes.",
    ),
    Herb(
      image: "https://picsum.photos/id/1015/800/400",
      name: "Thyme",
      description: "Excellent for stews and sauces.",
    ),
    Herb(
      image: "https://picsum.photos/id/1016/800/400",
      name: "Sage",
      description: "Used in poultry and stuffing.",
    ),
    Herb(
      image: "https://picsum.photos/id/1018/800/400",
      name: "Cilantro",
      description: "Adds fresh flavor to salads and curries.",
    ),
    Herb(
      image: "https://picsum.photos/id/1020/800/400",
      name: "Parsley",
      description: "Great garnish and seasoning herb.",
    ),
    Herb(
      image: "https://picsum.photos/id/1024/800/400",
      name: "Oregano",
      description: "Popular in Italian dishes.",
    ),
    Herb(
      image: "https://picsum.photos/id/1025/800/400",
      name: "Dill",
      description: "Perfect with fish and pickles.",
    ),
    Herb(
      image: "https://picsum.photos/id/1027/800/400",
      name: "Chives",
      description: "Adds mild onion flavor to dishes.",
    ),
    Herb(
      image: "https://picsum.photos/id/1028/800/400",
      name: "Lavender",
      description: "Used for desserts and calming teas.",
    ),
  ];

  final List<String> imageList = [
    "https://picsum.photos/id/1011/800/400",
    "https://picsum.photos/id/1012/800/400",
    "https://picsum.photos/id/1013/800/400",
    "https://picsum.photos/id/1015/800/400",
    "https://picsum.photos/id/1016/800/400",
    "https://picsum.photos/id/1018/800/400",
    "https://picsum.photos/id/1020/800/400",
    "https://picsum.photos/id/1024/800/400",
    "https://picsum.photos/id/1025/800/400",
    "https://picsum.photos/id/1027/800/400",
    "https://picsum.photos/id/1028/800/400",
  ];

  // ---------------- Home Content ----------------
  Widget _buildHomeContent() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          // Carousel
          CarouselSlider(
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height * 0.25,
              autoPlay: true,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(() => _carouselIndex = index);
              },
            ),
            items: imageList.map((url) {
              return GestureDetector(
                onTap: () {
                  // TODO: Handle carousel image tap
                  // Example: show a dialog, navigate, etc.
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Tapped image: ' + url)),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    url,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              );
            }).toList(),
          ),
          // Indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imageList.asMap().entries.map((entry) {
              return Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green.withOpacity(
                    _carouselIndex == entry.key ? 0.9 : 0.2,
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 10),
          // Horizontal Herb List + See All Card
          SizedBox(
            height: cardHeight + 16,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: herbList.length > 3 ? 4 : herbList.length,
              itemBuilder: (context, index) {
                if (index < 3) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: HerbCard(herb: herbList[index]),
                  );
                } else {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => AllHerbsScreen(
                            category: "category",
                            allHerbs: herbList,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: 120,
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.green.shade50,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.green.shade200,
                          width: 1.5,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.green.shade800,
                            size: 30,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "See All",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.green.shade800,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Build screens dynamically to allow carousel indicator updates
    final screens = [
      _buildHomeContent(),
      const SearchScreen(),
      const Center(child: Text("Favorites", style: TextStyle(fontSize: 20))),
      const Center(child: Text("Explore", style: TextStyle(fontSize: 20))),
      const Center(child: Text("Profile", style: TextStyle(fontSize: 20))),
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Colors.green.shade200
            : Colors.green.shade700,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _appBarTitles[_currentIndex],
              style: TextStyle(fontSize: 18),
            ), // Logo or icon
            const Text(
              "Herbal Gallery",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: screens[_currentIndex],
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  // ---------------- Bottom Navigation Bar ----------------
  Widget _buildBottomNavigation() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      onTap: (index) {
        setState(() => _currentIndex = index);
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorites"),
        BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explore"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],
    );
  }
}
