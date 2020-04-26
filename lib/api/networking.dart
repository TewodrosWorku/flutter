import 'package:flash_chat/data/question_repo.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper();

  //final String url;

  Future getData(String url) async {
    print(url);
    http.Response response = await http.get(url);
    return response;

    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      return response.statusCode;
    }

   //return question;
  }
  Future postData(url) async {
    http.Response response = await http.post(url);

    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      return response.statusCode;
    }
  }

 // Load the JSON file from assets

  Future<String> loadPersonFromAssets() async {
    print('from loadppersonfromasset');
    return await rootBundle.loadString('json/question.json');
  }

  Future<String> loadExamFromAssets() async {
    print('from fromexam');
    return await rootBundle.loadString('json/exam.json');
  }
  final question=[
    {
      "exam":"level1",
      "subject":"marketing",
      "id":1,
      "content":"What is 1 +1 dhdhdhd d dhdhdh . In 2020 what happened that is I found exciting  dhdhhdh hdhdh dhhdh dhdhd dhd dhdhdhee",
      "answers":[
        {
          "id":1,
          "choice":"11 1111111n11111111111n1n 1   1",
          "question":1
        },
        {
          "id":2,
          "choice":"all",
          "question":1
        },
        {
          "id":3,
          "choice":"2",
          "question":1
        },
        {
          "id":4,
          "choice":"1",
          "question":1
        }
      ],
      "solution":"u know the answer idiot"
    },
    {
      "exam":"level1",
      "subject":"marketing",
      "id":2,
      "content":"What is 1 +1 in all countries except where you fucking live?",
      "answers":[
        {
          "id":5,
          "choice":"1",
          "question":2
        },
        {
          "id":6,
          "choice":"all",
          "question":2
        },
        {
          "id":7,
          "choice":"22",
          "question":2
        },
        {
          "id":8,
          "choice":"i dont know",
          "question":2
        }
      ],
      "solution":"22"
    }
  ];
}
String  qJson= question.toString();
