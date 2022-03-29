import 'package:flutter/material.dart';
import 'package:respond_chef/home_screen.dart';
import 'package:respond_chef/question.dart';

void main() {
  runApp(const MyQuiz());
}

class MyQuiz extends StatefulWidget {
  const MyQuiz({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyQuizState();
  }
}

class _MyQuizState extends State<MyQuiz> {
  var counter = 0;
  var scores = 0;

  int increaseScore(int a) {
    return scores += a;
  }

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void resetToHome(context) {
    scores = 0;
    counter = 0;
    Navigator.popUntil(
      context,
      ModalRoute.withName('/'),
    );
  }

  Widget _nextQuestion(context) {
    var questions = [
      MyQuestion(
          questionText: 'questionText',
          imageEmbed: Image.network('https://i0.wp.com/skdesu.com/wp-content/uploads/2019/11/dango-doce.jpg'),
          choice1: MyChoice(choiceText: 'choiceText', correctChoice: false, colors: Colors.amberAccent, function: incrementCounter, increaseScore: increaseScore, toHome: resetToHome),
          choice2: MyChoice(choiceText: 'choiceText', correctChoice: false, colors: Colors.brown, function: incrementCounter, increaseScore: increaseScore, toHome: resetToHome),
          choice3: MyChoice(choiceText: 'Food', correctChoice: true, colors: Colors.purpleAccent, function: incrementCounter, increaseScore: increaseScore, toHome: resetToHome),
          choice4: MyChoice(choiceText: 'choiceText', correctChoice: false, colors: Colors.teal, function: incrementCounter, increaseScore: increaseScore, toHome: resetToHome)
      ),
      MyQuestion(
          questionText: 'Mark Felon',
          imageEmbed: Image.network('https://pbs.twimg.com/profile_images/910953127280594944/7OuuUB9F_400x400.jpg'),
          choice1: MyChoice(choiceText: 'Smart', correctChoice: false, colors: Colors.amberAccent, function: incrementCounter, increaseScore: increaseScore, toHome: resetToHome),
          choice2: MyChoice(choiceText: 'Intelligent', correctChoice: false, colors: Colors.brown, function: incrementCounter, increaseScore: increaseScore, toHome: resetToHome),
          choice3: MyChoice(choiceText: 'Handsome', correctChoice: false, colors: Colors.purpleAccent, function: incrementCounter, increaseScore: increaseScore, toHome: resetToHome),
          choice4: MyChoice(choiceText: 'All 3 correct', correctChoice: true, colors: Colors.teal, function: incrementCounter, increaseScore: increaseScore, toHome: resetToHome)
      ),
      MyQuestion(
          questionText: 'Mike',
          imageEmbed: Image.network('https://boxrec.com/media/images//thumb/9/94/MikeTysonHeadshot2.jpg/250px-MikeTysonHeadshot2.jpg'),
          choice1: MyChoice(choiceText: 'May', correctChoice: false, colors: Colors.amberAccent, function: incrementCounter, increaseScore: increaseScore, toHome: resetToHome),
          choice2: MyChoice(choiceText: 'Leana', correctChoice: false, colors: Colors.brown, function: incrementCounter, increaseScore: increaseScore, toHome: resetToHome),
          choice3: MyChoice(choiceText: 'Tyson', correctChoice: true, colors: Colors.purpleAccent, function: incrementCounter, increaseScore: increaseScore, toHome: resetToHome),
          choice4: MyChoice(choiceText: 'Jackson', correctChoice: false, colors: Colors.teal, function: incrementCounter, increaseScore: increaseScore, toHome: resetToHome)
      ),
    ];

    if (counter > questions.length-1) {
      return Scaffold(
        body: Center(
          child: ElevatedButton(
              onPressed: () => {
                resetToHome(context),
              },
              child: const Text("Home")
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('Question $counter'),),
      body: Column(
        children: [
          questions[counter],
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Visibility(
                visible: counter > 0? true: false,
                  child: ElevatedButton(
                      onPressed: () => {
                        counter--,
                        Navigator.pop(context),
                      },
                      child: const Text("Previous")
                  ),
              ),
              ElevatedButton(
                  onPressed: () => {
                    resetToHome(context),
                  },
                  child: const Text("Home")
              ),
              Visibility(
                visible: counter < questions.length-1? true: false,
                child: ElevatedButton(
                    onPressed: () => {
                      counter++,
                      Navigator.pushNamed(context, '/another'),
                    },
                    child: const Text("Next")
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Quiz App",
      routes: {
        '/': (BuildContext context) => const HomeScreen(),
        '/another': (BuildContext context) => _nextQuestion(context),
      },
    );
  }
}
