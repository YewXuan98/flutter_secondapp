import 'package:flutter/material.dart'; //buildin widgets
import 'package:flutter_secondapp/result.dart';

import './question.dart';
import 'answer.dart';
import 'quiz.dart';
import 'result.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp()); //single line expression

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favourite colour?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ]
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 10},
        {'text': 'Snake', 'score': 5},
        {'text': 'Elephant', 'score': 3},
        {'text': 'Lion', 'score': 1},
      ]
    },
    {
      'questionText': 'Who\'s your favourite instructor?',
      'answers': [
        {'text': 'Max', 'score': 10},
        {'text': 'John', 'score': 5},
        {'text': 'Max', 'score': 3},
        {'text': 'Doe', 'score': 1},
      ]
    }
  ];
  var _question_index = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _question_index = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    //var aBool = true;

    _totalScore += score;

    setState(() {
      _question_index = _question_index + 1;
    });

    print(_question_index);
    if (_question_index < _questions.length) {
      print("We have more questions!");
    } else {
      print("No more questions");
    }
  }

  @override //decorator
  Widget build(BuildContext context) {
    // var dummy = ['Hello'];
    // dummy.add('Max');
    // print(dummy);
    //questions = []; //does not work if questions is a const

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first app'),
        ),
        body: _question_index < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _question_index,
                questions: _questions,
              )
            : Result(_totalScore , _resetQuiz),
      ),
    ); //home is the core widget which Flutter will bring onto the screen
  }
}
