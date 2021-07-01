import 'package:flutter/material.dart';
import 'package:flutter_quiz/quiz_page.dart';

void main() {
  runApp(Quizzz());
}

class Quizzz extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: QuizPage(),
          ),
        ),
      )
    );
  }
}
