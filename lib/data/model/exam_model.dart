import 'package:equatable/equatable.dart';

class ExamModel extends Equatable {
  List<String> title;
  ExamModel(this.title);
  @override
  List<Object> get props => [title];

}
class Dog {
  final int id;
  final String name;
  final int age;

  Dog({this.id, this.name, this.age});
}
