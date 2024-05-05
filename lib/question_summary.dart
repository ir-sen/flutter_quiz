import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuestionSummary extends StatelessWidget {

  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  /// Builds a widget that displays a column of rows, each containing information about a question.
  ///
  /// The [context] parameter is the build context of the widget.
  ///
  /// Returns a [Widget] that displays a column of rows, each containing information about a question.
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(children: summaryData.map((data) {
            return Row(children: [
              Text(((data['question_index'] as int) + 1).toString()),
              // expanded full of size
              Expanded(
                child: Column(
                  children: [
                    Text(data['question'] as String),
                    const SizedBox(height: 5,),
                    Text(data['user_answer'] as String),
                    Text(data['correct_answer'] as String),
                  ],
                ),
              ),
            ]);
            },
          ).toList(),),
      ),
    );
  }
}