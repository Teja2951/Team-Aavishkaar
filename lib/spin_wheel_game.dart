import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'dart:math';


class SpinWheelGame extends StatelessWidget {
  const SpinWheelGame({super.key});

  @override
  Widget build(BuildContext context) {
    return SpinWheelScreen();
  }
}

class SpinWheelScreen extends StatefulWidget {
  const SpinWheelScreen({super.key});

  @override
  State<SpinWheelScreen> createState() => _SpinWheelScreenState();
}

class _SpinWheelScreenState extends State<SpinWheelScreen> {
  final items = [
    "Amendment 1",
    "Amendment 2",
    "Schedule 1",
    "Schedule 2",
    "Schedule 3",
  ]; // Topics for the wheel
  final random = Random();
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Spin the Wheel')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Spin the Wheel!",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 40),
          FortuneWheel(
            selected: Stream<int>.periodic(const Duration(seconds: 3),
                (_) => selectedIndex), // Spin the wheel based on selected index
            items: [
              for (var item in items) FortuneItem(child: Text(item)),
            ],
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              setState(() {
                selectedIndex = random.nextInt(items.length); // Randomly choose
              });

              Future.delayed(const Duration(seconds: 3), () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ScenarioScreen(
                      topic: items[selectedIndex],
                    ),
                  ),
                );
              });
            },
            child: const Text("Spin"),
          ),
        ],
      ),
    );
  }
}

class ScenarioScreen extends StatelessWidget {
  final String topic;

  const ScenarioScreen({super.key, required this.topic});

  @override
  Widget build(BuildContext context) {
    String question = _generateScenarioQuestion(topic);

    return Scaffold(
      appBar: AppBar(title: Text("Scenario: $topic")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              question,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Go Back"),
            ),
          ],
        ),
      ),
    );
  }

  String _generateScenarioQuestion(String topic) {
    // Custom questions based on topic
    Map<String, String> questions = {
      "Amendment 1":
          "Scenario: How does Amendment 1 affect the reservation system in India?",
      "Amendment 2":
          "Scenario: What was the key change introduced in Amendment 2?",
      "Schedule 1":
          "Scenario: Which states are mentioned in Schedule 1?",
      "Schedule 2":
          "Scenario: How does Schedule 2 define roles for public servants?",
      "Schedule 3": "Scenario: What is the purpose of the Schedule 3?",
    };

    return questions[topic] ?? "No question available for this topic.";
  }
}
