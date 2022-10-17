import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  ActionButton({Key? key, required this.label, required this.onPressed})
      : super(key: key);
  String label;
  Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        textColor: Colors.black,
        color: Colors.grey.shade300,
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            label,
            style: const TextStyle(fontSize: 20, color: Colors.black54),
            textAlign: TextAlign.center,
          ),
        ));
  }
}
