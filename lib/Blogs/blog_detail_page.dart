import 'package:flutter/material.dart';

class BlogDetailPage extends StatelessWidget {
  final String title;
  final String author;
  final String imageUrl;
  final String imageUrl2;
  final String createdAt;
  final String content;

  const BlogDetailPage({
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blog Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Blog image
              imageUrl2.isNotEmpty
                  ? Image.network(
                      imageUrl2,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      height: 200,
                      width: double.infinity,
                      color: Colors.grey[300],
                      child: const Icon(Icons.image_not_supported),
                    ),
              const SizedBox(height: 16),
              // Blog title
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              // Author and Date
              Text(
                'By $author | ${_formatDate(createdAt)}',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const Divider(height: 32),
              // Blog content
              Text(
                content,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.5,
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
