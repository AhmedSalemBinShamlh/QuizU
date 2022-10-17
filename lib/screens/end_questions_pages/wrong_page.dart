import 'package:flutter/material.dart';

import '/component/action_button.dart';
import '../questions_pages/questions_page.dart';

class WrongScreen extends StatelessWidget {
  WrongScreen({Key? key, required this.questions}) : super(key: key);
  List questions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.close,
                    size: 30,
                  ))
            ],
          ),
          Flexible(child: Container()),
          const Padding(
            padding: EdgeInsets.only(bottom: 38.0),
            child: Text(
              "Wrong Answer",
              style: TextStyle(fontSize: 25),
            ),
          ),
          ActionButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => QuestionsScreen(
                              questions: questions,
                            )));
              },
              label: "Try Again"),
          Flexible(child: Container()),
        ],
      ),
    );
  }
}
