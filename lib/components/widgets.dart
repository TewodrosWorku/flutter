import 'package:flash_chat/bloc/question_bloc/question_bloc.dart';
import 'package:flash_chat/bloc/question_bloc/question_event.dart';
import 'package:flash_chat/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class HomeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
         child: Column(
           mainAxisSize: MainAxisSize.min,
           children: <Widget>[
           const ListTile(
              leading: Icon(Icons.album),
              title: Text('The Enchanted Nightingale'),
              subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),),
            ButtonBar(
          children: <Widget>[
                 FlatButton(
                   child: const Text('BUY TICKETS'),
                  onPressed: () {/* ... */},
                  ),
                  FlatButton(
                      child: const Text('LISTEN'),
                  onPressed: () {/* ... */},
                  ),
                  ],
                  ),
                  ],
                  ),
                  )
                  );
  }
}
/*
class QuestionText extends StatelessWidget {
  QuestionText(this.question);
  final String question;

  @override
  Widget build(BuildContext context) {
    return Text(question,
      style: TextStyle(
      color: Colors.black,
      fontSize: 20.0,),
    );
  }
} */

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown[100],
      child: Center(
        child: SpinKitChasingDots(
          color: Colors.brown,
          size: 50.0,
        ),
      ),
    );
  }
}

class ShowResult extends StatelessWidget {
  final correct;
  final wrong;
  ShowResult({@required this.correct, @required this.wrong});
  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(correct.toString()),
          Text(wrong.toString()),
          Row(
            children: <Widget>[
              Expanded(
                  child: FlatButton(
                    onPressed: () {
                      BlocProvider.of<QuestionBloc>(context).add(ResetEvent());
                    },
                    child: Text(
                      "Restart",
                      style: TextStyle(fontSize: 20.0,backgroundColor: Colors.white),
                    ),
                  )
              ),
              Expanded(
                  child: FlatButton(
                    onPressed: () {
                      BlocProvider.of<QuestionBloc>(context).add(ResetEvent());
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return HomeScreen();
                          },
                        ),);
                    },
                    child: Text(
                      "Home",
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
