/*//import 'package:flash_chat/bloc/exam_bloc/exam_bloc.dart';
//import 'package:flash_chat/bloc/exam_bloc/exam_state.dart';
import 'package:flash_chat/bloc/exam_bloc/exam_event.dart';
import 'package:flash_chat/bloc/exam_bloc/exam_state.dart';
import 'package:flash_chat/bloc/question_bloc/question_event.dart';
import 'package:flash_chat/bloc/question_bloc/question_state.dart';
import 'package:flash_chat/components/custom_button.dart';
import 'package:flash_chat/data/exam_repo.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/components/radio_button.dart';
import 'package:flash_chat/services/service.dart';
import 'package:flash_chat/screens/quiz_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flash_chat/bloc/bloc.dart';

class HomeScreen extends StatelessWidget {
  static const String id = "HomeScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
          create: (context) => ExamBloc(), child: ExamSelect()

      ),
    );
  }
}

class ExamSelect extends StatefulWidget {


  @override
  _ExamSelectState createState() => _ExamSelectState();
}

class _ExamSelectState extends State<ExamSelect> {
  var  dropdownValue ;

  @override
  Widget build(BuildContext context) {
    final ExamBloc examBloc = BlocProvider.of<ExamBloc>(context);
    final QuestionBloc questionBloc = BlocProvider.of<QuestionBloc>(context);

    int index=0;
    return BlocBuilder<ExamBloc, ExamState>(builder: (context, state) {
      examBloc.add(FetchExam());
      print(state);
      if (state is ExamIsLoading)
        return Center(child: CircularProgressIndicator());
      if (state is ExamIsLoaded)
        return Center(
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
                                style: TextStyle(color: Colors.deepPurple),
                                underline: Container(
                                  height: 2,
                                  color: Colors.deepPurpleAccent,
                                ),
                                onChanged: (String newValue) {
                                  print('from onchanged');
                                  setState(() {
                                    dropdownValue=newValue;
                                  });

                                  print(newValue);
                                },
                                items: state.ListOfExams.map<
                                    DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                            FlatButton(
                              child: Center(child: const Text('Select')),
                              onPressed: () {
                                questionBloc.add(FetchQuestionEvent(dropdownValue));
                                if (state is QuestionIsLoading)
                                  return Center(child: CircularProgressIndicator());
                                if (state is QuestionIsLoadedState) {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return QuizScreen(
                                          questionList:state.questionList,
                                        );
                                      },
                                    ),);
                                }
/*
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return QuizScreen(
                                        selectedExam: dropdownValue,
                                    );
                                  },
                                ),
                              ); */
                                setState(() {
                                  //  index=state.ListOfExams.indexOf(newValue);
                                  print( dropdownValue);
                                });
                                /*
                              Navigator.pushNamed(context, QuizScreen.id,
                                  arguments: {"exam": dropdownValue}
                                  // MaterialPageRoute(builder: (context) => QuizScreen(dropdownValue)),
                                  ); */
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    /*        Expanded(
                    child: Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Center(
                            child: const ListTile(
                              /* leading: Icon(Icons.album),*/
                              title: Text('Select Exam'),
                              /*subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),*/
                            ),
                          ),
                          Container(
                            child: DropdownButton<String>(
                              value: state.ListOfExams[index],
                              icon: Icon(Icons.arrow_downward),
                              iconSize: 24,
                              elevation: 16,
                              style: TextStyle(color: Colors.deepPurple),
                              underline: Container(
                                height: 2,
                                color: Colors.deepPurpleAccent,
                              ),
                              onChanged: (String newValue) {

                            setState(() {
                              index = state.ListOfExams.indexOf(newValue);
                            })
                                ;
                              },
                              items: state.ListOfExams.map<
                                  DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                          FlatButton(
                            child: const Text('LISTEN'),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ), */
                  ],
                ),
              )
            ],
          ),
        );
    });

  }


}
*/

/*
class FB extends StatelessWidget {
  final exam;
  FB(this.exam);
  @override
  Widget build(BuildContext context) {
    final questiontBloc = BlocProvider.of<QuestionBloc>(context);
    questiontBloc.add(FetchQuestionEvent(exam));
    return BlocBuilder<QuestionBloc, QuestionState>(builder: (context, state) {
      if (state is QuestionIsLoading)
        return Center(child: CircularProgressIndicator());
    if (state is QuestionIsLoadedState) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return QuizScreen(
              questionList:state.questionList,
            );
          },
        ),);
    }
    }

           );
  }
}
*/
/* Widget build(BuildContext context) {
    return    MultiBlocProvider(
        providers: [
          BlocProvider<ExamBloc>(
            create: (BuildContext context) => ExamBloc(),
          ),
       //   BlocProvider<QuestionBloc>(
        //      create: (BuildContext context) => QuestionBloc()),
        ],
        child: BlocBuilder<ExamBloc, ExamState>(builder: (context, state) {
          final ExamBloc examBloc = BlocProvider.of<ExamBloc>(context);
          examBloc.add(FetchExam());
          print(state);
          if (state is ExamIsLoading)
            return Center(child: CircularProgressIndicator());
          */