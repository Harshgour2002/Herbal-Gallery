import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _allItems = [
    "Apple",
    "Banana",
    "Orange",
    "Mango",
    "Grapes",
    "Pineapple",
    "Strawberry",
    "Blueberry",
    "Watermelon",
    "Peach",
    "Cherry",
    "Kiwi",
  ];
  List<String> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _filteredItems = List.from(_allItems);

    _searchController.addListener(() {
      final query = _searchController.text.toLowerCase();
      setState(() {
        _filteredItems = _allItems
            .where((item) => item.toLowerCase().contains(query))
            .toList();
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
    return Column(
      children: [
        // Search Bar
        Container(
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.green.shade500
              : Colors.green.shade800,
          padding: const EdgeInsets.all(8),
          child: Container(
            height: 47,
            decoration: BoxDecoration(
              color: isDark ? Colors.grey.shade400 : Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextField(
              textAlignVertical: TextAlignVertical.center,
              controller: _searchController,
              autofocus: false,
              cursorColor: Colors.green,
              style: TextStyle(color: isDark ? Colors.black : Colors.black, fontSize: 18),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(right: 15),
                fillColor: isDark ? Colors.grey : Colors.white,
                hintText: "Search...", hintStyle: TextStyle(color: isDark ? Colors.grey.shade600 : Colors.grey.shade400),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                prefixIcon: Icon(Icons.search, color: isDark ? Colors.grey.shade600 : Colors.black),
              ),
            ),
          ),
        ),
        // Search Results
        Expanded(
          child: _filteredItems.isEmpty
              ? const Center(
            child: Text(
              "No results found",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          )
              : ListView.builder(
            itemCount: _filteredItems.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: const Icon(Icons.search, color: Colors.green),
                title: Text(_filteredItems[index]),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content:
                      Text("You selected ${_filteredItems[index]}"),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
