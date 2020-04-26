import 'package:flash_chat/bloc/bloc.dart';
import 'package:flash_chat/data/exam_repo.dart';
import 'package:flash_chat/data/question_repo.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flash_chat/screens/home_screen.dart';
import 'package:flash_chat/screens/quiz_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter/counter_bloc.dart';
import 'bloc/question_bloc/sample_bloc_delegate.dart';

void main() {
 // BlocSupervisor.delegate = SimpleBlocDelegate();
  ExamRepository examRepo=ExamRepository();
  QuestionRepository questionRepo=QuestionRepository();
  CounterBloc counterB =CounterBloc();
  runApp(App(examRepo: examRepo,questionRepo: questionRepo,counterB:counterB)

      );}

class App extends StatelessWidget {
  final ExamRepository examRepo;
  final QuestionRepository questionRepo;
  final CounterBloc counterB;

  const App({
    Key key,
    @required this.examRepo,
    @required this.questionRepo, this.counterB,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ExamBloc>(
          create: (BuildContext context) => ExamBloc(examRepo),
        ),
        BlocProvider<QuestionBloc>(
          create: (BuildContext context) => QuestionBloc(questionRepo: questionRepo, counterB: counterB),
        ),
    BlocProvider<CounterBloc>(
    create: (context) => CounterBloc(),)
      ],
      child: HomeScreen(),
    );
  }
}
/*
class ScreenSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
      //  QuizScreen.id: (context) => QuizScreen(),
       // LoginScreen.id: (context) => LoginScreen(),
       // RegistrationScreen.id: (context) => RegistrationScreen(),
       // ChatScreen.id: (context) => ChatScreen(),
      },
    );
  }
}
*/
