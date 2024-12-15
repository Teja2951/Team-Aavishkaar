import 'dart:async';

import 'package:aavishkaar/Game_Screens/Emoji_game_screen.dart';
import 'package:aavishkaar/Game_Screens/coins.dart';
import 'package:aavishkaar/Timeline/timeline_intro_screen.dart';
import 'package:aavishkaar/Timeline1/timeline_screen.dart';
import 'package:aavishkaar/Game_Screens/rights_and_duties.dart';
import 'package:aavishkaar/Game_Screens/quiz_materials/setup.dart';
import 'package:aavishkaar/Game_Screens/spin_wheel_game.dart';
import 'package:aavishkaar/Game_Screens/swipe_game.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GamesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomeScreen();
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late int earned;

  ScoreManager s = ScoreManager();
  StreamSubscription<int>? _subscription;

  void initState() {
    super.initState();
    _subscription = s.scoreStream.listen((score) {
      setState(() {
        earned = score;
      });
    });
  }

  // void dispose() {
  //   _subscription.cancel();
  //   super.dispose();
  // }
  
  final List<Map<String, dynamic>> games = [
    {'name': 'Constitutional Quiz', 'icon': Icons.quiz, 'screen': TriviaSetupScreen()},
    {'name': 'Emoji Game', 'icon': Icons.emoji_emotions, 'screen': EmojisGameScreen()}, 
    {'name': 'True/False', 'icon': Icons.swipe, 'screen': TrueFalseGame()},
    {'name': 'Rights / Duties', 'icon': Icons.extension, 'screen': RightsOrDutiesGame()},
    //{'name': 'Timeline (** for temp)', 'icon': Icons.wordpress_sharp, 'screen': TimelineScreen()},
  ];

  @override
  Widget build(BuildContext context) {
    final earned = s.scoreStream;
    return SingleChildScrollView(
        child: Column(
          children: [
            // Silver Image at the Top
            Stack(
              children: [
                Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.purpleAccent, Colors.blueAccent],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                )
              ),

              Positioned(
                left: 20,
                top: 60,
                child: Text(
                  'Games',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 48,
                    fontFamily: 'Poppins'
                    ),
                  )
              ),

              Positioned(
                left: 20,
                top: 120,
                child: Text(
                  'Simple yet innovative games',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontFamily: 'Poppins'
                    ),
                  )
              ),

              Positioned(
                left: 260,
                top: 10,
                child: StreamBuilder<int>(
  stream: s.scoreStream,
  builder: (context, snapshot) {
    if (snapshot.hasData) {
      return Text(
        'Coins : ${snapshot.data}',
        style: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontFamily: 'Poppins'
        ),
      );
    } else {
      return Text(
        'Coins : 0',
        style: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontFamily: 'Poppins'
        ),
      );
    }
  },
)
              ),


              ]
            ),
            SizedBox(height: 20),
            // Games List
            Column(
              children: games.map((game) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => game['screen']),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.purpleAccent, Colors.blueAccent],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(4, 4),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        // Game Icon
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          child: Icon(game['icon'], size: 30, color: Colors.blue),
                        ),
                        SizedBox(width: 16),
                        // Game Name
                        Text(
                          game['name'],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'GoogleSans',
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      );
  }
}