import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  AnswerButton({Key? key, required this.label, required this.onPressed})
      : super(key: key);
  String label;
  Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 1.0,
            ),
          ),
          child: MaterialButton(
            onPressed: onPressed,
            minWidth: double.infinity,
            height: 60,
            child: Text(
              label,
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
