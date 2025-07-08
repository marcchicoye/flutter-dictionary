import 'package:dictionary/models/definition.dart';
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
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Vous avez répondu X sur y définition"),
            SizedBox(height: 30),
            Text("List of answers and Question"),
            SizedBox(height: 30),
            TextButton(onPressed: () {}, child: Text('Recommencez')),
          ],
        ),
      ),
    );
  }
}
