class QuizBrain {
  var _questionData;
  QuizBrain(this.questionData);
  List questionData;
  int _questionNumber = 0;
  List allQuestionData(questionData){
    questionData=questionData;
    print('qizbrain' +questionData.toString());
  }
  void nextQuestion() {
    if (_questionNumber < _questionData.length - 1) {
      _questionNumber++;
    }
  }
  getNextQuestion() {
    print('question number'+ _questionNumber.toString());
    if (_questionData.length>0) {
      return _questionData[_questionNumber];
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
