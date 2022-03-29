import 'package:flutter/material.dart';

class MyQuestion extends StatelessWidget {
  final String questionText;
  final Image imageEmbed;
  final MyChoice choice1;
  final MyChoice choice2;
  final MyChoice choice3;
  final MyChoice choice4;

  const MyQuestion({Key? key, required this.questionText, required this.imageEmbed, required this.choice1, required this.choice2, required this.choice3, required this.choice4}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const SizedBox(height: 20,),
        Text(
          questionText,
          style: const TextStyle(
              fontSize: 20,
              color: Colors.pink
          ),
        ),
        SizedBox(
          width: screenSize.width > 600 ? 196: 240,
          height: screenSize.width > 600 ? 196: 240,
          child: imageEmbed,
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                choice1,
                screenSize.width > 600 ? const SizedBox(width: 25,): const SizedBox(width: 10,),
                choice2,
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                choice3,
                screenSize.width > 600 ? const SizedBox(width: 25,): const SizedBox(width: 10,),
                choice4,
              ],
            ),
          ],
        )
      ],
    );
  }
}

class MyChoice extends StatefulWidget {
  final bool correctChoice;
  final String choiceText;
  final Color colors;
  final Function function;
  final Function increaseScore;
  final Function toHome;

  const MyChoice({Key? key, required this.choiceText, required this.correctChoice, required this.colors, required this.function, required this.increaseScore, required this.toHome}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyChoiceState();
  }
}

class _MyChoiceState extends State<MyChoice> {
  late Color myColor;
  late int curScore;

  void _revealAnswer(correctChoice) {
    setState(() {
      myColor = correctChoice ? Colors.green: Colors.red;
      if (!correctChoice) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Incorrect Answer!'),
                content: const Text('Incorrect Answer!'),
                actions: <Widget>[
                  ElevatedButton(
                    onPressed: () => {
                      widget.toHome(context),
                    },
                    child: const Text('Ok'),
                  ),
                ],
              );
            }
        );
        return;
      }
      if (correctChoice) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Correct Answer!'),
                content: Text('You get $curScore point'),
                actions: <Widget>[
                  ElevatedButton(
                      onPressed: () => {
                        widget.function(),
                        Navigator.pushNamed(context, '/another'),
                      },
                      child: const Text('Ok'),
                  ),
                ],
              );
            }
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    myColor = widget.colors;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        width: 150,
        height: 64,
        color: myColor,
        child: Text(
          widget.choiceText,
          style: const TextStyle(
              color: Colors.white
          ),
        ),
      ),
      onTap: () {
        curScore = widget.increaseScore(1);
        _revealAnswer(widget.correctChoice);
      },
    );
  }
}