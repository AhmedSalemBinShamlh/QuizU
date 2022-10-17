import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quizu/main.dart';

//URLs
const String loginURL = "https://quizu.okoul.com/Login";
const String nameURL = "https://quizu.okoul.com/Name";
const String tokenURL = "https://quizu.okoul.com/Token";
const String topScoresURL = "https://quizu.okoul.com/TopScores";
const String userInfoURL = "https://quizu.okoul.com/UserInfo";
const String questionURL = "https://quizu.okoul.com/Questions";
const String myScoreURL = "https://quizu.okoul.com/Score";

//Functions
Future<bool> tokenVerification() async {
  String token = sharedPref.getString("token")!;
  var headers = {
    'Authorization': token,
    'Content-Type': 'application/x-www-form-urlencoded'
  };
  var request = http.Request('GET', Uri.parse('https://quizu.okoul.com/Token'));
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    // print(await response.stream.bytesToString());
    return jsonDecode(await response.stream.bytesToString())["success"];
  } else {
    // print(response.reasonPhrase);
    return false;
  }
}

Future<dynamic> login({required String mobile, required String otp}) async {
  var request = await http.post(Uri.parse('https://quizu.okoul.com/Login'),
      body: {"OTP": "$otp", "mobile": "$mobile"});
  // request.body = '''{\n    "OTP":"0000",\n    "mobile":"05987654321"\n}''';

  // http.StreamedResponse response = await request.send();

  if (request.statusCode == 201) {
    print(request.body);
    Map login = jsonDecode(request.body);
    sharedPref.setString("token", login["token"]);
    return login;
  } else {
    print(request.reasonPhrase);
  }
}

Future<void> postingTheNewUserName(String name) async {
  String token = sharedPref.getString("token")!;
  var headers = {
    'Authorization': token,
    'Content-Type': 'application/x-www-form-urlencoded'
  };
  var request = await http.post(Uri.parse('https://quizu.okoul.com/Name'),
      body: {"name": "$name"}, headers: headers);
  // request.body = '''{\n    "name":"Okoul"\n}''';
  // request.headers.addAll(headers);

  // http.StreamedResponse response = await request.send();

  if (request.statusCode == 200) {
    print(request.body);
  } else {
    print(request.reasonPhrase);
  }
}

Future<dynamic> top10Scores() async {
  String token = sharedPref.getString("token")!;
  var headers = {'Authorization': token};
  var request =
      http.Request('GET', Uri.parse('https://quizu.okoul.com/TopScores'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    // print(await response.stream.bytesToString());
    return jsonDecode(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}

Future<dynamic> gettingUserInfo() async {
  String token = sharedPref.getString("token")!;
  var headers = {'Authorization': token};
  var request =
      http.Request('GET', Uri.parse('https://quizu.okoul.com/UserInfo'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    // print(await response.stream.bytesToString());
    return jsonDecode(await response.stream.bytesToString());
    ;
  } else {
    print(response.reasonPhrase);
  }
}

Future<dynamic> gettingQuestions() async {
  String token = sharedPref.getString("token")!;
  var headers = {'Authorization': token};
  var request =
      http.Request('GET', Uri.parse('https://quizu.okoul.com/Questions'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    // print(await response.stream.bytesToString());
    return jsonDecode(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}

void userScore(int score) async {
  String token = sharedPref.getString("token")!;
  var headers = {
    'Authorization': token,
    'Content-Type': 'application/x-www-form-urlencoded'
  };
  var request = await http.post(Uri.parse('https://quizu.okoul.com/Score'),
      body: {"score": "$score"}, headers: headers);
  // request.body = '''{\n    "score":"11"\n}''';

  // http.StreamedResponse response = await request.send();

  if (request.statusCode == 200) {
    print(request.body);
  } else {
    print(request.reasonPhrase);
  }
}
