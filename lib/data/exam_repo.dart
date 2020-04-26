
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flash_chat/api/networking.dart';

abstract class ExamRepo {
  Future<List<String>> fetchExam();

}

class ExamRepository extends ExamRepo {
  NetworkHelper networkHelper = NetworkHelper();

  @override
  Future<List<String>> fetchExam() async {
    String  jsonString = await networkHelper.loadExamFromAssets();
    final json = jsonDecode(jsonString);
    print('from get exams repo');
    print(json);
   List<String> listOfString=List<String>.from(json);
    print(listOfString);
    return listOfString;
    Response response = await networkHelper.getData('https://flasklf.appspot.com/api/v1/places');
    if (response.statusCode == 200) {
      List<dynamic> listOfExams = jsonDecode(response.body);
     final loe=List<String>.from(listOfExams);
      return loe;
    } else(response.statusCode != 200);
    throw Exception();
  }



}

