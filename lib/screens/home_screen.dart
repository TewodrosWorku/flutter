//import 'package:flash_chat/bloc/exam_bloc/exam_bloc.dart';
//import 'package:flash_chat/bloc/exam_bloc/exam_state.dart';
import 'package:flash_chat/bloc/exam_bloc/exam_event.dart';
import 'package:flash_chat/bloc/exam_bloc/exam_state.dart';
import 'package:flash_chat/bloc/question_bloc/question_event.dart';
import 'package:flash_chat/bloc/question_bloc/question_state.dart';
import 'package:flash_chat/components/custom_button.dart';
import 'package:flash_chat/data/exam_repo.dart';
import 'package:flash_chat/data/model/doggie.dart';
import 'package:flash_chat/data/model/question_model.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/components/radio_button.dart';
import 'package:flash_chat/services/service.dart';
import 'package:flash_chat/screens/quiz_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flash_chat/bloc/bloc.dart';

class HomeScreen extends StatefulWidget {
  static const String id = "HomeScreen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  ExamBloc _examBloc;
  @override
  void initState() {
    super.initState();
    _examBloc= BlocProvider.of<ExamBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    _examBloc.add(FetchExam());
    return Test();
  }
}

class Test extends StatelessWidget {
    @override
    Widget build(BuildContext context) {

      return MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromRGBO(109, 234, 255, 1),
        accentColor: Color.fromRGBO(72, 74, 126, 1),
        brightness: Brightness.light,
      ),
      title: 'Flutter Quiz',
      home: BlocBuilder<ExamBloc,ExamState>(
        builder: (context, state) {
          print('homescreen');
          print('state is '+state.toString());
          if (state is ExamIsLoading)
            return Center(child: CircularProgressIndicator());
          if (state is ExamIsLoaded)
            return Scaffold(
                body:  ShowExams(state.ListOfExams));
        },
      ),
    );
  }
}

class ShowExams extends StatefulWidget {
  final exams;
  ShowExams(this.exams);
  var dropdownValue;
  @override
  _ShowExamsState createState() => _ShowExamsState();
}

class _ShowExamsState extends State<ShowExams> {
  var  dropdownValue ;
  @override
  Widget build(BuildContext context) {

  //  final ExamBloc examBloc = BlocProvider.of<ExamBloc>(context);
    return  Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         crossAxisAlignment: CrossAxisAlignment.stretch,
         children: <Widget>[
           Expanded(
             child: Row(
               children: <Widget>[
                 Expanded(
                   child: Card(
                     child: Column(
                       mainAxisSize: MainAxisSize.min,
                       children: <Widget>[
                         const ListTile(
                           title: Center(child: Text('Select Exam')),
                         ),
                         Container(
                           child: DropdownButton<String>(
                             hint: Text('Select Exam'),
                             value: dropdownValue,
                             icon: Icon(Icons.arrow_downward),
                             iconSize: 24,
                             elevation: 16,
                             style: TextStyle(
                                 color: Colors.deepPurple),
                             underline: Container(
                               height: 2,
                               color: Colors.deepPurpleAccent,
                             ),
                             onChanged: (String newValue) {
                               print('from onchanged');
                               setState(() {
                                 dropdownValue = newValue;
                               });
                               print(newValue);
                             },
                             items: widget.exams.map<
                                 DropdownMenuItem<String>>((
                                 String value) {
                               return DropdownMenuItem<String>(
                                 value: value,
                                 child: Text(value),
                               );
                             }).toList(),
                           ),
                         ),


                         FlatButton(
                               child: Center(
                                   child: const Text('Select')),
                               onPressed: () {
                                 print('From FlatButton'+dropdownValue);
                                 Navigator.of(context).push(
                                   MaterialPageRoute(
                                     builder: (context) {
                                       return QuizScreen(dropdownValue);
                                     },
                                   ),);
                               }
                           ),
                         Expanded(child: DBQuestion())
                       ],
                     ),
                   ),
                 ),

               ],
             ),
           )
         ],
       ),
     )
    ;
  }
}

class DBQuestion extends StatefulWidget {
  @override
  _DBQuestionState createState() => _DBQuestionState();
}

class _DBQuestionState extends State<DBQuestion> {

  List<QModel> newQuestion;
  Future _qFuture;

  @override
  void initState() {
    super.initState();
    _qFuture = getQuestion();
  }

  getQuestion() async {
    final _qData = await  DbProvider.db.getQ();
    return _qData;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: _qFuture,
        builder: (_, questionData) {
          switch (questionData.connectionState) {
            case ConnectionState.none:
              return Container(child: Text('NOne'),);
            case ConnectionState.waiting:
              return Container(child: Text('Waiting'),);
            case ConnectionState.active:
            case ConnectionState.done:
              newQuestion=questionData.data;
              List<Widget> ff;
             // newQuestion.toList().forEach((f)=>  ff.add(Text(f.content)));
                //newQuestion = Map<String, dynamic>.from(userData.data);

             return Column(children: <Widget>[
                Text( newQuestion[0].content),
              ]);
          }

          return Container(child: Text('nothing'));
        },
      )
      );


  }
}

