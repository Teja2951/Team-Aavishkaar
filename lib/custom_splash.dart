import 'package:animate_gradient/animate_gradient.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomSplash extends StatefulWidget {
  final Widget nextScreen;
  final Duration duration;

  const CustomSplash({
    super.key,
    this.duration = const Duration(seconds: 3),
    required this.nextScreen,
  });

  @override
  State<CustomSplash> createState() => _CustomSplashState();
}

class _CustomSplashState extends State<CustomSplash> {

  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() async{
    await Future.delayed(widget.duration);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => widget.nextScreen,
      )
    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimateGradient(
        primaryColors: const [
          Colors.pink,
          Colors.pinkAccent,
          Colors.white,
        ],
        secondaryColors: const [
          Colors.blue,
          Colors.blueAccent,
          Colors.white,
        ],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/storySplash.json'),
            SizedBox(height: 10,),
            Text('Cooking Stories...',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
            SizedBox(height: 10),
            Container(
  margin: const EdgeInsets.symmetric(horizontal: 20),
  height: 8,
  child: ClipRRect(
    borderRadius: BorderRadius.circular(10),
    child: LinearProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Colors.pinkAccent),
      backgroundColor: Colors.pink[100],
    ),
  ),
),

          ],
        )
      ),
    );
  }
}