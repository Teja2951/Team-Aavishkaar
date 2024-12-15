import 'package:aavishkaar/Blogs/blog_detail_page.dart';
import 'package:flutter/material.dart';

class BlogCard extends StatelessWidget {
  final String title;
  final String author;
  final String imageUrl;
  final String imageUrl2;
  final String createdAt;
  final String content;

  const BlogCard({
    Key? key,
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.imageUrl2,
    required this.createdAt,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the BlogDetail page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlogDetailPage(
              title: title,
              author: author,
              imageUrl: imageUrl,
              imageUrl2: imageUrl2,
              createdAt: createdAt,
              content: content,
            ),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        elevation: 4.0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              // Image thumbnail
              imageUrl.isNotEmpty
                  ? Image.network(
                      imageUrl,
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      height: 60,
                      width: 60,
                      color: Colors.grey[300],
                      child: const Icon(Icons.image_not_supported),
                    ),
              const SizedBox(width: 16),
              // Article details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'By $author',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _formatDate(createdAt),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Utility function to format dates
  String _formatDate(String date) {
    final parsedDate = DateTime.parse(date);
    return '${parsedDate.day}/${parsedDate.month}/${parsedDate.year}';
  }
}
