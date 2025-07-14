import 'package:dictionary/models/definition.dart';
import 'package:dictionary/questions_summary.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.wrongChosenAnswers,
    required this.numberOfDefinitionsAsked,
  });

  final List<Definition> wrongChosenAnswers;
  final int numberOfDefinitionsAsked;

  @override
  Widget build(BuildContext context) {
    int numberOfCorrectAnswers =
        numberOfDefinitionsAsked - wrongChosenAnswers.length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Vous avez répondu ${numberOfCorrectAnswers.toString()} sur ${numberOfDefinitionsAsked.toString()} définition',
              style: TextStyle(
                color: const Color.fromARGB(255, 198, 110, 241),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            QuestionsSummary(wrongChosenAnswers),
            SizedBox(height: 30),
            TextButton(onPressed: () {}, child: Text('Recommencez')),
          ],
        ),
      ),
    );
  }
}
