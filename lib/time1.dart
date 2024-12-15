import 'package:flutter/material.dart';

class Time1 extends StatelessWidget {
  const Time1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        'assets/1.jpg',
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.fill,
        ),
    );
  }
}