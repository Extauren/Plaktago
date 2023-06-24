import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  final Function changeTheme;
  const Settings({Key? key, required this.changeTheme}) : super(key: key);

  @override
  State<Settings> createState() => _Settings();
}

class _Settings extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: []);
  }
}
