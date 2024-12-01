import 'package:aavishkaar/custom_splash.dart';
import 'package:aavishkaar/story_screen.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ArticleDisplay extends StatefulWidget {
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
  State<ArticleDisplay> createState() => _ArticleDisplayState();
}

class _ArticleDisplayState extends State<ArticleDisplay> {
  final SupabaseClient supabase = Supabase.instance.client;

  String getTableName(int articleNo) {
  if (articleNo >= 52 && articleNo <= 151) {
    return 'articles';
  } else {
    return 'articles6';
  }
}


  Future<void> toggleCompletionStatus(String article_no, bool isCompleted) async {
  try {
    final tableName = getTableName(int.parse(article_no));
    final response = await supabase
        .from('$tableName')
        .update({'is_Completed': !isCompleted}) // Toggle the value
        .eq('article_no', article_no);

    if (response.error != null) {
      throw Exception("kya" + response.error!.message);
    }

    print('Completion status toggled successfully');
    setState(() {}); // Refresh the UI
  } catch (e) {
    print('Error toggling completion status: $e');
  }
}

Future<bool> getCurrentStatus(String article_no) async {
  try {
    final tableName = getTableName(int.parse(article_no));
    final response = await supabase
        .from('$tableName')
        .select('is_Completed') // Fetch only the isCompleted field
        .eq('article_no', article_no)
        .maybeSingle(); // Returns null if no record is found

    if (response == null) {
      throw Exception("No data found for article_no: $article_no");
    }

    return response['is_Completed'] as bool; // Extract and return the isCompleted value
  } catch (e) {
    print('Error fetching current status: $e');
    return false; // Default to false in case of an error
  }
}

Future<void> toggleBookmarkStatus(String article_no, bool isBookmarked) async {
  try {
    final tableName = getTableName(int.parse(article_no));
    final response = await supabase
        .from('$tableName')
        .update({'is_bookmarked': !isBookmarked}) // Toggle the value
        .eq('article_no', article_no);

    if (response.error != null) {
      throw Exception("Error toggling bookmark: ${response.error!.message}");
    }

    print('Bookmark status toggled successfully');
    setState(() {}); // Refresh UI after successful operation
  } catch (e) {
    print('Error toggling bookmark status: $e');
  }
}


Future<bool> getBookmarkStatus(String article_no) async {
  try {
    final tableName = getTableName(int.parse(article_no));
    final response = await supabase
        .from('$tableName')
        .select('is_bookmarked') // Fetch only the isBookmarked field
        .eq('article_no', article_no)
        .maybeSingle();

    if (response == null) {
      throw Exception("No data found for article_no: $article_no");
    }

    return response['is_bookmarked'] as bool; // Return the isBookmarked value
  } catch (e) {
    print('Error fetching bookmark status: $e');
    return false; // Default to false in case of error
  }
}





  Widget build(BuildContext context) {
    final String? videoId = YoutubePlayer.convertUrlToId(widget.article_yt);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CustomSplash(nextScreen: StoryScreen(articleText: widget.article_no.toString())) //StoryScreen(articleText: article_no.toString()),
        ),
      );
    },
        child: Icon(Icons.switch_access_shortcut_add_rounded),
      ),
      appBar: AppBar(
  toolbarHeight: 70, // Increase height for a bolder look
  flexibleSpace: Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.blueAccent, Colors.purpleAccent],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
  ),
  title: Text(
    'Article ${widget.article_no}',
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 22,
      letterSpacing: 1.2,
      color: Colors.white,
    ),
  ),
  centerTitle: true,
  actions: [
    // Bookmark Button
    FutureBuilder<bool>(
      future: getBookmarkStatus(widget.article_no.toString()),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return IconButton(
            icon: Icon(Icons.bookmark),
            onPressed: null, // Disable button while loading
          );
        }
        final isBookmarked = snapshot.data ?? false;
        return IconButton(
          icon: Icon(
            isBookmarked ? Icons.bookmark : Icons.bookmark_border,
            color: isBookmarked ? Colors.yellow : Colors.white,
          ),
          onPressed: () async {
            await toggleBookmarkStatus(widget.article_no.toString(), isBookmarked);
            setState(() {}); // Refresh UI
          },
        );
      },
    ),
    // Mark as Completed Button
    FutureBuilder<bool>(
      future: getCurrentStatus(widget.article_no.toString()),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return IconButton(
            icon: Icon(Icons.check_box_outline_blank),
            onPressed: null, // Disable button while loading
          );
        }
        final isCompleted = snapshot.data ?? false;
        return IconButton(
          icon: Icon(
            isCompleted ? Icons.check_box : Icons.check_box_outline_blank,
            color: isCompleted ? Colors.greenAccent : Colors.white,
          ),
          onPressed: () async {
            await toggleCompletionStatus(widget.article_no.toString(), isCompleted);
            setState(() {}); // Refresh UI
          },
        );
      },
    ),
  ],
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(
      bottom: Radius.circular(20),
    ),
  ),
),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Original Text Section
            _buildExpandableSection(
              title: 'Original Text',
              content: widget.article_og,
            ),

            SizedBox(height: 20),

            // Simplified Text Section
            _buildExpandableSection(
              title: 'Simplified Text',
              content: widget.article_st,
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
