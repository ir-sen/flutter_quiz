import 'package:quizapp/answer_button.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';



// This is the QuestionsScreen class which extends StatefulWidget
class QuestionsScreen extends StatefulWidget {
  // This is the constructor for the QuestionsScreen class
  const QuestionsScreen({super.key});

  // This method creates the state for the QuestionsScreen class
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

// This is the state class for the QuestionsScreen class
class _QuestionsScreenState extends State<QuestionsScreen> {

  var currentQuestionIndex = 0;

  void answerQuestion() {
    // currentQuestionIndex = currentQuestionIndex + 1;
    // currentQuestionIndex += 1; 
    setState(() {
      currentQuestionIndex++;
    });
    currentQuestionIndex++;
  }

  // This method builds the widget tree for the QuestionsScreen class
  @override
  Widget build(context) {  

    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      // take all size with of screen
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          Text(currentQuestion.text,
          style: GoogleFonts.nanumGothic(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold
          ),
          ), 
          const SizedBox(height: 30),
          // create button elevation 
          ...currentQuestion.getShuffledAnswers().map((answers) {
            return AnswerButton(answerText: answers, onTap: answerQuestion);
          }),
        
          // AnswerButton(answerText: currentQuestion.answers[0], onTap: () { }),
          // AnswerButton(answerText: currentQuestion.answers[1], onTap: () { }),
          // AnswerButton(answerText: currentQuestion.answers[2], onTap: () { }),
          // AnswerButton(answerText: currentQuestion.answers[3], onTap: () { }),
        ]),
      ),
    );


  }
}