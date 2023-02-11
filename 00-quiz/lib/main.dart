import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

// Widget itself can be re-created/built. The main reason why you have two or more classes
// When the external data changed
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

// for persistence
class _MyAppState extends State<MyApp> {
  // var questions = ... // re-asign another value will be fine with var type
  // question = []; // it doesn't work if questions is a const
  final _questions = const [
    {
      "questionText": "What\'s your favorite color?",
      "answers": [
        {"text": "Black", "score": 10},
        {"text": "Blue", "score": 7},
        {"text": "Red", "score": 5},
        {"text": "Green", "score": 8},
      ],
    },
    {
      "questionText": "What\'s your favorite animal?",
      "answers": [
        {"text": "Dog", "score": 5},
        {"text": "Cat", "score": 2},
        {"text": "Bird", "score": 10},
      ],
    },
    {
      "questionText": "What\'s your favorite food?",
      "answers": [
        {"text": "Hamburger", "score": 9},
        {"text": "BBQ", "score": 7},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex += 1;
      // _questionIndex == 2 ? _questionIndex = 0 : _questionIndex = _questionIndex + 1;
    });

    if (_questionIndex < _questions.length) {
      print("You have more questions left.");
    } else {
      print("No more questions");
    }
  }

  void _reultQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // return
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First Flutter App"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                _questionIndex,
                _questions,
                _answerQuestion,
              )
            : Result(
                _totalScore,
                _reultQuiz,
              ),
      ),
    );
  }
}
