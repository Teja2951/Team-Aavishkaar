import 'package:flutter/material.dart';

class RightsOrDutiesGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RightsOrDutiesPage();
  }
}

class RightsOrDutiesPage extends StatefulWidget {
  @override
  _RightsOrDutiesPageState createState() => _RightsOrDutiesPageState();
}

class _RightsOrDutiesPageState extends State<RightsOrDutiesPage> {
  int score = 0; // Player's score
  int currentIndex = 0; // Current question index

  // Questions and answers
  final List<Question> questions = [
    Question(
      image: 'https://via.placeholder.com/300x200.png?text=Image+1',
      text: 'Participating in elections is a?',
      correctAnswer: 'Duty',
      explanation: 'Participating in elections is a fundamental duty to strengthen democracy.',
    ),
    Question(
      image: 'https://via.placeholder.com/300x200.png?text=Image+2',
      text: 'Right to freedom of speech?',
      correctAnswer: 'Right',
      explanation: 'The right to freedom of speech is a fundamental right under Article 19.',
    ),
  ];

  void _checkAnswer(String answer) {
    final question = questions[currentIndex];

    if (answer == question.correctAnswer) {
      setState(() {
        score += 10; // Add score for correct answer
      });
    }

    // Show explanation dialog
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(answer == question.correctAnswer ? "Correct!" : "Wrong!"),
        content: Text(question.explanation),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close explanation dialog
              _nextQuestion();
            },
            child: Text("Next"),
          ),
        ],
      ),
    );
  }

  void _nextQuestion() {
    setState(() {
      if (currentIndex < questions.length - 1) {
        currentIndex++;
      } else {
        _showGameOver();
      }
    });
  }

  void _showGameOver() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Game Over"),
        content: Text("Your final score is $score"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close game over dialog
              Navigator.pop(context); // Go back to previous screen
            },
            child: Text("Play Again"),
          ),
        ],
      ),
    );
  }

  void _restartGame() {
    setState(() {
      score = 0;
      currentIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text("Rights or Duties"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Score display
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Score: $score",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),

          // Image display
          Expanded(
            child: Image.network(
              question.image,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),

          // Question text
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              question.text,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),

          // Answer buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => _checkAnswer('Right'),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(20),
                ),
                child: Text("Right"),
              ),
              ElevatedButton(
                onPressed: () => _checkAnswer('Duty'),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(20),
                ),
                child: Text("Duty"),
              ),
            ],
          ),

          SizedBox(height: 16),
        ],
      ),
    );
  }
}

// Question model
class Question {
  final String image; // URL of the image
  final String text; // Question text
  final String correctAnswer; // Correct answer ("Right" or "Duty")
  final String explanation; // Explanation text

  Question({
    required this.image,
    required this.text,
    required this.correctAnswer,
    required this.explanation,
  });
}
