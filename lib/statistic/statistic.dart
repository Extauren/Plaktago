import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'general.dart';
import "gameStats.dart";

class Statistic extends StatefulWidget {
  const Statistic({Key? key}) : super(key: key);

  @override
  State<Statistic> createState() => _Statistic();
}

class _Statistic extends State<Statistic> {
  var _bingoGames = [];
  Map<String, dynamic> _general = {};

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
    final data = jsonDecode(await readGames());
    setState(() {
      _general = data["general"];
      _bingoGames = data["games"];
    });
  }

  Future<Map<String, dynamic>> getGeneralStatistics() async {
    final data = jsonDecode(await readGames());
    return data["general"];
  }

  Color getCardColor(final String gameType) {
    if (gameType == "Plaque") return Theme.of(context).colorScheme.primary;
    return Theme.of(context).colorScheme.secondary;
  }

  void goToGameStats(final int index) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => GameStats(
                  bingoStat: _bingoGames[index],
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Statistiques")),
        body: Column(children: [
          GeneralStatistic(
            getGeneralStatistics: getGeneralStatistics,
          ),
          Text("Listes des parties",
              style: Theme.of(context).textTheme.titleMedium),
          _bingoGames.isNotEmpty
              ? Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  height: 430,
                  child: ListView.builder(
                    itemCount: _bingoGames.length,
                    itemBuilder: (context, index) {
                      final String points =
                          _bingoGames[index]["points"].toString();
                      final String gameType = _bingoGames[index]["gameType"];
                      final String date = _bingoGames[index]["date"];
                      final String hour = _bingoGames[index]["hour"];
                      final String time = _bingoGames[index]["time"];
                      final String gameNumber =
                          _bingoGames[index]["gameNumber"].toString();
                      return GestureDetector(
                          onTap: () => goToGameStats(index),
                          child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 30),
                              height: 130,
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
                                        style: TextStyle(color: Colors.black)),
                                    Text("Temps : $time",
                                        style: TextStyle(color: Colors.black))
                                  ]))));
                    },
                  ))
              : Container()
        ]));
  }
}
