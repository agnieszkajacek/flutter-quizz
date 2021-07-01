import 'package:flutter_quiz/question.dart';

class QuestionWithAnswers {
  int _questionNumber = 0;

  List<Question> _data = [
    Question(q: 'Marrakesh is the capital of Morocco', a: false, h: "It is Rabat"),
    Question(q: 'M&M stands for Mars and Moordale', a: false, h: "M&M stands for Mars and Murrie"),
    Question(q: 'Gin is typically included in a Long Island Iced Tea', a: true, h: "As is vodka, white rum, lemon juice, triple sec, sugar syrup and Coca-Cola"),
    Question(q: 'The Great Wall of China is longer than the distance between London and Beijing', a: true, h: "London to Beijing is only 8,136 km, The Great Wall of China is 21,196.18 km"),
    Question(q: 'There are 219 episodes of Friends', a: false, h: "It'\s 236"),
    Question(q: '`A` is the most common letter used in the English language', a: false, h: "'E' is the most common letter and appears in 11 percent of all english words, according to Oxford Dictionaries"),
    Question(q: 'In Harry Potter, Draco Malfoy has no siblings', a: false, h: "Skylar Malfoy is his younger sister"),
    Question(q: 'Monaco is the smallest country in the world', a: false, h: "Vatican City is, with only 0.44 sq.km"),
    Question(q: 'There are five different blood groups', a: false, h: "There are four: A, B, AB, and O"),
    Question(q: 'Cinderella was the first Disney princess', a: false, h: "Snow White and the Seven Dwarfs was released first in December 1937"),
    Question(q: 'H&M stands for Hennes & Mauritz', a: true),
    Question(q: 'Queen Elizabeth II is currently the second longest reigning British monarch', a: false, h: "Queen Elizabeth II became the longest-reigning British monarch on 9 September 2015 when she surpassed the reign of her great-great-grandmother Victoria")
  ];

  void nextQuestion(){
    if (_questionNumber < _data.length) {
      _questionNumber++;
    }
  }

  bool isFinished() {
    if (_questionNumber >= _data.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }

  String getQuestionContent() {
    return _data[_questionNumber].content;
  }

  bool getQuestionAnswer() {
    return _data[_questionNumber].answer;
  }

  String getQuestionHint() {
    return _data[_questionNumber].hint;
  }
}
