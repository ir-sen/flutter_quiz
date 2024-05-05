import 'package:quizapp/questions_screens.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/start_screen.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/result_screen_widget.dart';

// just create class extends stateful widget which meand we can change inside class
class Quiz extends StatefulWidget {
  // this is constructor 
  const Quiz({super.key});

  // this is what we get out
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

// this is class use only inner this class
class _QuizState extends State<Quiz> {
  // list save state if user selected answer first add [0] secon [1] ...
  List<String> selectedAnswers = [];
  // variable which can changed
  var activeScreen = 'start-screen';


  /// This method is called when user selects an answer
  ///
  /// Adds answer to the list of selected answers
  /// and switches to result screen if all questions were answered
  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    /// If all questions were answered switch to result screen
    if (selectedAnswers.length == questions.length) {
      setState(() {
        /// Reset selected answers list
        // selectedAnswers = [];

        /// Switch to result screen
        activeScreen = 'result-screen';
      });
    }
  }
  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }



  // this method functon for switch displays 
  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }



  // build method we retrun 
  Widget build(context) {
    
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    }

    if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(restartFunc:  switchScreen,
        chosenAnswers: selectedAnswers,);
    }

    return MaterialApp(home:
    Scaffold(body:
      Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
          Colors.purple,
          Color.fromARGB(255, 97, 15, 111)], // this is how to add backgroudn color
            begin: Alignment.topLeft, // this is setting gradient colors side 
            end: Alignment.bottomRight
          ),
        ),
        // if else expressions in dart what display we show and return 
        child:  screenWidget,
      ),
    ),
    );
  }
}