
import 'package:flutter/material.dart';

class QuestionIndentifier extends StatelessWidget {
  // get qrgument question index and correct answer
  const QuestionIndentifier({
    super.key,
    required this.questionIndex,
    required this.isCorrectAnswer,
  });

  final int questionIndex;
  final bool isCorrectAnswer;

  @override
  Widget build(BuildContext context) {
    final questionNumber = questionIndex + 1;
    return Container (
      width: 30,
      height: 30,
      alignment: Alignment.center,
      // this is show right or not right question  and change color
      decoration: BoxDecoration(
        color: isCorrectAnswer
        ? const Color.fromARGB(255, 140, 213, 227)
        : const Color.fromARGB(255, 222, 124, 217),
        borderRadius: BorderRadius.circular(100),
      ),
      
      child: Text(
        questionNumber.toString(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

}