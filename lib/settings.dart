import 'package:flutter/material.dart';
import 'home/drawer.dart';

class Settings extends StatefulWidget {
  final Function changeTheme;
  const Settings({Key? key, required this.changeTheme}) : super(key: key);

  @override
  State<Settings> createState() => _Settings();
}

enum BingoType {
  plaque('Plaque'),
  sousterre('Sous terrain');

  const BingoType(this.name);
  final String name;
}

class _Settings extends State<Settings> {
  String _bingoTypeName = BingoType.plaque.name;
  BingoType? _bingoType = BingoType.plaque;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Row(children: [])));
  }
}
