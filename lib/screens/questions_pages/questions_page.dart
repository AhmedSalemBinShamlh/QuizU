import 'package:flutter/material.dart';

import '/component/action_button.dart';
import '/component/answer_button.dart';
import '/screens/end_questions_pages/complet_page.dart';
import '/screens/end_questions_pages/wrong_page.dart';

class QuestionsScreen extends StatefulWidget {
  QuestionsScreen({Key? key, required this.questions}) : super(key: key);
  List questions;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int question_index = 0;
  int score = 0;

  void answer(String answer_char) {
    if (widget.questions[question_index]["correct"] == answer_char) {
      setState(() {
        score += 1;
      });
      next();
    } else {
      wrong();
    }
  }

  void next() {
    if (question_index < widget.questions.length - 1) {
      setState(() {
        question_index += 1;
      });
    } else {
      complet();
    }
  }

  void complet() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => CompletScreen(
                  score: score,
                )));
  }

  void wrong() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => WrongScreen(
                  questions: widget.questions,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 2,
            child: Center(
              child: TweenAnimationBuilder<Duration>(
                  duration: const Duration(minutes: 2),
                  tween: Tween(
                      begin: const Duration(minutes: 2), end: Duration.zero),
                  onEnd: complet,
                  builder:
                      (BuildContext context, Duration value, Widget? child) {
                    final minutes = value.inMinutes;
                    final seconds = value.inSeconds % 60;
                    return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                            '$minutes:${seconds < 10 ? "0$seconds" : seconds}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 50)));
                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              "Q${question_index + 1}) ${widget.questions[question_index]["Question"]}",
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnswerButton(
                  label: widget.questions[question_index]["a"],
                  onPressed: () {
                    answer("a");
                  },
                ),
                AnswerButton(
                  label: widget.questions[question_index]["b"],
                  onPressed: () {
                    answer("b");
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnswerButton(
                  label: widget.questions[question_index]["c"],
                  onPressed: () {
                    answer("c");
                  },
                ),
                AnswerButton(
                  label: widget.questions[question_index]["d"],
                  onPressed: () {
                    answer("d");
                  },
                ),
              ],
            ),
          ),
          Flexible(child: Container()),
          ActionButton(onPressed: next, label: "Skip"),
          Flexible(child: Container()),
        ],
      ),
    );
  }
}
