import 'package:flash_chat/bloc/counter/counter_bloc.dart';
import 'package:flash_chat/bloc/counter/counter_event.dart';
import 'package:flash_chat/bloc/exam_bloc/exam_event.dart';
import 'package:flash_chat/bloc/question_bloc/question_bloc.dart';
import 'package:flash_chat/bloc/question_bloc/question_event.dart';
import 'package:flash_chat/bloc/question_bloc/question_state.dart';
import 'package:flash_chat/data/model/question_model.dart';
import 'package:flash_chat/data/question_repo.dart';
import 'package:flash_chat/data/question_repo.dart';
import 'package:flash_chat/screens/home_screen.dart';
import 'package:flash_chat/services/quiz_brain.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/components/radio_button.dart';
import 'package:flash_chat/components/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizScreen extends StatefulWidget {
  static const String id="QuizScreen";
  final selectedExam;
  QuizScreen(this.selectedExam);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  QuestionBloc _questionBloc;
  @override
  void initState() {
    super.initState();
    _questionBloc= BlocProvider.of<QuestionBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    _questionBloc.add(FetchQuestion(widget.selectedExam));
   return  MaterialApp(
        home: Scaffold(
            body: Center(
               child: BlocBuilder<QuestionBloc, QuestionState>(
                 bloc: _questionBloc,
                builder: (BuildContext context, QuestionState state) {
                  if (state is QuestionIsLoading)
                    return Center(child: CircularProgressIndicator());
                  if (state is NextQuestionState){
                    print(state);
                    QuestionModel question=state.question;
                    return Choices(question);
                  };
                  if (state is ShowAnswerState){
                    print(state);
                    print('question state reached at screen');
                    return ShowAnswer(state.question);
                  };

              if (state is ShowResultState){
                return ShowResult(correct:state.correct,wrong:state.wrong);
              };
            }),
       ),
   ),);


  }
}

class Choices extends StatefulWidget {
  final QuestionModel question;
  Choices(QuestionModel this.question);
  @override
  _ChoicesState createState() => _ChoicesState();
}

class _ChoicesState extends State<Choices> {
  var _selection;

  onChangedRB(String  value) { setState(() { _selection = value; });
  print('onchange clicked frm question');
  print(value);
  BlocProvider.of<QuestionBloc>(context).add(CheckUserAnswerEvent(value));
//BlocProvider.of<CounterBloc>(context).add(Inc());

  }
  @override
  Widget build(BuildContext context) {
    List<Widget> clist = new List<Widget>();
    for (var c in widget.question.answers){
      clist.add(Container(child: RB(choice: c.choice,value: c.id.toString(),groupValue: _selection,onChanged: onChangedRB,),));
    };

      return  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:<Widget>[
          Container(child: QuestionText(widget.question.content)),
          Container(
            child: ListView.builder(
                shrinkWrap: true, // use this
                itemCount: clist.length,
                itemBuilder: (context, index) {
                  final item = clist[index];
                  return item;
                }
            ),
          ),
        ],

    );
    }
  }

  class ShowAnswer extends StatelessWidget {
   final ShowAnswerQuestionModel question;
   ShowAnswer(this.question);
    @override
    Widget build(BuildContext context) {
      print(question.content+ ' at qscreen q');
      return  Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(child: QuestionText(question.content)),
                ],
              ),
            Row(
              children: <Widget>[
                Expanded(child: ShowChoices(question)),
              ],
            ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: FlatButton(
                      onPressed: () {
                        BlocProvider.of<QuestionBloc>(context).add(NextQuestionEvent());
                      },
                      child: Text(
                        "Next",
                        style: TextStyle(fontSize: 20.0,backgroundColor: Colors.white),
                      ),
                    )
                  ),
                ],
              )

            ],

          ),
      );

    }
  }

class QuizFinishedAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     {
      return Container(
          child: RaisedButton(
            child: _onAlertButtonsPressed(context),
          ));
    }
  }
}


_onAlertButtonsPressed(context) {
  Alert(
    context: context,
    type: AlertType.warning,
    title: "RFLUTTER ALERT",
    desc: "Flutter is more awesome with RFlutter Alert.",
    buttons: [
      DialogButton(
        child: Text(
          "Restart again",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () =>   BlocProvider.of<QuestionBloc>(context).add(ResetEvent())
        ,
        color: Color.fromRGBO(0, 179, 134, 1.0),
      ),
      DialogButton(
        child: Text(
          "Home",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () {
           Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return HomeScreen();
              },
            ),);
          }
      )
    ],
  ).show();
}