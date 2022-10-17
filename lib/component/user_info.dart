import "package:flutter/material.dart";
import 'package:quizu/helper/api.dart';

class UserInfo extends StatelessWidget {
  final IconData icon;
  const UserInfo({
    Key? key,
    this.icon = Icons.person,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: gettingUserInfo(),
        builder: ((BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return Column(
              children: [
                Text(
                  "Name: ${snapshot.data["name"]}",
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  "Phone: ${snapshot.data["mobile"]}",
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }));
  }
}
