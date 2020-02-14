import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;
  List<Question> questionBank = [
    Question(q: "You can lead a cow down stairs but not up stairs.", a: false),
    Question(
      q: "Approximately one quarter of human bones are in the feet.",
      a: true,
    ),
    Question(q: "A slug\'s blood is green.", a: true)
  ];
  void nextQuestion() {
    if (_questionNumber < questionBank.length) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return questionBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return questionBank[_questionNumber].questionAnswer;
  }

  List<bool> answers = [false, true, true];
}
