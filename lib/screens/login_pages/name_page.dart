import 'package:flutter/material.dart';

import '/helper/api.dart';
import '/../component/action_button.dart';
import '../home_page.dart';

class NameScreen extends StatefulWidget {
  const NameScreen({Key? key}) : super(key: key);
  static const String routeName = "name";

  @override
  State<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  GlobalKey<FormState> formkey = GlobalKey();
  final TextEditingController ctrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Flexible(
              flex: 2,
              child: Text(
                "QuizU",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 50),
              )),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Text(
              "What’s your name?",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            child: Form(
              key: formkey,
              child: TextFormField(
                keyboardType: TextInputType.name,
                validator: ((value) =>
                    value!.isNotEmpty ? null : "this filed must be not empty"),
                controller: ctrl,
                autocorrect: false,
                enableSuggestions: false,
                autofocus: true,
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 1.0,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 1.0,
                    ),
                  ),
                  labelText: 'Name',
                  labelStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                  helperText: '',
                ),
              ),
            ),
          ),
          ActionButton(
            onPressed: () async {
              if (formkey.currentState!.validate()) {
                await postingTheNewUserName(ctrl.text);
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  HomeScreen.routeName,
                  (route) => false,
                );
              }
            },
            label: "Done",
          ),
          Flexible(child: Container()),
        ],
      ),
    );
  }
}
