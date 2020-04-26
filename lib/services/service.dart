//import 'package:flash_chat/api/networking.dart';
/*

const apiKey = 'e72ca729af228beabd5d20e3b7749713';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class QuestionModel {
  List question=[
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
      "content":"What is 1 +1 is in contries you visited not long ago",
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
  Future<dynamic> getQuestionData(String examName) async {
    print('exam name from service'+examName);
    NetworkHelper networkHelper = NetworkHelper(examName);

    var questionData = await networkHelper.getData();
    return questionData;
  }


  }

class ExamModel {
  Future<dynamic> getExamData(String examName) async {
    NetworkHelper networkHelper = NetworkHelper('url here');

    var examData = await networkHelper.getData();
    return examData;
  }
}
*/

/* @override
  void initState() {
    super.initState();
    getQuestionData();

  }
  void getQuestionData() async {
    setState(() {
      loading = false;
    }); */



/*
class QuizScreen extends StatelessWidget {
  static const String id="QuizScreen";
  QuizScreen({this.examSelected});
  final examSelected;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Quizler(),
        )  )
    ;
  }
}
*/

/*

  String _selection='';
  void onChangedRB (value){
    print('onChangedRb called');
    setState((){ _selection = value;print(value);print('B is clicked');});
    quizBrain.checkUserAnswer(_selection);

    checkAnswer(true);}
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    print('checkAnswer called');
    bool correctAnswer = widget.quizBrain.getCorrectAnswer();

    setState(() {
      //TODO: Step 4 - Use IF/ELSE to check if we've reached the end of the quiz. If so,
      //On the next line, you can also use if (quizBrain.isFinished()) {}, it does the same thing.
      if (widget.quizBrain.isFinished() == true) {
        //TODO Step 4 Part A - show an alert using rFlutter_alert,
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();

        //TODO Step 4 Part C - reset the questionNumber,
        widget.quizBrain.reset();

        //TODO Step 4 Part D - empty out the scoreKeeper.
        scoreKeeper = [];
      }

      //TODO: Step 6 - If we've not reached the end, ELSE do the answer checking steps below 👇
      else {
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scoreKeeper.add(Icon(
            Icons.close,

            color: Colors.red,
          ));
        }
        widget.quizBrain.nextQuestion();
        print('nextQuestion launched');

      }
    });
  }
  */

