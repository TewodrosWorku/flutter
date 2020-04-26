import 'package:flash_chat/data/model/question_model.dart';
import "package:flutter/material.dart";

class RB extends StatefulWidget {
  RB({this.choice, this.value,this.groupValue,this.onChanged});

  final String choice;
  final String value;
  final String groupValue;
  final Function (String value) onChanged;
  @override
  _RBState createState() => _RBState();

}
class _RBState extends State<RB> {
  bool dense=false;
  // Declare this variable
  String _selection = '';
  @override
  Widget build(BuildContext context) {

    return   Padding(
      padding: const EdgeInsets.all(8.0),

      child: Material(
        elevation: 5.0,
        child: RadioListTile(
          title: Text(widget.choice,  style: TextStyle(color: Colors.black,),),
          value: widget.value,
          groupValue: widget.groupValue,
          dense: dense,
          activeColor: Colors.green,
          onChanged:widget.onChanged,

        ),
      ),
    );
  }
}


class QuestionText extends StatelessWidget {
  QuestionText(this.question);
  final String question;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(question,
        style: TextStyle(
          backgroundColor: Colors.white,
          color: Colors.black,
          fontSize: 20.0,),
      ),
    );
  }
}

class ShowChoices extends StatelessWidget {
  final ShowAnswerQuestionModel question;
  ShowChoices(this.question);
  @override
  Widget build(BuildContext context) {
    List<Widget> list = new List<Widget>();
    for (int i = 0; i < question.answers.length; i++)

    {
      if(question.answers[i].correct=="false" && question.answers[i].userChoice=="true")
       { list.add( Wrong(choice: question.answers[i].choice));}
      else if(question.answers[i].correct=="true")
        {list.add( Correct(choice: question.answers[i].choice));}
      else
        {list.add( EmptyChoice(choice: question.answers[i].choice));}
    };
    return Column(children: list);
  }
}

class Correct extends StatelessWidget {
  final String choice;
  Correct({this.choice});
  @override
  Widget build(BuildContext context) {
    print('at correct');
    print(choice);
    return   Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 5.0,
        color: Colors.green,
        child: RadioListTile(
          title: Text(choice,  style: TextStyle(color: Colors.red,),),
          //title: Text(choice,  style: TextStyle(color: Colors.red,backgroundColor: Colors.green),),
          value: "1",
          groupValue: "1",
          activeColor: Colors.green,
          onChanged:null,
        ),
      ),
    );
  }
}

class Wrong extends StatelessWidget {
  final String choice;

  Wrong({this.choice});
  @override
  Widget build(BuildContext context) {
    print('at wrong');
    print(choice);
    return   Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.red,
        child: Material(
          elevation: 5.0,
          color: Colors.red,
          child: RadioListTile(
            title: Text(choice,  style: TextStyle()),
            //title: Text(choice,  style: TextStyle(color: Colors.red,backgroundColor: Colors.green),),
            value: "1",
            groupValue: "1",
            activeColor: Colors.green,
            onChanged:null,
          ),
        ),
      ),
    );
  }
}

class EmptyChoice extends StatelessWidget {
  final String choice;

  EmptyChoice({this.choice});
  @override
  Widget build(BuildContext context) {
    print('at empty');
    print(choice);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 5.0,
        child: RadioListTile(
            title: Text(choice,  style: TextStyle(color: Colors.black,),),
            //title: Text(choice,  style: TextStyle(color: Colors.red,backgroundColor: Colors.green),),
            value: "1",
            groupValue: "1",
            activeColor: Colors.green,
            onChanged:null,

          ),
      ),
    );
  }
}

