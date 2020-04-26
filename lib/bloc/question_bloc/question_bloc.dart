import 'dart:async';
import 'package:flash_chat/bloc/counter/counter_bloc.dart';
import 'package:flash_chat/bloc/counter/counter_state.dart';
import 'package:flash_chat/bloc/question_bloc/question_event.dart';
import 'package:flash_chat/bloc/question_bloc/question_state.dart';
import 'package:flash_chat/data/model/question_model.dart';
import 'package:flash_chat/data/question_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState>{
  int _counter;
  List<int> _answeredWrong=[];
  List<int> _answeredRight=[];
  final CounterBloc counterB;
  QuestionRepository questionRepo;
  StreamSubscription counterSubscription;
  QuestionBloc({@required this.questionRepo,@required this.counterB}) {
    counterSubscription = counterB.listen((state) {
      if (state is Increment){
        print('counter from cb at qb '+ state.counter.toString());
      _counter=state.counter;}
     else if (state is InitVal){
        print('counter from cb at qb '+ state.counter.toString());
        _counter=state.counter;}
     else{ _counter=counterB.counter;
     print('at subscrition else '+_counter.toString());};
    });

  }

 List<QuestionModel> q=[];

 void IncCounter(){
   _counter=_counter+1;
 }
  void Reset(){
    _counter=0;
    _answeredWrong=[];
   _answeredRight=[];

  }
  @override
  void onTransition(
      Transition<QuestionEvent, QuestionState> transition) {
    print(transition);
  }

  @override
  // TODO: implement initialState
  QuestionState get initialState => QuestionIsLoading();

  @override
  Stream<QuestionState> mapEventToState(QuestionEvent event) async*{
    // TODO: implement mapEventToState
    if(event is FetchQuestion){
      yield* _mapLoadQuestionState(event.exam);
    }
    else if(event is NextQuestionEvent) {
      //print('NextQuestionEvent event is called from mapEvState');
      yield* _mapNextQuestionState(_counter,q);

    }
    else if(event is CheckUserAnswerEvent) {
      yield* _mapCheckUserAnswerState(_counter,event.userAsnwer);

    }
    else if(event is ShowAnswerEvent) {
      yield* _mapShowAnswerState(_counter,event.question);

    }
    else if(event is ShowResultEvent) {
      yield* _mapResultState(_answeredRight,_answeredWrong);

    }
    else if(event is ResetEvent) {
      yield* _mapResetEvent();
    }

  }

 Stream<QuestionState> _mapLoadQuestionState(exam) async* {
   try{
     List<QuestionModel> question = await questionRepo.fetchQuestion(exam);
         if (question.length>0){
        q=question;
        print(q);
        _InsertTOdb(question);
       add(NextQuestionEvent());
     }

   }catch(_){
     print(_);
     yield QuestionIsNotLoaded();
   }
 }

  Stream<QuestionState> _mapNextQuestionState(counter,question) async* {
     print('old counter _mapNextq  state '+ counter.toString());
  //   print('_mpnextQ counter after IncCounter called '+counter.toString());
      if ( counter < question.length){
        QuestionModel question=q[counter];

       yield NextQuestionState(question);

      }
      else if (counter >= question.length){
        print('show result event called');
        int correct=_answeredRight.length;
        int wrong=_answeredWrong.length;
        yield ShowResultState(correct: correct,wrong: wrong);


      }
  }
  Stream<QuestionState> _mapCheckUserAnswerState(counter,userAnswer) async* {
    List<ModifiedAnswers> sanswerList=[];
    ShowAnswerQuestionModel squestion = ShowAnswerQuestionModel();
    QuestionModel question = q[counter];

    for (int i = 0; i < question.answers.length; i++) {
      print('i= '+i.toString()+ ' id: '+ question.answers[i].id.toString());
      ModifiedAnswers sanswer = ModifiedAnswers();
      sanswer.correct = question.answers[i].correct;
      sanswer.choice = question.answers[i].choice;
      sanswer.id = question.answers[i].id;
      if (question.answers[i].id == int.parse(userAnswer) &&
            question.answers[i].correct == "true") {
          _answeredRight.add(question.id);
          print('accessed 0');
          sanswer.userChoice = "true";
        }
      else if (question.answers[i].id == int.parse(userAnswer) &&
            question.answers[i].correct == "false") {
          _answeredWrong.add((question.id));
          sanswer.userChoice = "true";
          print('accessed 1');
        }
     else if (question.answers[i].id != int.parse(userAnswer)) {
        sanswer.userChoice = "false";
        print('accessed 2');
      }
      print('got here  for  '+ question.answers[i].id.toString());
      sanswerList.addAll({sanswer});
      print('sanswer');
      }
   sanswerList.forEach((f)=>print(f.choice.toString()+f.id.toString()+f.userChoice));
    squestion.id = question.id;
    squestion.content = question.content;
    squestion.solution = question.solution;
    squestion.answers = sanswerList;
    add(ShowAnswerEvent(squestion));
    //yield ShowAnswerState(squestion);

  }

  Stream<QuestionState> _mapShowAnswerState(counter,question) async* {
    print('current q at showanswerstate  '+question.content);
    print('at showsnwerestate '+_counter.toString());
    if ( counter < q.length) {
      IncCounter();
      print('after ShowAnswerState yield ' + _counter.toString());
    }
    yield ShowAnswerState(question);
  }

  Stream<QuestionState> _mapResetEvent() async*{
   Reset();
  print('reset is called ' +_counter.toString());
  
  }

}

Stream<QuestionState> _mapResultState(answeredRight,answeredWrong) async*{
  print(answeredWrong);
  print(answeredRight);
  int correct=answeredRight.length;
  int wrong=answeredWrong.lenght;

  yield ShowResultState(correct:correct,wrong: wrong);

}

void _InsertTOdb(List<QuestionModel> question) {
List<QModel>  qList;
QModel q;
AModel a;
List<AModel> aList;
question.forEach((f)=>{
  q=QModel(id: f.id,content: f.content,solution: f.solution),
 // a=AModel(id: f.answers.id),
  qList.add(q)
}
);


}