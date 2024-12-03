import 'package:aavishkaar/article_display.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class BookmarksScreen extends StatefulWidget {
  const BookmarksScreen({Key? key}) : super(key: key);

  @override
  State<BookmarksScreen> createState() => _BookmarksScreenState();
}

class _BookmarksScreenState extends State<BookmarksScreen> {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<List<Map<String, dynamic>>> fetchBookmarkedArticles() async {
  try {
    // Fetch articles from the 'articles' table
    final List<dynamic> part5Response = await supabase
        .from('articles')
        .select('*')
        .eq('is_bookmarked', true);

    // Fetch articles from the 'articles6' table
    final List<dynamic> part6Response = await supabase
        .from('articles6')
        .select('*')
        .eq('is_bookmarked', true);

    // Check for null responses (error scenario)
    if (part5Response == null || part6Response == null) {
      throw Exception('Failed to fetch bookmarks from one or more tables.');
    }

    // Combine results from both tables
    final List<Map<String, dynamic>> part5Bookmarks =
        List<Map<String, dynamic>>.from(part5Response);
    final List<Map<String, dynamic>> part6Bookmarks =
        List<Map<String, dynamic>>.from(part6Response);


    return [...part5Bookmarks, ...part6Bookmarks];
  } catch (e) {
    print('Error fetching bookmarked articles: $e');
    return [];
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookmarked Articles'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueAccent, Colors.purpleAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchBookmarkedArticles(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No bookmarked articles found.'));
          }

          final articles = snapshot.data!;
          return ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              final article = articles[index];
              return ListTile(
                title: Text(
                  'Article ${article['article_no']}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(article['title'] ?? 'No title available'),
                trailing: Icon(Icons.bookmark, color: Colors.yellow),
                onTap: () {
                  // Navigate to ArticleDisplay screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ArticleDisplay(
                        article_no: article['article_no'],
                        article_og: article['article_og_text'] ?? '',
                        article_st: article['article_sim_txt'] ?? '',
                        article_yt: article['article_link'] ?? '',
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
