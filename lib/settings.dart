import 'package:flutter/material.dart';
import 'game/timer/timer.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _Settings();
}

class _Settings extends State<Settings> {
  final items = ['One', 'Two', 'Three', 'Four'];
  String selectedValue = 'Four';

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar());
  }
}
