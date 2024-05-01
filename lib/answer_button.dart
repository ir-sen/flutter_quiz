import 'package:flutter/material.dart';


class AnswerButton extends StatelessWidget {
  // this for expecting name arguments
  AnswerButton( {super.key,
    required this.answerText,
    required this.onTap,
    });

  final String answerText;
  final void Function() onTap;
  
@override
Widget build(BuildContext context) {
  // Return an ElevatedButton widget
  return ElevatedButton(
    // Define the onPressed callback function
    onPressed: onTap,
    // Define the style of the ElevatedButton
    style: ElevatedButton.styleFrom(
      // Set the padding of the button
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40), 
      // Set the background color of the button
      backgroundColor: const Color.fromARGB(255, 33, 1, 95),
      // Set the foreground color of the button (text color)
      foregroundColor: Colors.white,
      // Set the shape of the button (rounded rectangle)
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40)
      ),
    ),
    // Set the child of the ElevatedButton to a Text widget with the value of answerText
    child: Text(answerText, textAlign: TextAlign.center,),
  );
}
}