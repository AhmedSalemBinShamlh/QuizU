import 'dart:convert';

import 'package:flutter/material.dart';

import '/helper/db_helper.dart';
import '/main.dart';
import '/screens/login_pages/phone_page.dart';
import '/component/user_info.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const String routeName = "profile";

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
                onPressed: () {
                  sharedPref.clear();
                  DBHelper.delete();
                  Navigator.pushNamedAndRemoveUntil(
                      context, PhoneNumberScreen.routeName, (route) => false);
                },
                icon: const Icon(Icons.logout_rounded))
          ],
        ),
        const Text(
          "Profile",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        const UserInfo(),
        const SizedBox(
          height: 40,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 18.0),
          child: Divider(),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: Text(
            "My Scores",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        Expanded(
          child: FutureBuilder(
              future: DBHelper.getData(),
              builder: ((BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) =>
                          ListTile(
                        title: Text(snapshot.data[index]["date"]),
                        trailing:
                            Text(snapshot.data[index]["score"].toString()),
                      ),
                    ),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              })),
        ),
      ],
    );
  }
}
