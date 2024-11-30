import 'package:aavishkaar/Emoji_game_screen.dart';
import 'package:aavishkaar/pages/wordle_game.dart';
import 'package:aavishkaar/rights_and_duties.dart';
import 'package:aavishkaar/quiz_materials/setup.dart';
import 'package:aavishkaar/spin_wheel_game.dart';
import 'package:aavishkaar/swipe_game.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GamesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomeScreen();
  }
}

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> games = [
    {'name': 'Constitutional Quiz', 'icon': Icons.quiz, 'screen': TriviaSetupScreen()},
    {'name': 'Emoji Game', 'icon': Icons.emoji_emotions, 'screen': EmojiGameScreen()}, 
    {'name': 'True/False', 'icon': Icons.swipe, 'screen': TrueFalseGame()},
    {'name': 'Rights / Duties', 'icon': Icons.extension, 'screen': RightsOrDutiesGame()},
    {'name': 'Wordle', 'icon': Icons.wordpress_sharp, 'screen': WordleGame()},

    // Add more games as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 400,
        width: 350,
        child: GridView.builder(
          itemCount: games.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            final game = games[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => game['screen']),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      '${game['name']} screen coming soon!',
                      style: GoogleFonts.lato(color: Colors.black, fontSize: 24),
                    ),
                  ),
                );
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(game['icon'], size: 40, color: Colors.blue),
                    SizedBox(height: 10),
                    Text(
                      game['name'],
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
