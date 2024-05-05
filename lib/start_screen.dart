
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {

  const StartScreen(this.startQuiz, {super.key});
  // this function get from another for triggered this
  // and do some work 
  final void Function() startQuiz;

  @override
  /// This function builds the start screen widget
  ///
  /// The column widget is used to create a vertical layout
  /// The mainAxisSize is set to min to make sure the smallest possible
  /// size is used
  /// The children of the column are:
  /// 1. An opacity widget with an image of the quiz logo
  /// 2. A sized box with a height of 80 to create some space
  /// 3. A text widget with the message 'Learn Flutter the fun way!'
  /// 4. A sized box with a height of 30 to create some space
  /// 5. An outlined button with an arrow right icon and the label 'Start Quiz'
  ///    The onPressed function is set to the startQuiz function that was passed
  ///    to the StartScreen widget
  ///
  /// The outlined button has a foreground color of white
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Add transparency to the logo
          Opacity(
            opacity: 0.5,
            child: Image.asset('assets/images/quiz-logo.png', width: 300,),
          ),
          // Create some space between the logo and the message
          const SizedBox(height: 80,),
          // Message to start the quiz
          Text(
            'Learn Flutter the fun way!',
            style: GoogleFonts.lato(),
          ),
          // Create some space between the message and the button
          const SizedBox(height: 30,),

          OutlinedButton.icon(
            onPressed: () {
              // What we do if this click
              // if we click this, we invoke function outside
              startQuiz();
            },
            style: OutlinedButton.styleFrom(
              // Set the foreground color to white
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_right), 
            label: const Text('Start Quiz'),
          ),
        ],
      ),
    );
  }
}