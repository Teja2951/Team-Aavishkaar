import 'package:aavishkaar/One_minute/news_container.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OneMinuteRead extends StatefulWidget {
  const OneMinuteRead({super.key});

  @override
  State<OneMinuteRead> createState() => _OneMinuteReadState();
}

class _OneMinuteReadState extends State<OneMinuteRead> {
  // Supabase stream to fetch real-time updates
  final _stream = Supabase.instance.client.from('OneMinute').stream(primaryKey: ['id']);

  @override
  Widget build(BuildContext context) {
    // Get screen height to ensure it doesn't overlap with the bottom navigation
    double screenHeight = MediaQuery.of(context).size.height;
    double navBarHeight = kBottomNavigationBarHeight;  // The height of the bottom nav bar
    double availableHeight = screenHeight - navBarHeight;  // Remaining height after excluding the nav bar

    return Container(
      height: availableHeight,  // Adjust the container height to fit the screen
      width: double.infinity,
      margin: EdgeInsets.zero,  // No margin, to make it take up the full screen width
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),  // Optional: smooth corners
      ),
      child: StreamBuilder<List<Map<String, dynamic>>>(
        stream: _stream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No content available.'));
          }

          final contentList = snapshot.data!;

          // Debugging
          print("Number of items: ${contentList.length}");

          return PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: contentList.length,
            itemBuilder: (context, index) {
              final content = contentList[index];

              return NewsContainer(
                imageUrl: content['image_url'] ?? '',
                newsHeading: content['heading'] ?? 'No Heading',
                newsDescription: content['description'] ?? 'No Description',
              );
            },
          );
        },
      ),
    );
  }
}

class NewsContainer extends StatelessWidget {
  final String imageUrl;
  final String newsHeading;
  final String newsDescription;

  const NewsContainer({
    Key? key,
    required this.imageUrl,
    required this.newsHeading,
    required this.newsDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,  // Add a shadow to the card for a floating effect
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),  // Rounded corners
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [Colors.yellow.shade200, Colors.orange.shade100],  // Add a gradient for a vibrant look
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section (with rounded corners and some border)
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              child: imageUrl.isNotEmpty
                  ? Image.network(
                      imageUrl,
                      width: double.infinity,
                      height: 180,
                      fit: BoxFit.cover,  // Ensure image covers the entire area
                    )
                  : Container(
                      height: 180,
                      color: Colors.grey.shade300,
                      child: Center(child: Text('No Image Available')),
                    ),
            ),
    
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Heading Section
                  Text(
                    newsHeading,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,  // Heading color
                    ),
                    maxLines: 2,  // Limit heading to two lines if it's too long
                    overflow: TextOverflow.ellipsis,  // Handle overflow
                  ),
    
                  SizedBox(height: 10),
    
                  // Description Section with text overflow handling
                  Text(
                    newsDescription,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,  // Subtle color for description
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
