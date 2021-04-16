import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText = 'You did it';
    if (resultScore <= 8) {
      resultText = 'You are awesome and good';
    } else if (resultScore <= 12) {
      resultText = 'Pretty good';
    } else if (resultScore <= 16) {
      resultText = 'Strange.....';
    } else {
      resultText = 'You are so bad!';
    }
    return resultText;
  } //a method that can nvr receive arguments

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
        child: Column(
      children: <Widget>[
        Text(
          resultPhrase,
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        TextButton(
          onPressed: resetHandler,
          child: Text('Restart quiz'),
          style: TextButton.styleFrom(
            primary: Colors.teal ,
            backgroundColor: Colors.black
            ),
            
        )
      ],
    ));
  }
}
