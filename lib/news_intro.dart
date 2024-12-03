import 'package:flutter/material.dart';

class NewsIntro extends StatefulWidget {
  const NewsIntro({super.key});

  @override
  State<NewsIntro> createState() => _NewsIntroState();
}

class _NewsIntroState extends State<NewsIntro> {
  @override
  Widget build(BuildContext context) {

    
    double screenHeight = MediaQuery.of(context).size.height;
    double navBarHeight = kBottomNavigationBarHeight;  // The height of the bottom nav bar
    double availableHeight = screenHeight - navBarHeight;

    return Container(
      height: availableHeight,
      width: double.infinity,                                  
    );
  }
}