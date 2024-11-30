import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmojiGameScreen extends StatefulWidget {
  @override
  _EmojiGameScreenState createState() => _EmojiGameScreenState();
}

class _EmojiGameScreenState extends State<EmojiGameScreen> {
  int score = 0;
  int currentIndex = 0;

  // Sample list of emoji pairs and corresponding answers
  List<Map<String, dynamic>> emojiPairs = [
    {'emojis': '🍕 + 🍔', 'answer': 'Fast Food'},
    {'emojis': '🍎 + 🍌', 'answer': 'Fruits'},
    {'emojis': '🐱 + 🐶', 'answer': 'Pets'},
    {'emojis': '⚽ + 🏀', 'answer': 'Sports'},
    // Add more emoji pairs here
  ];

  final TextEditingController _controller = TextEditingController();
  String feedback = "";
  String correctAnswer = "";
  bool showAnswer = false;

  // Shuffle emoji pairs to get random questions
  void _getRandomQuestions() {
    setState(() {
      emojiPairs.shuffle(Random());
    });
  }

  // Function to check the answer
  void _checkAnswer(String userGuess) {
    if (userGuess.toLowerCase().trim() ==
        emojiPairs[currentIndex]['answer'].toLowerCase()) {
      setState(() {
        feedback = "Correct!";
        score++;
        showAnswer = true; // Show answer and move to the next question
      });
    } else {
      setState(() {
        feedback = "Incorrect. Try again!";
      });
    }
  }

  // Show the correct answer when the user is stuck
  void _showCorrectAnswer() {
    setState(() {
      showAnswer = true;
      feedback = emojiPairs[currentIndex]['answer'];
    });
  }

  // Function to move to the next question
  void _nextQuestion() {
    setState(() {
      currentIndex = (currentIndex + 1) % emojiPairs.length;
      _controller.clear(); // Clear the text field after moving to the next question
      feedback = "";
      showAnswer = false; // Reset the answer visibility
    });
  }

  // End game and navigate back to previous screen
  void _endGame() {
    Navigator.pop(context);  // This will pop the current game screen and return to the previous screen
  }

  @override
  void initState() {
    super.initState();
    _getRandomQuestions(); // Start shuffling questions
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emoji Guessing Game'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Display score
            Text(
              'Score: $score',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // Display emoji pair
            Text(
              emojiPairs[currentIndex]['emojis'],
              style: TextStyle(fontSize: 50),
            ),
            SizedBox(height: 20),
            // Input field for user guess
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Guess the word/phrase',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              ),
            ),
            SizedBox(height: 10),
            // Feedback message
            Text(
              feedback,
              style: TextStyle(
                  fontSize: 20,
                  color: feedback == "Correct!" ? Colors.green : Colors.red),
            ),
            SizedBox(height: 10),
            // Buttons for submitting answer and showing the correct answer
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => _checkAnswer(_controller.text),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    backgroundColor: Colors.blue,
                  ),
                  child: Text('Submit Answer'),
                ),
                ElevatedButton(
                  onPressed: _showCorrectAnswer,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    backgroundColor: Colors.red,
                  ),
                  child: Text('Show Answer'),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Next Question button
            if (showAnswer) 
              ElevatedButton(
                onPressed: _nextQuestion,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  backgroundColor: Colors.green,
                ),
                child: Text('Next Question'),
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _endGame,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                backgroundColor: Colors.grey,
              ),
              child: Text('End Game'),
            ),
          ],
        ),
      ),
    );
  }
}
