import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import '../utils/saveGame.dart';
import 'dart:async';
import 'dart:io';
import 'dart:convert';

class Statistic extends StatefulWidget {
  //final SaveGame readGame;
  const Statistic({Key? key}) : super(key: key);

  @override
  State<Statistic> createState() => _Statistic();
}

class _Statistic extends State<Statistic> {
  //static Future<String> _gamesNumber = Future.value("");
  var _bingoGames = [];
  static Map<String, dynamic> _general = {};

  @override
  void initState() {
    super.initState();
    test();
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/gamesSave.json');
  }

  Future<String> readGames() async {
    try {
      final file = await _localFile;
      final contents = await file.readAsString();

      return contents;
    } catch (e) {
      return "";
    }
  }

  Future<void> test() async {
    //final data = await readGames();
    final data = jsonDecode(await readGames());
    setState(() {
      _general = data["general"];
      _bingoGames = data["games"];
    });
  }

  Color getCardColor(final String gameType) {
    if (gameType == "Plaque") return Theme.of(context).colorScheme.primary;
    return Theme.of(context).colorScheme.secondary;
  }

  @override
  Widget build(BuildContext context) {
    final String nbGames = _general["nbGames"].toString();
    return Scaffold(
        appBar: AppBar(title: Text("Statistique")),
        body: Column(children: [
          Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Text("Nombre de partie joué : $nbGames")),
          _bingoGames.isNotEmpty
              ? Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  height: 500,
                  child: ListView.builder(
                    itemCount: _bingoGames.length,
                    itemBuilder: (context, index) {
                      final String points =
                          _bingoGames[index]["points"].toString();
                      final String gameType = _bingoGames[index]["gameType"];
                      final String date = _bingoGames[index]["date"];
                      final String hour = _bingoGames[index]["hour"];
                      final String gameNumber =
                          _bingoGames[index]["gameNumber"].toString();
                      return GestureDetector(
                          onTap: () => {print("Click")},
                          child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              height: 120,
                              child: Card(
                                  key: ValueKey(
                                      _bingoGames[index]["gameNumber"]),
                                  margin: const EdgeInsets.all(5),
                                  color: getCardColor(gameType),
                                  elevation: 2,
                                  child: Column(children: [
                                    Text("Bingo $gameType",
                                        style: TextStyle(color: Colors.black)),
                                    Text("Points: $points",
                                        style: TextStyle(color: Colors.black)),
                                    Text("Date : $date",
                                        style: TextStyle(color: Colors.black)),
                                    Text("Heure : $hour",
                                        style: TextStyle(color: Colors.black)),
                                    Text("Partie numéro : $gameNumber",
                                        style: TextStyle(color: Colors.black))
                                  ]))));
                    },
                  ))
              : Container()
        ]));
  }
}
