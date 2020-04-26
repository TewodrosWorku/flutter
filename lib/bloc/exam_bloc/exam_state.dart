import 'package:equatable/equatable.dart';
import 'package:flash_chat/data/model/question_model.dart';
class ExamState extends Equatable{
  const ExamState();
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class ExamIsLoading extends ExamState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class ExamIsLoaded extends ExamState{
  final ListOfExams;

  ExamIsLoaded(this.ListOfExams);

  @override
  // TODO: implement props
  List<Object> get props => [ListOfExams];



}

class ExamIsNotLoaded extends ExamState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}
