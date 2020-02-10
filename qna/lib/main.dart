import 'package:flutter/material.dart';
import 'quiz_brain.dart';

QuizBrain quiz = new QuizBrain();
QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
//  List<String> questions = [
//    "You can lead a cow down stairs but not up stairs.",
//    "Approximately one quarter of human bones are in the feet.",
//    "A slug\'s blood is green."
//  ];
//  Question q1 = Question(
//      q: "You can lead a cow down stairs but not up stairs.", a: false);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    scoreKeeper.clear();
                  });
                },
                child: Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/6/69/Reload_Icon_Blue.svg/1200px-Reload_Icon_Blue.svg.png'),
              )),
        ),
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quiz.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                bool correctAnswer = quiz.getCorrectAnswer();
                if (correctAnswer == true) {
                  print("true answer");
                  scoreKeeper.add(Icon(
                    Icons.check,
                    color: Colors.lightGreenAccent,
                  ));
                } else {
                  print("user made wrong choose");
                  scoreKeeper.add(Icon(
                    Icons.close,
                    color: Colors.red,
                  ));
                }
                setState(() {
                  quiz.nextQuestion();
                });

                //The user picked true.
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                bool correctAnswer = quiz.questionBank.questionAnswer;
                if (correctAnswer == false) {
                  print("true answer");
                  scoreKeeper.add(Icon(
                    Icons.check,
                    color: Colors.lightGreenAccent,
                  ));
                } else {
                  print("user made wrong choose");
                  scoreKeeper.add(Icon(
                    Icons.close,
                    color: Colors.red,
                  ));
                }
                setState(() {
                  quiz.nextQuestion();
                });
                //The user picked false.
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
