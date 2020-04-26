/*


           Container(child: RB(choice:widget.question.answers[0].choice,value:widget.question.answers[0].id.toString(),groupValue:_selection,onChanged:onChangedRB
            )),

          Container(child: RB(choice:widget.question.answers[1].choice,value:widget.question.answers[1].id.toString(),groupValue:_selection,onChanged:onChangedRB)),
          Container(child: RB(choice:widget.question.answers[2].choice,value:widget.question.answers[2].id.toString(),groupValue:_selection,onChanged:onChangedRB)),
          Container(child: RB(choice:widget.question.answers[3].choice,value:widget.question.answers[3].id.toString(),groupValue:_selection,onChanged:onChangedRB)),

 *//*

import 'package:flash_chat/bloc/question_bloc/question_bloc.dart';
import 'package:flash_chat/bloc/question_bloc/question_event.dart';
import 'package:flash_chat/bloc/question_bloc/question_state.dart';
import 'package:flash_chat/data/model/question_model.dart';
import 'package:flash_chat/services/quiz_brain.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/components/radio_button.dart';
import 'package:flash_chat/components/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizScreen extends StatefulWidget {
  static const String id="QuizScreen";
  final selectedExam;
  QuizScreen({this.selectedExam});
  @override
  _QuizScreenState createState() => _QuizScreenState();

}

class _QuizScreenState extends State<QuizScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
          create: (context) => QuestionBloc(), child:GetQuestions(widget.selectedExam)
        //TakeQuiz(widget.SelectedExam)

      ),
    );
  }
}

class GetQuestions extends StatefulWidget {
  //final QuestionBloc questionBloc;
  final String selectedExam;
//  final List<QuestionModel> questionList;
  GetQuestions(this.selectedExam);
  @override
  _GetQuestionsState createState() => _GetQuestionsState();
}

class _GetQuestionsState extends State<GetQuestions> {
  @override
  Widget build(BuildContext context) {
    final QuestionBloc questionBloc = BlocProvider.of<QuestionBloc>(context);
    return BlocBuilder<QuestionBloc, QuestionState>(
        builder: (context, state) {
          questionBloc.add(FetchQuestionEvent(widget.selectedExam));
          if (state is QuestionIsLoading)
            return Center(child: CircularProgressIndicator());
          if (state is QuestionIsLoadedState) {
            QuizBrain  quizBrain=QuizBrain(state.questionList);
            return QText(quizBrain);
          }
        }
    );
  }
}
class QText extends StatelessWidget {
  final QuizBrain quizBrain;
  QText(this.quizBrain);
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            quizBrain.getNextQuestion().content,
            //state.nextQuestion.content,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Choices(quizBrain)
        ]);
  }
}

/*

class TakeQuiz extends StatelessWidget {
  final SelectedExam;
  TakeQuiz(@required this.SelectedExam);

  @override
  Widget build(BuildContext context) {
    final QuestionBloc questionBloc = BlocProvider.of<QuestionBloc>(context);
     return BlocBuilder<QuestionBloc, QuestionState>(
         builder: (context, state) {
           questionBloc.add(FetchQuestionEvent(SelectedExam));

           if (state is QuestionIsLoading)
             return Center(child: Text(state.toString()));
           if (state is QuestionIsLoadedState) {
             QuizBrain quizBrain = QuizBrain(state.questionList);
             return Center(
               child: Padding(
                 padding: const EdgeInsets.all(15.0),
                 child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.stretch,
                     children: <Widget>[
                       Text(
                         quizBrain.getNextQuestion().content,
                         //state.nextQuestion.content,
                         textAlign: TextAlign.center,
                         overflow: TextOverflow.ellipsis,
                         style: TextStyle(fontWeight: FontWeight.bold),
                       ),
                       Choices( questionBloc:questionBloc, quizBrain: quizBrain,),

                     ]),
               ),
             );
           }
         }

     );

    }
  }
*/

class Choices extends StatefulWidget {
  //final QuestionBloc questionBloc;
  QuizBrain quizBrain;
  Choices(@required this.quizBrain);
  @override
  _ChoicesState createState() => _ChoicesState();
}

class _ChoicesState extends State<Choices> {
  var _selection;

  onChangedRB(String  value) { setState(() { _selection = value; });
  print(value);
  widget.quizBrain.nextQuestion();
//  widget.questionBloc.add(CheckUserAnswerEvent(value));
  }
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: <Widget>[
        Container(child: RB(choice:widget.quizBrain.getNextQuestion().content,value:'A',groupValue:_selection,onChanged:onChangedRB
        )),
        Container(child: RB(choice:' no answer please no answer',value:'B',groupValue:_selection,onChanged:onChangedRB)),
        Container(child: RB(choice:' All of the above are answers coz i know shit',value:'C',groupValue:_selection,onChanged:onChangedRB)),
        Container(child: RB(choice:' None of the above an dhave answer in my mind',value:'D',groupValue:_selection,onChanged:onChangedRB)),

      ],
    );

  }
}



*/
