// lib/widgets/SearchWidget.dart
import 'package:flutter/material.dart';

class SearchWidgetCarousel extends StatefulWidget {
  const SearchWidgetCarousel({super.key});

  @override
  State<SearchWidgetCarousel> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidgetCarousel> {
  late final PageController _pageController;
  int _selectedIndex = 1; // Voice icon selected by default

  final List<Map<String, dynamic>> _options = [
    {'icon': Icons.image, 'label': 'Image'},
    {'icon': Icons.mic, 'label': 'Voice'},
    {'icon': Icons.search, 'label': 'Text'},
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.20,
      initialPage: _selectedIndex,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _handleSelection(int index) {
    switch (index) {
      case 0:
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Image search selected")));
        break;
      case 1:
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Voice search selected")));
        break;
      case 2:
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Text search selected")));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: PageView.builder(
        controller: _pageController,
        itemCount: _options.length,
        onPageChanged: (index) {
          if (_selectedIndex != index) {
            setState(() => _selectedIndex = index);
          }
        },
        itemBuilder: (context, index) {
          final isSelected = _selectedIndex == index;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOut,
            margin: const EdgeInsets.symmetric(horizontal: 2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedScale(
                  scale: isSelected ? 1.0 : 0.7,
                  duration: const Duration(milliseconds: 250),
                  child: GestureDetector(
                    onTap: () {
                      if (_selectedIndex == index) {
                        _handleSelection(index);
                      } else {
                        _pageController.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                        );
                      }
                    },
                    child: Container(
                      width: isSelected ? 50 : 42,
                      height: isSelected ? 50 : 42,
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.green : Colors.grey[300],
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: isSelected
                            ? [
                          BoxShadow(
                            color: Colors.green.withOpacity(0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          )
                        ]
                            : [],
                      ),
                      child: Icon(
                        _options[index]['icon'],
                        color: isSelected ? Colors.white : Colors.black54,
                        size: 22,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                AnimatedOpacity(
                  opacity: isSelected ? 1 : 0.4,
                  duration: const Duration(milliseconds: 100),
                  child: Text(
                    _options[index]['label'],
                    style: TextStyle(
                      fontSize: isSelected ? 13 : 10,
                      fontWeight:
                      isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
