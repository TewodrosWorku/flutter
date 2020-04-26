/*

class QuestionModel {
  String exam;
  String subject;
  int id;
  String content;
  List<Map<String, dynamic>> answers;
  String solution;

  Question(String exam,String subject,int id,String content,List<Map<String, dynamic>> answers,String solution) {
    exam=exam;
    subject=subject;
    id=id;
    content=content;
    answers=answers;
    solution=solution;
  }
} */
import 'package:flash_chat/data/model/question_model.dart';

class QuizBrain {
  var _questionData;
   List<QuestionModel> questionData;
  QuizBrain(this.questionData);
  int _questionNumber = 0;

  void nextQuestion() {
     print('nextQuestion called from quizbrain');
    if (_questionNumber < questionData.length - 1) {
      _questionNumber++;
    }
  }
   getNextQuestion() {
    print('question number from getnextq '+ _questionNumber.toString());
    if (questionData.length>0) {
      return questionData[_questionNumber];
    }
    else return false;
  }

  bool getCorrectAnswer() {
    //return _questionData[_questionNumber].questionAnswer;
    return true;
  }
   checkUserAnswer(userChoice) {

   }
  bool isFinished() {
    if (_questionNumber >= _questionData.length - 1) {

      print('Now returning true');
      return true;

    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
