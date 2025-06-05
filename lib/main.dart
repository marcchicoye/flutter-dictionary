import 'package:flutter/material.dart';
import 'package:dictionary/display_screen.dart';

void main() {
  runApp(const MyDictionary());
}

class MyDictionary extends StatelessWidget {
  const MyDictionary({super.key});

  @override
  Widget build(BuildContext context) {
    return DisplayScreen();
  }
}
