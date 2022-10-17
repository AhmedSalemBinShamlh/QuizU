import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '/helper/db_helper.dart';
import '../../helper/api.dart';

class CompletScreen extends StatelessWidget {
  CompletScreen({Key? key, required this.score}) : super(key: key) {
    DBHelper.insert(date: DateTime.now().toString(), score: score);
    userScore(score);
  }
  int score;

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
          Expanded(child: Container()),
          const Text(
            "You have completed",
            style: TextStyle(fontSize: 25),
          ),
          Text("$score",
              style: const TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              )),
          const Text("correct answers!", style: TextStyle(fontSize: 25)),
          Expanded(
              child: TextButton.icon(
                  onPressed: () {
                    Share.share("I have completed $score correct answers!");
                  },
                  icon: const Icon(
                    Icons.share_outlined,
                    color: Colors.black,
                  ),
                  label: const Text("Share",
                      style: TextStyle(color: Colors.black, fontSize: 20)))),
        ],
      ),
    );
  }
}
