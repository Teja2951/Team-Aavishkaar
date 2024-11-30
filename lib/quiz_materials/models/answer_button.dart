import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {

  const AnswerButton({
    super.key,
    required this.text,
    required this.onTap,
    });

  final String text;
  final void Function() onTap;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
       child: Text(text),
       style: ElevatedButton.styleFrom(),              
      );
  }
}