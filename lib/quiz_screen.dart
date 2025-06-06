import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() {
    return _QuizScreen();
  }
}

class _QuizScreen extends State<QuizScreen> {
  _QuizScreen() {
    readJson();
  }
  List<Map<String, String>> _dictionary = [];

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/data/vocabulary.json');

    final List<dynamic> data = json.decode(response);

    // Caster chaque élément en Map<String, String>
    setState(() {
      _dictionary = data
          .map<Map<String, String>>((item) => {
                'mot': item['mot'] as String,
                'definition': item['definition'] as String
              })
          .toList();
    });

    print(_dictionary[0]); // Pour vérification
  }

  @override
  Widget build(Object context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Text('Definition'),
              Text('mot 1'),
              Text('mot 2'),
              Text('mot 3'),
              Text('mot 4'),
            ],
          ),
        ),
      ),
    );
  }
}
