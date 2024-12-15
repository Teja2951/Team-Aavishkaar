import 'package:aavishkaar/Blogs/blog_card.dart';
import 'package:aavishkaar/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class BlogLists extends StatelessWidget {
  const BlogLists({super.key});

  // Stream method to fetch articles from Supabase
  Stream<List<Map<String, dynamic>>> streamArticles() {
    return Supabase.instance.client
        .from('Blogs')
        .stream(primaryKey: ['id']) // Use a unique key
        .order('created_at', ascending: false) // Order by the latest articles
        .map((data) => List<Map<String, dynamic>>.from(data));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blueAccent,
        child: Icon(Icons.add, color: Colors.white),
      ),
      appBar: AppBar(
        title: const Text('Constitutional Blogs'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LandingPage())
            );
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'),
            fit: BoxFit.cover,
            opacity: 0.2,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'This is where the learning begins!',
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.blueAccent),
                ),
                Divider(color: Colors.blueAccent),
                SizedBox(height: 16),
                // StreamBuilder to fetch and display blog articles
                StreamBuilder<List<Map<String, dynamic>>>(
                  stream: streamArticles(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(
                        child: Text('No blogs available at the moment.'),
                      );
                    }

                    final articles = snapshot.data!;

                    return ListView.builder(
                      shrinkWrap: true, // Prevent ListView from expanding indefinitely
                      physics: const NeverScrollableScrollPhysics(), // Let parent scroll handle it
                      itemCount: articles.length,
                      itemBuilder: (context, index) {
                        final article = articles[index];
                        return BlogCard(
                          title: article['title'],
                          author: article['author'],
                          imageUrl: article['image_url'],
                          imageUrl2: article['image_url2'],
                          createdAt: article['created_at'],

                          content: article['content'],

                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}