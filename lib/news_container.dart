import 'package:flutter/material.dart';

class NewsContainer extends StatelessWidget {
  final String imageUrl;
  final String newsHeading;
  final String newsDescription;

  NewsContainer({
    super.key,
    required this.imageUrl,
    required this.newsHeading,
    required this.newsDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imageUrl,
            height: 400,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover, // Ensures the image fits nicely
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add some padding
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    newsHeading,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    softWrap: true, // Ensures the text wraps
                    overflow: TextOverflow.visible, // Prevents clipping
                    textAlign: TextAlign.center, // Center the text if required
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add padding to description
            child: Text(
              newsDescription,
              style: TextStyle(fontSize: 16),
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
