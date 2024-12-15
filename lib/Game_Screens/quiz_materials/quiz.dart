import 'package:aavishkaar/Game_Screens/coins.dart';
import 'package:aavishkaar/landing_page.dart';
import 'package:aavishkaar/Game_Screens/games_screen.dart';
import 'package:aavishkaar/Game_Screens/quiz_materials/models/answer_button.dart';
import 'package:aavishkaar/Game_Screens/quiz_materials/models/questions.dart';
import 'package:aavishkaar/Game_Screens/quiz_materials/models/quiz_question.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Quiz extends StatefulWidget {
  final int numberOfQuestions; // Pass number of questions from Trivia Setup

  const Quiz({super.key, required this.numberOfQuestions});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var currentQuestionIndex = 0;
  bool? isAnswerCorrect;
  String explanationText = "";
  int correctAnswers = 0;
  int wrongAnswers = 0;

  final listOfQuestions = get(questions, 2); // Random questions
  late List<QuestionQuiz> selectedQuestions; // Store selected questions

  @override
  void initState() {
    super.initState();
    // Select the number of questions based on user input
    selectedQuestions = get(questions, widget.numberOfQuestions);
  }

  void checkAnswer(String answer) {
    setState(() {
      isAnswerCorrect = answer == selectedQuestions[currentQuestionIndex].correctAnswer;
      explanationText = selectedQuestions[currentQuestionIndex].explanation;

      // Track correct and incorrect answers
      if (isAnswerCorrect!) {
        correctAnswers++;
      } else {
        wrongAnswers++;
      }
    });
  }

  void answerQuestion(String selectedAnswer) {
    checkAnswer(selectedAnswer);
  }

  void nextQuestion() {
    setState(() {
      if (currentQuestionIndex < selectedQuestions.length - 1) {
        currentQuestionIndex++;
        isAnswerCorrect = null; // Reset answer state for next question
        explanationText = ""; // Clear explanation
      } else {
        // Navigate to End Screen with results
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EndScreen(
              correctAnswers: correctAnswers,
              wrongAnswers: wrongAnswers,
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = selectedQuestions[currentQuestionIndex];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 4, 62, 110),
      body: SizedBox(
        width: double.infinity,
        child: Container(
          margin: EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Display Question Text
              Text(
                currentQuestion.text,
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              // Display Answer Buttons
              ...currentQuestion.getShuffuledAnswers().map((answer) {
                return AnswerButton(
                  text: answer,
                  onTap: () => answerQuestion(answer),
                );
              }),
              // Display Correct/Incorrect status and Explanation
              if (isAnswerCorrect != null)
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    isAnswerCorrect! ? "Correct!" : "Incorrect",
                    style: TextStyle(
                      fontSize: 18,
                      color: isAnswerCorrect! ? Colors.green : Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  explanationText,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              // Next Question Button
              ElevatedButton(
                onPressed: nextQuestion,
                child: Text("Next Question"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EndScreen extends StatefulWidget {
  final int correctAnswers;
  final int wrongAnswers;

  const EndScreen({super.key, required this.correctAnswers, required this.wrongAnswers});

  @override
  State<EndScreen> createState() => _EndScreenState();
}

class _EndScreenState extends State<EndScreen> {

  ScoreManager s = ScoreManager();
  @override
  Widget build(BuildContext context) {
     void finishGame() {
      s.addScore(widget.correctAnswers);
  Navigator.popUntil(context, (route) => route.isFirst); // Pops back to the LandingPage
  }
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 4, 62, 110),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Quiz Finished!",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 20),
            Text(
              "Correct Answers: ${widget.correctAnswers}",
              style: TextStyle(fontSize: 20, color: Colors.green),
            ),
            Text(
              "Incorrect Answers: ${widget.wrongAnswers}",
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                finishGame();
              },
              child: const Text("Back to Home"),
            ),
          ],
        ),
      ),
    );
  }
}
