import 'package:dictionary/answer_button.dart';
import 'package:dictionary/models/definition.dart';
import 'package:flutter/material.dart';

import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.onSelectAnswer,
    required this.onGetResult,
  });

  final void Function(Definition answer) onSelectAnswer;
  final void Function(int numberOfDefinitionsAsked) onGetResult;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

var intValue = Random();

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  answerQuestion(String selectedAnswers) {
    if (_dictionary[currentQuestionIndex].answers[0] != selectedAnswers) {
      widget.onSelectAnswer(_dictionary[currentQuestionIndex]);
    }
    setState(() {
      if (currentQuestionIndex == _dictionary.length - 1) {
        widget.onGetResult(_dictionary.length);
      } else {
        currentQuestionIndex++;
      }
    });
  }

  List<Definition> _dictionary = [];

  @override
  void initState() {
    buildDictionary();

    super.initState();
  }

  void createMultipleChoiceAnswer() {
    String aNewWord = '';
    for (Definition def in _dictionary) {
      while (def.choices.length != 3) {
        aNewWord = findADistinctWord(def.choices);
        def.choices.add(aNewWord);
      }
    }
  }

  String findADistinctWord(List<String> wordDefinition) {
    bool isWordFound = false;
    String word = '';
    do {
      word = _dictionary[intValue.nextInt(_dictionary.length)].choices[0];
      if (!wordDefinition.contains(word)) {
        isWordFound = true;
      }
    } while (!isWordFound);
    return word;
  }

  Future<void> buildDictionary() async {
    final String response = await rootBundle.loadString(
      'assets/data/vocabulary.json',
    );

    final List<dynamic> data = json.decode(response);

    setState(() {
      _dictionary = data
          .map((item) => Definition(item['definition'], [item['mot']]))
          .toList();
    });

    createMultipleChoiceAnswer();
  }

  @override
  Widget build(BuildContext context) {
    // Show a loading spinner while dictionary is not ready
    if (_dictionary.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    Definition currentQuestion = _dictionary[currentQuestionIndex];
    // String currentQuestion.

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.definition,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 201, 153, 251),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                answerText: answer,
                onTap: () {
                  answerQuestion(answer);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
