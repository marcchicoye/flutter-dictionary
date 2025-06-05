import 'package:dictionary/welcome_screen.dart';
import 'package:dictionary/quiz_screen.dart';
import 'package:flutter/material.dart';

class DisplayScreen extends StatefulWidget {
  const DisplayScreen({super.key});

  @override
  State<DisplayScreen> createState() {
    return _DisplayScreen();
  }
}

class _DisplayScreen extends State<DisplayScreen> {
  String activeScreen = 'welcome_screen';

  Widget getActiveScreen() {
    switch (activeScreen) {
      case 'welcome_screen':
        return WelcomeScreen(gotoQuizScreen);
      case 'quiz_screen':
        return QuizScreen();
      default:
        return Text('error');
    }
  }

  void gotoQuizScreen() {
    setState(() {
      activeScreen = 'quiz_screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: getActiveScreen(),
      ),
    );
  }
}
