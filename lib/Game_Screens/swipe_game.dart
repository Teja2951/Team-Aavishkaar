import 'package:aavishkaar/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:logger/logger.dart';

class Database {
  static List<Question> getQuestions() {
    return [
      Question(
        text: 'The sky is blue.',
        correctAnswer: true,
        imageUrl: null //'https://www.example.com/sky_image.jpg', // Optional image
      ),
      Question(
        text: 'Cats are bigger than elephants.',
        correctAnswer: false,
        imageUrl: null, // No image for this one
      ),
      Question(
        text: 'Earth is the third planet from the Sun.',
        correctAnswer: true,
        imageUrl: null, // No image for this one
      ),
      // Add more questions here
    ];
  }
}


class TrueFalseGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TFScreen();
  }
}

class TFScreen extends StatefulWidget {
  @override
  _TFScreenState createState() => _TFScreenState();
}

class _TFScreenState extends State<TFScreen> {
  final Logger _logger = Logger();
  List<SwipeItem> _swipeItems = [];
  late MatchEngine _matchEngine;
  int _score = 0;
  Color _backgroundColor = Colors.blue; // Default color
  bool _isAnswerCorrect = true; // Flag to indicate whether the answer is correct

  @override
  void initState() {
    super.initState();
    _initializeQuestions();
    _matchEngine = MatchEngine(swipeItems: _swipeItems);
  }

  Future<void> _initializeQuestions() async {
    List<Question> questions = Database.getQuestions();
    for (var question in questions) {
      _swipeItems.add(SwipeItem(
        content: question,
        likeAction: () async => await _onSwipe(true, question),
        nopeAction: () async => await _onSwipe(false, question),
        //onSlideUpdate: (region) => _logger.d("Region: $region"),
      ));
    }
  }

  Future<void> _onSwipe(bool userAnswer, Question question) async {
    setState(() {
      _isAnswerCorrect = userAnswer == question.correctAnswer;
      _backgroundColor = _isAnswerCorrect ? Colors.green : Colors.red; // Change background color
      if (_isAnswerCorrect) {
        _score++;
      }
      // After 2 seconds, reset the background color
      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          _backgroundColor = Colors.blue;
        });
      });
    });
  }

  Future<void> _showFinalScore() async {
    void finishGame() {
  Navigator.popUntil(context, (route) => route.isFirst); 
  }
  await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Game Over'),
      content: Text('Points gained today $_score'),
      actions: [
        TextButton(
          onPressed: () {
            finishGame();
          },
          child: Text('Home'),
        ),
      ],
    ),
  );
}



  void _resetGame() {
    setState(() {
      _score = 0;
      _swipeItems.clear();
      _initializeQuestions();
      _matchEngine = MatchEngine(swipeItems: _swipeItems);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('True or False Game'),
        centerTitle: true,
      ),
      body: Container(
        color: _backgroundColor, // Background color changes based on answer
        child: Column(
          children: [
            Expanded(
              child: SwipeCards(
                matchEngine: _matchEngine,
                itemBuilder: (BuildContext context, int index) {
                  final question = _swipeItems[index].content as Question;
                  return Card(
                    color: Colors.blue[200],
                    elevation: 8,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    child: Container(
                      padding: EdgeInsets.all(24),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (question.imageUrl != null)
                            Image.network(question.imageUrl!, height: 150), // Show image if available
                          SizedBox(height: 20),
                          Text(
                            question.text,
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                },
                onStackFinished: _showFinalScore,
                itemChanged: (SwipeItem item, int index) {
                  _logger.d("Item changed: ${item.content.text}, index: $index");
                },
                upSwipeAllowed: false,
                fillSpace: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Score: $_score',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Question {
  final String text;
  final bool correctAnswer;
  final String? imageUrl; // Optional image URL

  Question({
    required this.text,
    required this.correctAnswer,
    this.imageUrl, // Image URL is optional
  });
}
