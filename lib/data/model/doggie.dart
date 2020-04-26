import 'dart:async';
import 'dart:io';
import 'dart:ui';
import 'package:flash_chat/data/model/question_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:equatable/equatable.dart';


class DbProvider {
  DbProvider._();
 static final DbProvider db= DbProvider._();
  static Database _database;
  Future<Database> get database async {
    print(" geter() accessed from db");

    if(_database != null)
      return _database;

    _database = await initDB();
    return _database;
  }

  initDB() async {
    print(" initDB() accessed from db");
    final dbc= await  openDatabase(
      join(await getDatabasesPath(), 'temertbet.db'),
       onCreate: (db, version) {
         db.execute(
          '''CREATE TABLE QTable (id INTEGER PRIMARY KEY, content TEXT, solution TEXT)''',
        );
         db.execute(
           '''CREATE TABLE ATable (id INTEGER PRIMARY KEY, choice TEXT, correct INTEGER,question INTEGER)''',
         );
         //correct is actually BOOL so 0 for false 1 for True
         db.execute(
           '''CREATE TABLE STable (id INTEGER PRIMARY KEY, exam TEXT, quesiton_order TEXT,question_list TEXT,incorrect_questions TEXT,complete INTEGER
           ,user_answers TEXT,start INTEGER,end INTEGER)''',
         );
         //complete is BOOl so 0 for false 1 for true.
      },
      version: 1,
    );
    final QModel fido = QModel(
      id: 0,
      content: 'This is the first question from sqlite',
      solution: 'Fuck this shit who cares',
    );
  print("check if db created end of initDB()");
 // print(dbc.execute('''CREATE TABLE QTable (id INTEGER PRIMARY KEY, content TEXT, solution TEXT)'''));
  print(dbc.toString());
  return dbc;
  }
  Future<void> insertQuestion(List<QModel> question) async {
    final Database db = await database;
    question.forEach((f) async => await db.insert('QTable',f.toMap(), conflictAlgorithm: ConflictAlgorithm.replace,
    ));

  }
  Future<void> insertAnswers(List<AModel> answers) async {
    final Database db = await database;
    answers.forEach((f) async => await db.insert('ATable',f.toMap(), conflictAlgorithm: ConflictAlgorithm.replace,
    ));

  }

  Future<List<QModel>> getQ() async {
    // Get a reference to the database.
    final Database db = await database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('QTable');
    print(" QUESTION() accessed from db");
    print('check the lengt');
    maps.forEach((f)=>print(f.length));

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return QModel(
        id: maps[i]['id'],
        content: maps[i]['content'],
        solution: maps[i]['solution'],
      );
    });
  }

  Future<void> updateQuestion(QModel question) async {
    // Get a reference to the database.
    final db = await database;

    // Update the given Dog.
    await db.update(
      'QTable',
      question.toMap(),
      // Ensure that the Dog has a matching id.
      where: "id = ?",
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [question.id],
    );
  }

  Future<void> deleteQuestion(int id) async {
    // Get a reference to the database.
    final db = await database;

    // Remove the Dog from the database.
    await db.delete(
      'QTable',
      // Use a `where` clause to delete a specific dog.
      where: "id = ?",
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }

  /*
  var fido = QModel(
    id: 0,
    content: 'This is the first question from sqlite',
    solution: 'Fuck this shit who cares',
  );

  // Insert a dog into the database.
  await insertQuestion(fido);

  // Print the list of dogs (only Fido for now).
  print(await questions());

  // Update Fido's age and save it to the database.
  fido = QModel(
    id: fido.id,
    content: fido.content,
    solution: fido.solution,
  );
  await updateQuestion(fido);

  // Print Fido's updated information.
  print(await questions());

  // Delete Fido from the database.
  await deleteQuestion(fido.id);

  // Print the list of dogs (empty).
  print(await questions());
} */



}

/*
class QModel {
  final int id;
  final String content;
  final String solution;

  QuestionModel({this.id, this.content, this.solution});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'content': content,
      'solution': solution,
    };
  }
  */
