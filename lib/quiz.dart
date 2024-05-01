import 'package:quizapp/questions_screens.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/start_screen.dart';

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
  // variable which can changed
  var activeScreen = 'start-screen';
  
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
    // this dinamicly turn expressing 
    // final screenWidget = activeScreen == 'start-screen'
    //            ? StartScreen(switchScreen) :
    //            const QuestionsScreen();

    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen();
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