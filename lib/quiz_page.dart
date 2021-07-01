import 'package:flutter/material.dart';
import 'package:flutter_quiz/data/questions_with_answers.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuestionWithAnswers questionsWithAnswers = QuestionWithAnswers();

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool pickedAnswer) {
    bool correctAnswer = questionsWithAnswers.getQuestionAnswer();

    setState(() {
      if (questionsWithAnswers.isFinished() == true) {
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz. You can start all over again.',
        ).show();

        questionsWithAnswers.reset();
        scoreKeeper = [];
      } else {
        if (pickedAnswer == correctAnswer) {
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green[400],
          ));

          questionsWithAnswers.nextQuestion();
        } else {
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red[400],
          ));

          Alert(
            context: context,
            title: 'Curiosity:',
            desc: questionsWithAnswers.getQuestionHint(),
            buttons: [
              DialogButton(
                child: Text(
                  "Next question",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                onPressed: (){
                  Navigator.pop(context);

                  setState(() {
                    questionsWithAnswers.nextQuestion();
                  });
                },
                color: Color.fromRGBO(0, 179, 134, 1.0),
                width: 120,
              )
            ],
          ).show();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(questionsWithAnswers.getQuestionContent(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, color: Colors.white)),
            ),
          ),
        ),
        Expanded(
          child: Padding(
              padding: EdgeInsets.all(15),
              child: TextButton(
                onPressed: () {
                  checkAnswer(true);
                },
                style: flatButtonStyle(Colors.green[400]),
                child: Text('True',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              )),
        ),
        Expanded(
          child: Padding(
              padding: EdgeInsets.all(15),
              child: TextButton(
                style: flatButtonStyle(Colors.red[400]),
                onPressed: () {
                  checkAnswer(false);
                },
                child: Text('False',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              )),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }

  ButtonStyle flatButtonStyle(color) {
    return TextButton.styleFrom(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(2))),
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        minimumSize: Size(88, 44),
        backgroundColor: color);
  }
}
