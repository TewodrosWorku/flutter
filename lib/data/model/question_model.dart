import 'package:equatable/equatable.dart';

class QuestionModel {
  int id;
  String content;
  List<Answers> answers;
  String solution;

  QuestionModel({this.id, this.content,this.answers,this.solution});

  static List<QuestionModel> fromJson(json) {

    List<QuestionModel> response = new List<QuestionModel>();
    json.forEach((q) {
      response.add(
           QuestionModel(
            id: q['id'],
            content: q['content'],
            answers: parseChoices(q),
            solution: q['solution'],
          )
      );
    });

    return response;
  }

  static List<Answers> parseChoices(choiceJson) {
    var list = choiceJson['answers'] as List;
    List<Answers> choiceList =
    list.map((data) => Answers.fromJson(data)).toList();
    return choiceList;
  }

}

class ExamModel extends Equatable {
  List<String> title;
  ExamModel(this.title);
  @override
  List<Object> get props => [title];

}
class Answers {
  final int id;
  final String choice;
  final String quesion;
  final String correct;

  Answers({this.id, this.choice,this.quesion,this.correct});

  static Answers fromJson(Map<String, dynamic> parsedJson) {
    return Answers(id: parsedJson['id'], choice: parsedJson['choice'],quesion: parsedJson['question'].toString(),
    correct: parsedJson['correct']);
  }
}


class ShowAnswerQuestionModel {
  int id;
  String content;
  List<ModifiedAnswers> answers;
  String solution;

  ShowAnswerQuestionModel({this.id, this.content,this.answers,this.solution});

}

class ModifiedAnswers {
   int id;
   String choice;
   String correct;
   String userChoice;
  ModifiedAnswers({this.id, this.choice,this.correct,this.userChoice});


  }

class QModel {
  final int id;
  final String content;
  final String solution;

  QModel({this.id, this.content, this.solution});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'content': content,
      'solution': solution,
    };
  }}

class AModel {
  final int id;
  final String choice;
  final int correct;
  final int question;

  AModel(this.id, this.choice, this.correct, this.question);


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'choice': choice,
      'correct': correct,
      'question':question
    };
  }}
