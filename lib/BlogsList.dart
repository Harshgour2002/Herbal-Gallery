import 'package:flutter/material.dart';
import 'package:herbal_gallary/BlogDetailPage.dart';
import '../dummyData/dummy_data.dart';
import '../widgets/BlogsCard.dart';

class Blogslist extends StatelessWidget {
  const Blogslist({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "All Blogs",
          style: TextStyle(color: isDark ? Colors.black : Colors.white),
        ),
        iconTheme: IconThemeData(color: isDark ? Colors.black : Colors.white),
        backgroundColor: isDark ? Colors.green.shade800 : Colors.green.shade500,
      ),
      body: ListView.builder(
        itemCount: dailyBlogs.length,
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemBuilder: (context, index) {
          final blog = dailyBlogs[index];
          return GestureDetector(
            child: BlogCardWidget(
              title: blog['title']!,
              description: blog['description']!,
              imageUrl: blog['imageUrl']!,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlogDetailPage(
                    title: blog["title"] ?? " ",
                    description: blog["description"] ?? " ",
                    imageUrl: blog["imageUrl"] ?? " ",
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
