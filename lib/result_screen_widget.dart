
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/question_summary/question_summary.dart';

class ResultScreen extends StatelessWidget {
  
  const ResultScreen({super.key, required this.chosenAnswers, required this.restartFunc});

  final List<String> chosenAnswers;

  final void Function() restartFunc;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>>  summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
        'question_index': i,
        'question': questions[i].text, 
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
        }
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    // final summaryData = getSummaryData();
    final numberTotalQuestion = questions.length;
    final correctQuestion = summaryData.where(
      (data) =>  data['user_answer'] == data['correct_answer']
    ).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Center(child:
                      Text('You answerd $correctQuestion out of $numberTotalQuestion questions correctly!',
                        textAlign: TextAlign.center, 
                        style: const TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                        ),
                        ),
            ),
            const SizedBox(height: 30,),
            QuestionSummary(summaryData),
            const SizedBox(height: 30,),
            TextButton(onPressed:  restartFunc, child: const Text('Restart Quiz!'),
            )
          ],
        ),
      ),
    );
  }
} 