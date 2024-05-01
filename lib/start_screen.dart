
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {

  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // whappting what we need add transparents and add opacity
          Opacity(
            opacity: 0.5,
            child: Image.asset('assets/images/quiz-logo.png',
            width: 300,),
          ),
          const SizedBox(height: 80,),
          const Text(
            'Learn Flutter the fun way!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 30,),

          OutlinedButton.icon(
            onPressed: () {
              // what we do if this click
              startQuiz();
            },
            style: OutlinedButton.styleFrom(

            foregroundColor: Colors.white
          ),
            icon: const Icon(Icons.arrow_right), 
            label: const Text('Start Quiz'))
        ],
      )
    );
    
    

  }
}