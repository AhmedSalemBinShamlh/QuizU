import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '/component/action_button.dart';
import '/helper/api.dart';
import '/screens/login_pages/name_page.dart';
import '/screens/home_page.dart';

class OTPScreen extends StatefulWidget {
  OTPScreen({Key? key, required this.mobile}) : super(key: key);
  static const String routeName = "otp";
  String mobile;

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  GlobalKey<FormState> formkey = GlobalKey();
  final TextEditingController controller = TextEditingController();
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
              "Please enter the OTP sent to your mobile",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            child: Form(
              key: formkey,
              child: Pinput(
                controller: controller,
                validator: (value) {
                  return value == '0000' ? null : 'incorrect OTP';
                },
                onCompleted: (pin) async {},
              ),
            ),
          ),
          ActionButton(
            onPressed: () async {
              if (formkey.currentState!.validate()) {
                Map loginInfo =
                    await login(mobile: widget.mobile, otp: controller.text);
                if (loginInfo['user_status'] == "new" ||
                    loginInfo['name'] == null) {
                  Navigator.pushReplacementNamed(
                    context,
                    NameScreen.routeName,
                  );
                } else if (loginInfo['success'] == true) {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    HomeScreen.routeName,
                    (route) => false,
                  );
                }
              }
            },
            label: "Check",
          ),
          Flexible(child: Container()),
        ],
      ),
    );
  }
}
