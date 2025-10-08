import 'package:flutter/material.dart';
import '../dummyData/dummy_data.dart';
import '../widgets/BlogsCard.dart';

class Blogslist extends StatelessWidget {
  const Blogslist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Blogs"),
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Colors.green.shade500
            : Colors.green.shade800,
      ),
      body: ListView.builder(
        itemCount: dailyBlogs.length,
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemBuilder: (context, index) {
          final blog = dailyBlogs[index];
          return BlogCardWidget(
            title: blog['title']!,
            description: blog['description']!,
            imageUrl: blog['imageUrl']!,
          );
        },
      ),
    );
  }
}
