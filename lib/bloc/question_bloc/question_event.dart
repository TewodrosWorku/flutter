import 'package:equatable/equatable.dart';
import 'package:flash_chat/data/model/question_model.dart';
import 'package:flutter/cupertino.dart';

class QuestionEvent extends Equatable{
  const QuestionEvent();

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class FetchQuestion extends QuestionEvent{
  final exam;

  FetchQuestion(this.exam);

  @override
  // TODO: implement props
  List<Object> get props => [exam];
}

class QuestionIsLoadedEvent extends QuestionEvent  {
  @override
  // TODO: implement props
  List<Object> get props => null;
}
class NextQuestionEvent extends QuestionEvent  {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class CheckUserAnswerEvent extends QuestionEvent {
   final userAsnwer;
   CheckUserAnswerEvent(this.userAsnwer);
  @override
  // TODO: implement props
  List<Object> get props => [userAsnwer];

}

class ShowAnswerEvent extends QuestionEvent {
  final ShowAnswerQuestionModel question;
  ShowAnswerEvent(@required this.question);
  @override
  // TODO: implement props
  List<Object> get props => [question];

}

class FinishedEvent extends QuestionEvent{
  @override
  // TODO: implement props
  List<Object> get props => null;

}
class ShowResultEvent extends QuestionEvent{
  @override
  // TODO: implement props
  List<Object> get props => null;

}

class ResetEvent extends QuestionEvent{
  @override
  // TODO: implement props
  List<Object> get props => null;

}



