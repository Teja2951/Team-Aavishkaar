import 'package:aavishkaar/custom_splash.dart';
import 'package:aavishkaar/story_screen.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ArticleDisplay extends StatelessWidget {
  final int article_no;
  final String article_og;
  final String article_st;
  final String article_yt;

  const ArticleDisplay({
    super.key,
    required this.article_no,
    required this.article_og,
    required this.article_st,
    required this.article_yt,
  });

  @override
  Widget build(BuildContext context) {
    final String? videoId = YoutubePlayer.convertUrlToId(article_yt);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CustomSplash(nextScreen: StoryScreen(articleText: article_no.toString())) //StoryScreen(articleText: article_no.toString()),
        ),
      );
    },
        child: Icon(Icons.switch_access_shortcut_add_rounded),
      ),
      appBar: AppBar(
        title: Text(
          'Article $article_no',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Original Text Section
            _buildExpandableSection(
              title: 'Original Text',
              content: article_og,
            ),

            SizedBox(height: 20),

            // Simplified Text Section
            _buildExpandableSection(
              title: 'Simplified Text',
              content: article_st,
            ),

            SizedBox(height: 20),

            // YouTube Video Section
            if (videoId != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Watch the Video',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          spreadRadius: 2,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: YoutubePlayer(
                        controller: YoutubePlayerController(
                          initialVideoId: videoId,
                          flags: YoutubePlayerFlags(
                            autoPlay: false,
                            mute: false, // Adjust based on preference
                          ),
                        ),
                        showVideoProgressIndicator: true,
                        progressIndicatorColor: Colors.blueAccent,
                      ),
                    ),
                  ),
                ],
              )
            else
              Center(
                child: Text(
                  'No video available',
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // Helper for Expandable Sections
  Widget _buildExpandableSection({
    required String title,
    required String content,
  }) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ExpansionTile(
        title: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        children: [
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              content,
              style: TextStyle(
                fontSize: 16,
                height: 1.6,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
