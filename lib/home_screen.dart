import 'package:flutter/material.dart';

//import 'package:quiz_app/styled_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen(this.startQuiz ,{super.key});

  final void Function() startQuiz ;

  @override
  Widget build(context) {
    return Center
    (child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
      Image.asset(
        'assets/quiz-logo.png',
         width: 300,
         color: const Color.fromARGB(100, 255, 255, 255),
         ),
      const SizedBox(width: 20,height: 60,),
      const Text('Learn flutter the fun way!',
      style: TextStyle(
        color: Colors.white,
        fontSize: 24,
      ),
      ),
      const SizedBox(width: 20,height: 40,),
      OutlinedButton.icon(
        onPressed: () {
          startQuiz();
        },
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
        ),
        icon: const Icon(Icons.arrow_right_alt),
        label: const Text('start quiz'),
      )
    ],)
    );
  }
}