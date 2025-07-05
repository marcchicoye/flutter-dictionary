import 'package:dictionary/answer_button.dart';
import 'package:dictionary/models/definition.dart';
import 'package:flutter/material.dart';

import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

var intValue = Random();

class _QuestionsScreenState extends State<QuestionsScreen> {
  // late List<String> wordDefinitionAlreadyAsked;

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

    Definition currentQuestion = _dictionary[0];
    // String currentQuestion.

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            currentQuestion.definition,
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 30),
          ...currentQuestion.answers.map((answer) {
            return AnswerButton(answerText: answer, onTap: () {});
          }),
        ],
      ),
    );
  }
}
