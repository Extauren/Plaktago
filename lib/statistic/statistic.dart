import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:plaktago/statistic/statistic_button.dart';
import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'general_statistics.dart';
import "gameStats.dart";
import 'game_list.dart';

class Statistic extends StatefulWidget {
  const Statistic({Key? key}) : super(key: key);

  @override
  State<Statistic> createState() => _Statistic();
}

class _Statistic extends State<Statistic> {
  var _bingoGames = [];
  Map<String, dynamic> _general = {};
  StatType statType = StatType.general;

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
      _bingoGames = _bingoGames.reversed.toList();
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

  void updateStatType() {
    setState(() {
      if (statType == StatType.general) {
        statType = StatType.list;
      } else {
        statType = StatType.general;
      }
    });
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
        body: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView(children: [
              Container(
                  margin: EdgeInsets.only(top: 30, bottom: 20),
                  child: StatTypeButton(
                      statType: statType, updateStatType: updateStatType)),
              if (statType == StatType.general)
                GeneralStatistic(
                  getGeneralStatistics: getGeneralStatistics,
                ),
              if (statType == StatType.list)
                _bingoGames.isNotEmpty
                    ? Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        height: 600,
                        child: ListView.builder(
                            itemCount: _bingoGames.length,
                            itemBuilder: (context, index) {
                              final String points =
                                  _bingoGames[index]["points"].toString();
                              final String gameType =
                                  _bingoGames[index]["gameType"];
                              final String date = _bingoGames[index]["date"];
                              final String hour = _bingoGames[index]["hour"];
                              final String time = _bingoGames[index]["time"];
                              final String gameNumber =
                                  _bingoGames[index]["gameNumber"].toString();
                              return GameList(
                                  points: points,
                                  gameType: gameType,
                                  date: date,
                                  hour: hour,
                                  time: time,
                                  gameNumber: gameNumber,
                                  index: index,
                                  board: _bingoGames[index]);
                            }))
                    : Container()
              //GameList()
              // _bingoGames.isNotEmpty
              //     ? Container(
              //         margin: EdgeInsets.symmetric(vertical: 20),
              //         height: 600,
              //         child: ListView.builder(
              //           itemCount: _bingoGames.length,
              //           itemBuilder: (context, index) {
              //             final String points =
              //                 _bingoGames[index]["points"].toString();
              //             final String gameType =
              //                 _bingoGames[index]["gameType"];
              //             final String date = _bingoGames[index]["date"];
              //             final String hour = _bingoGames[index]["hour"];
              //             final String time = _bingoGames[index]["time"];
              //             final String gameNumber =
              //                 _bingoGames[index]["gameNumber"].toString();
              //             return GestureDetector(
              //                 onTap: () => goToGameStats(index),
              //                 child: Container(
              //                     margin:
              //                         EdgeInsets.symmetric(horizontal: 30),
              //                     height: 130,
              //                     child: Card(
              //                         key: ValueKey(
              //                             _bingoGames[index]["gameNumber"]),
              //                         margin: const EdgeInsets.all(5),
              //                         color: getCardColor(gameType),
              //                         elevation: 2,
              //                         child: Column(children: [
              //                           Text("Bingo $gameType",
              //                               style: TextStyle(
              //                                   color: Colors.black)),
              //                           Text("Points: $points",
              //                               style: TextStyle(
              //                                   color: Colors.black)),
              //                           Text("Date : $date",
              //                               style: TextStyle(
              //                                   color: Colors.black)),
              //                           Text("Heure : $hour",
              //                               style: TextStyle(
              //                                   color: Colors.black)),
              //                           Text("Partie numéro : $gameNumber",
              //                               style: TextStyle(
              //                                   color: Colors.black)),
              //                           Text("Temps : $time",
              //                               style: TextStyle(
              //                                   color: Colors.black))
              //                         ]))));
              //           },
              //         ))
              //     : Container()
            ])));
  }
}
