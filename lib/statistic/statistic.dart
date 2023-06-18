import 'package:flutter/material.dart';
import '../utils/saveGame.dart';

class Statistic extends StatefulWidget {
  final SaveGame readGame;
  const Statistic({Key? key, required this.readGame}) : super(key: key);

  @override
  State<Statistic> createState() => _Statistic();
}

class _Statistic extends State<Statistic> {
  static int gamesNumber = 0;

  @override
  void initState() {
    super.initState();
    _getGamesNumber();
  }

  void _getGamesNumber() async {
    gamesNumber = await widget.readGame.readGames();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(children: [
      Container(
          margin: const EdgeInsets.only(top: 80.0),
          child: Text("Nombre de partie jouées : $gamesNumber",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              textAlign: TextAlign.center))
    ])));
  }
}
