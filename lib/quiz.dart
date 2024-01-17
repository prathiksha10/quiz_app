import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/home_screen.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';

class Quiz extends StatefulWidget {
const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
    List<String> selectedAnswers = [];
    Widget? activeScreen  ;


    void chooseAnswer(String answer) {
      selectedAnswers.add(answer);

      if (selectedAnswers.length == questions.length) {
        setState(() {
         // selectedAnswers = [];
          activeScreen = ResultsScreen(
            chosenAnswers : selectedAnswers,
            onRestart: restartQuiz,
            );
        });
      }
    }

    void restartQuiz() {
      setState(() {
        selectedAnswers = [];
        activeScreen = QuestionsScreen(onSelectAnswer: chooseAnswer,);
    });
    }

    @override
  void initState() {
    super.initState();
    activeScreen = HomeScreen(switchScreen);
    
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionsScreen(onSelectAnswer: chooseAnswer,);
    });
  }

//not sure if this function needs to be added
  void switchAnotherScreen() {
    setState(() {
      activeScreen = ResultsScreen(
       chosenAnswers: selectedAnswers,
       onRestart: restartQuiz,
      );
    });
  } 


  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body:  Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 46, 10, 109),
                Color.fromARGB(255, 105, 66, 173),
              ]
              )
          ),
          child:  activeScreen,
          ), 
      ),
    );
  }
}