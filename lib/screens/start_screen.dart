import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          const SizedBox(height: 80),
          Text(
            'Learn Flutter the fun way!',
            style: GoogleFonts.lato(
              fontSize: 27,
              color: Color.fromARGB(255, 237, 223, 252),
            ),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            icon: const Icon(Icons.arrow_right_alt),
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            label: const Text('Start Quiz'),
          ),
        ],
      ),
    );
  }
}
