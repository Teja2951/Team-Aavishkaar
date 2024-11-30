import 'package:aavishkaar/article_display.dart';
import 'package:flutter/material.dart';

class CustomArticleCard extends StatelessWidget {
  final int articleNo;
  final String shortDescription;
  final String originalText;
  final String simplifiedText;
  final String part;
  final String link;
  final String type;

  const CustomArticleCard({
    Key? key,
    required this.articleNo,
    required this.shortDescription,
    required this.originalText,
    required this.simplifiedText,
    required this.part,
    required this.link,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shadowColor: Colors.black.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: GestureDetector(
        onTap:  () {
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => 
              ArticleDisplay(
                article_no: articleNo,
                article_og: originalText,
                article_st: simplifiedText,
                article_yt: link,
              )
            ),
        );

        },
        child: Container(
          height: 200,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.blueAccent, // Bright/dark color for card background
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Article Number (Large Text)
              Text(
                'Article $articleNo',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Bright text color
                ),
              ),
              const SizedBox(height: 10),
              
              // Article Description
              Container(
                height: 45, /*************************edit the size or change the despcrition itself in supabase */
                child: Text(
                  shortDescription,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
              ),
              const Spacer(), // Push the buttons to the bottom-left
              
              // Buttons at the left bottom
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildButton(part),
                  const SizedBox(width: 10),
                  _buildButton(type),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

Widget _buildButton(String label) {
  return ElevatedButton(
    onPressed: () {
      //
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.white, // Button background color (previously primary)
      foregroundColor: Colors.blueAccent, // Text color when disabled (replaces onPrimary)
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    child: Text(
      '$label',
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.blueAccent, // Text color
      ),
    ),
  );
}

}
