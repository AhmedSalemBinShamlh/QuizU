import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/login_pages/name_page.dart';
import 'helper/api.dart';
import 'screens/home_page.dart';
import 'screens/login_pages/phone_page.dart';
import 'screens/profile_page.dart';
import 'screens/questions_pages/quiz_page.dart';
import 'screens/score_page.dart';

late SharedPreferences sharedPref;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPref = await SharedPreferences.getInstance();
  bool validToken = false;
  if (sharedPref.getString("token") != null) {
    validToken = await tokenVerification();
  }
  runApp(QuizUApp(validToken: validToken));
}

class QuizUApp extends StatelessWidget {
  QuizUApp({Key? key, this.validToken = false}) : super(key: key);
  bool validToken;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ahmed Flutter Quize Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      // home: const LoginScreen(),
      initialRoute: sharedPref.getString("token") != null && validToken == true
          ? HomeScreen.routeName
          : PhoneNumberScreen.routeName,
      routes: {
        PhoneNumberScreen.routeName: (context) => PhoneNumberScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        NameScreen.routeName: (context) => const NameScreen(),
        ProfileScreen.routeName: (context) => const ProfileScreen(),
        QuizScreen.routeName: (context) => const QuizScreen(),
        ScoreScreen.routeName: (context) => const ScoreScreen(),
      },
    );
  }
}
