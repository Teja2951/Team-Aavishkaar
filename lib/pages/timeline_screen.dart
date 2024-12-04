import 'package:aavishkaar/pages/timeline_data.dart';
import 'package:aavishkaar/pages/timeline_widget.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:lottie/lottie.dart';

class TimelineScreen extends StatelessWidget {
  const TimelineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TypewriterAnimatedTextKit(
          text: const ['Indian Constitution Timeline'],
          textStyle: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
          speed: const Duration(milliseconds: 100),
          repeatForever: false,
          totalRepeatCount: 1,
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.orange.shade50,
                  Colors.white,
                  Colors.green.shade50,
                ],
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  height: 100,
                  child: Lottie.asset(
                    'assets/StoryLoad.json',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: constitutionEvents.length,
                  itemBuilder: (context, index) {
                    return TimelineEventWidget(
                      event: constitutionEvents[index],
                      isFirst: index == 0,
                      isLast: index == constitutionEvents.length - 1,
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}