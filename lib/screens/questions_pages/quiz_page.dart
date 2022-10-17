import 'package:flutter/material.dart';

import '/component/action_button.dart';
import '/../helper/api.dart';
import '/screens/questions_pages/questions_page.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);
  static const String routeName = "quize";

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Ready to test your knoweldge and challenge others?",
            style: TextStyle(fontSize: 25),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            child: ActionButton(
              onPressed: () async {
                List questions = await gettingQuestions();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => QuestionsScreen(
                              questions: questions,
                            )));
              },
              label: "Quiz Me!",
            ),
          ),
          const Text(
            "Answer as much questions correctly within 2 minutes",
            style: TextStyle(fontSize: 25),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
