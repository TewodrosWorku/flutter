import 'package:equatable/equatable.dart';
import 'package:flash_chat/data/model/question_model.dart';
import 'package:flash_chat/data/question_repo.dart';
import 'package:flutter/cupertino.dart';


class QuestionState extends Equatable{
 //var int counter;
 //QuestionState(this.counter);
  @override
  // TODO: implement props
  List<Object> get props => [];


}
class QuestionIsLoading extends QuestionState {
 //QuestionIsLoading(int counter):super(counter);
@override
  // TODO: implement props
  List<Object> get props => null;
}

class QuestionIsLoaded extends QuestionState {
  final List<QuestionModel> questionList;
  QuestionIsLoaded( this.questionList);
  @override
  // TODO: implement props
  List<Object> get props => [questionList];
}

class NextQuestionState extends QuestionState {
  final QuestionModel question;
  NextQuestionState(  this.question);
  @override
  // TODO: implement props
  List<Object> get props => [question];

}

class CheckAnswer extends QuestionState {
  final  userAnswer;
  CheckAnswer( this.userAnswer);

  @override
  // TODO: implement props
  List<Object> get props => [userAnswer];

}

class ShowAnswerState extends QuestionState{
  final ShowAnswerQuestionModel question;
  ShowAnswerState( this.question);
  @override
  // TODO: implement props
  List<Object> get props => [question];
}

class Finished extends QuestionState {

  Finished() ;
}
class ShowResultState extends QuestionState{
   final correct;
   final wrong;
   ShowResultState({@required this.correct,@required this.wrong});
  @override
  // TODO: implement props
  List<Object> get props => [correct,wrong];
}
class QuestionIsNotLoaded extends QuestionState {
  //QuestionIsNotLoaded(int counter);
  @override
  // TODO: implement props
  List<Object> get props => null;
}




