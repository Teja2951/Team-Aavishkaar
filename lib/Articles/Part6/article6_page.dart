import 'package:aavishkaar/Auth/auth_service.dart';
import 'package:aavishkaar/Articles/Display/custom_tile.dart';
import 'package:aavishkaar/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Article6Page extends StatefulWidget {
  const Article6Page({super.key});

  @override
  State<Article6Page> createState() => _Article6PageState();
}

class _Article6PageState extends State<Article6Page> {
  final authService = AuthService();
  final _stream = Supabase.instance.client.from('articles6').stream(primaryKey: ['id']);
  TextEditingController searchController = TextEditingController();
  String searchTerm = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 5,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 28),
          onPressed: () =>Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LandingPage()),
            )
        ),
        title: Text(
          "Part 6",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrangeAccent,
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onPressed: () {
              // Define your action here
            },
            icon: Icon(Icons.school, size: 20, color: Colors.white),
            label: Text(
              "Learn Mode",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
          SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              // Search Bar
              TextField(
                controller: searchController,
                onChanged: (value) {
                  setState(() {
                    searchTerm = value; // Update the search term
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Search Articles',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              SizedBox(height: 20),
              // Banner Container
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey,
                ),
                // Add an image if needed
                // child: Image.network(
                //   'https://img.freepik.com/free-vector/red-banner-design-white-background_1308-96833.jpg?semt=ais_hybrid',
                //   fit: BoxFit.fill,
                // ),
              ),
              SizedBox(height: 20),
              // Stream Builder for Articles
              StreamBuilder<List<Map<String, dynamic>>>(
                stream: _stream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No articles available.'));
                  }

                  // Filter articles based on search term
                  final filteredArticles = snapshot.data!
                      .where((article) =>
                          searchTerm.isEmpty ||
                          article['article_no']
                              .toString()
                              .toLowerCase()
                              .contains(searchTerm.toLowerCase()))
                      .toList();

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: filteredArticles.length,
                    itemBuilder: (context, index) {
                      return CustomArticleCard(
                        articleNo: filteredArticles[index]['article_no'],
                        shortDescription: filteredArticles[index]['article_sd'],
                        originalText: filteredArticles[index]['article_og_txt'] ?? 'No Original Text',
                        simplifiedText: filteredArticles[index]['article_sim_text'] ?? 'No Simplified Text',
                        part: filteredArticles[index]['part'] ?? '404',
                        link: filteredArticles[index]['article_link'],
                        type: filteredArticles[index]['type'],
                        isCompleted: filteredArticles[index]['is_Completed'], // add the supabase columns
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
