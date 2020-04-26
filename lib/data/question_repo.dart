
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flash_chat/api/networking.dart';
import 'package:flash_chat/data/model/question_model.dart';
import 'package:sqflite/sqflite.dart';

abstract class QuestionRepo {
  Future<List<QuestionModel>> fetchQuestion(String exam);

}

class QuestionRepository extends QuestionRepo {
  NetworkHelper networkHelper = NetworkHelper();

  @override
  Future<List<QuestionModel>> fetchQuestion(String exam) async {
   // Response response = await networkHelper.getData(exam);
    print('from fetchquestion');
    String  jsonString = await networkHelper.loadPersonFromAssets();
   // print(jsonString);
    final json = jsonDecode(jsonString);
   // print(json);
   // print(QuestionModel.fromJson(json));
    return QuestionModel.fromJson(json);

    //return question;
  /* if (response.statusCode == 200) {
     print('sending from repo');
   Map<String, dynamic> json = jsonDecode(response.body);
   print(QuestionModel.fromJson(json));
    return QuestionModel.fromJson(json);
  } else(response.statusCode != 200);
   throw Exception();*/
  }

  Future<String> loadPersonFromAssets() async {
    print('from loadppersonfromasset');
    return await rootBundle.loadString('json/question.json');
  }


}

const question= {{"exam": "level1",
  "subject": "marketing",
  "id": 1,
  "content": "What is 1 +1 dhdhdhd d dhdhdh . In 2020 what happened that is I found exciting  dhdhhdh hdhdh dhhdh dhdhd dhd dhdhdhee",
  "answers": [
    {
      "id": 1,
      "choice": "11 1111111n11111111111n1n 1   1",
      "question": 1
    },
    {
      "id": 2,
      "choice": "all",
      "question": 1
    },
    {
      "id": 3,
      "choice": "2",
      "question": 1
    },
    {
      "id": 4,
      "choice": "1",
      "question": 1
    }
  ],
  "solution": "u know the answer idiot"
},

  {"exam": "level1",
    "subject": "marketing",
    "id": 2,
    "content": "What is 1 +1 dhdhdhd d dhdhdh . In 2020 what happened that is I found exciting  dhdhhdh hdhdh dhhdh dhdhd dhd dhdhdhee",
    "answers": [
      {
        "id": 1,
        "choice": "11 1111111n11111111111n1n 1   1",
        "question": 1
      },
      {
        "id": 2,
        "choice": "all",
        "question": 1
      },
      {
        "id": 3,
        "choice": "2",
        "question": 1
      },
      {
        "id": 4,
        "choice": "1",
        "question": 1
      }
    ],
    "solution": "u know the answer idiot"
  }
};
