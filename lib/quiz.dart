import 'package:dictionary/models/definition.dart';
import 'package:dictionary/screens/questions_screen.dart';
import 'package:dictionary/screens/results_screen.dart';
import 'package:dictionary/screens/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final List<Definition> wrongChooseAnswers = [];
  var activeScreen = 'start-screen';
  var numberOfDefinitionsAsked = 0;

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(Definition answer) {
    wrongChooseAnswers.add(answer);
  }

  void getResult(int numberOfDefs) {
    setState(() {
      numberOfDefinitionsAsked = numberOfDefs;
      activeScreen = 'results-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
        onGetResult: getResult,
      );
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        wrongChosenAnswers: wrongChooseAnswers,
        numberOfDefinitionsAsked: 7,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
