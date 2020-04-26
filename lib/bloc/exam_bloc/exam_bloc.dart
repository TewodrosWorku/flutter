
import 'dart:async';

import 'package:flash_chat/data/exam_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flash_chat/data/model/question_model.dart';
import 'package:flash_chat/data/question_repo.dart';
import 'exam_event.dart';
import 'exam_state.dart';


class ExamBloc extends Bloc<ExamEvent, ExamState> {

  final ExamRepository examRepo;
  ExamBloc(this.examRepo);

  @override
  void onTransition(
      Transition<ExamEvent, ExamState> transition) {
    print(transition);
  }
  @override
  // TODO: implement initialState
  ExamState get initialState => ExamIsLoading();

  @override
  Stream<ExamState> mapEventToState(ExamEvent event) async* {
    // TODO: implement mapEventToState
    if (event is FetchExam) {
      yield* _mapLoadExam();
    }
     }

Stream<ExamState> _mapLoadExam() async* {
  {
    try {
      List<dynamic> exams = await examRepo.fetchExam();

      if (exams.length > 0) {
        yield ExamIsLoaded(exams);
      }
    } catch (_) {
      print(_);
      yield ExamIsNotLoaded();
    }
  }
}

}