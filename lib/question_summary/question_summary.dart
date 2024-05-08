import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quizapp/question_summary/summary_item.dart';

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
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data){
            return SummaryItem(data);
          }, ).toList()
        ),
      ),
    );
  }
}