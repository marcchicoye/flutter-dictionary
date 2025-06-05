import 'package:dictionary/welcome_screen.dart';
import 'package:flutter/material.dart';

class DisplayScreen extends StatelessWidget {
  const DisplayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: WelcomeScreen(),
      ),
    );
  }
}
