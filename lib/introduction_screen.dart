import 'package:aavishkaar/Auth/auth_page.dart';
import 'package:flutter/material.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        Container(
          color: Colors.blue,
        ),
        Container(
          color: Colors.pink,
        ),
        Container(
          color: Colors.cyan,
        ),
      ],
    );
  }
}