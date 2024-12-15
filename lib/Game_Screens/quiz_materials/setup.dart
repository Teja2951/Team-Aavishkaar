import 'package:aavishkaar/Game_Screens/games_screen.dart';
import 'package:flutter/material.dart';
import 'package:aavishkaar/Game_Screens/quiz_materials/quiz.dart';

class TriviaSetupScreen extends StatefulWidget {
  const TriviaSetupScreen({super.key});

  @override
  State<TriviaSetupScreen> createState() => _TriviaSetupScreenState();
}

class _TriviaSetupScreenState extends State<TriviaSetupScreen> {
  int selectedQuestions = 10; // Default number of questions

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Trivia Game Setup'),
          backgroundColor: const Color.fromARGB(255, 4, 62, 110),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Select the number of questions for the quiz:",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              const SizedBox(height: 20),
              Slider(
                min: 5,
                max: 20,
                divisions: 3,
                value: selectedQuestions.toDouble(),
                onChanged: (double value) {
                  setState(() {
                    selectedQuestions = value.toInt();
                  });
                },
              ),
              Text(
                '$selectedQuestions Questions',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  // Navigate to quiz screen with the selected number of questions
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Quiz(
                        numberOfQuestions: selectedQuestions,
                      ),
                    ),
                  );
                },
                child: const Text("Start Quiz"),
              ),
            ],
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 4, 62, 110),
      ),
    );
  }
}
