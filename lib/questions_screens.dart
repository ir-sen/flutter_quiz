import 'package:quizapp/answer_button.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';



// This is the QuestionsScreen class which extends StatefulWidget
class QuestionsScreen extends StatefulWidget {
  // This is the constructor for the QuestionsScreen class
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  // This method creates the state for the QuestionsScreen class
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

// This is the state class for the QuestionsScreen class
class _QuestionsScreenState extends State<QuestionsScreen> {

  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAsnwer) {
    // currentQuestionIndex = currentQuestionIndex + 1;
    // currentQuestionIndex += 1; 
    widget.onSelectAnswer(selectedAsnwer);
    setState(() {
      currentQuestionIndex++;
    });
    // currentQuestionIndex++;
  }

  // This method builds the widget tree for the QuestionsScreen class
  @override
  /// This method builds the widget tree for the QuestionsScreen class
  ///
  /// The [context] is the BuildContext of the QuestionsScreen
  ///
  /// The method builds a Column widget with the following children:
  /// 1. A Text widget with the question text
  /// 2. A sized box with a height of 30 to create some space
  /// 3. A Column widget with the shuffled answers
  ///    The answers are mapped to AnswerButton widgets
  ///    The onTap function is set to the answerQuestion function
  ///
  /// The Column widget is centered both horizontally and vertically
  /// The Text and AnswerButton widgets are stretched to fill the available space
  /// The answers are shuffled using the shuffledAnswers getter
  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      // take all size with of screen
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30), // add comments
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // create a text widget with the question text
            Text(
              currentQuestion.text,
              style: GoogleFonts.nanumGothic(
                color: Color.fromARGB(132, 255, 255, 255),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            // add a sized box with a height of 30 to create some space
            const SizedBox(height: 30),
            // create a column widget with the shuffled answers
            Column(
              children: currentQuestion.shuffledAnswers
                  .map<Widget>((answer) {
                // return an AnswerButton widget
                return AnswerButton(
                  answerText: answer,
                  onTap: () {
                    // call the answerQuestion function with the answer
                    answerQuestion(answer);
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

}