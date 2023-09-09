import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:plaktago/game/game_data.dart';
import 'package:plaktago/statistic/statistic_button.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'dart:convert';
import 'general_statistics.dart';
import 'game_stats.dart';
import 'game_list.dart';
import 'package:plaktago/utils/read_file.dart';

class Statistic extends StatefulWidget {
  const Statistic({Key? key}) : super(key: key);

  @override
  State<Statistic> createState() => _Statistic();
}

class _Statistic extends State<Statistic> {
  var _bingoGames = [];
  //Map<String, dynamic> _general = {};
  StatType statType = StatType.general;
  int expandedIndex = -1;
  List<GlobalKey<ExpansionTileCardState>> cardList = [];
  ReadFile readFile = ReadFile();

  @override
  void initState() {
    test();
    super.initState();
  }

  Future<void> test() async {
    final data = jsonDecode(await readFile.readStats());
    //_general = {}; //await getGeneralStatistics();
    // final Map<String, dynamic> data1 = {
    //   "general": {
    //     "nbGames": 3,
    //     "bingoPlaque": 2,
    //     "bingoKta": 1,
    //     "bingoWin": 0,
    //     "cardList": [
    //       {"cardName": "Bus", "nbPlayed": 2, "nbCheck": 0},
    //       {"cardName": "Kta star", "nbPlayed": 3, "nbCheck": 1},
    //       {"cardName": "Copain", "nbPlayed": 2, "nbCheck": 0},
    //       {"cardName": "Lampe allumée", "nbPlayed": 1, "nbCheck": 0},
    //       {"cardName": "Touristes", "nbPlayed": 2, "nbCheck": 0},
    //       {
    //         "cardName": "Regarde mais s'arrête pas",
    //         "nbPlayed": 0,
    //         "nbCheck": 0
    //       },
    //       {"cardName": "Police", "nbPlayed": 1, "nbCheck": 1},
    //       {
    //         "cardName": "Fermeture de plaque hasardeuse",
    //         "nbPlayed": 2,
    //         "nbCheck": 1
    //       },
    //       {"cardName": "Claque la plaque", "nbPlayed": 0, "nbCheck": 0},
    //       {"cardName": "Solitaire", "nbPlayed": 3, "nbCheck": 1},
    //       {"cardName": "Arrive pas à ouvrir", "nbPlayed": 1, "nbCheck": 1},
    //       {"cardName": "Galère à cause du sac", "nbPlayed": 3, "nbCheck": 1},
    //       {
    //         "cardName": "Reste à côté de la plaque",
    //         "nbPlayed": 2,
    //         "nbCheck": 0
    //       },
    //       {"cardName": "Fil d'attente", "nbPlayed": 2, "nbCheck": 2},
    //       {
    //         "cardName": "Tir sur la mauvaise plaque",
    //         "nbPlayed": 2,
    //         "nbCheck": 1
    //       },
    //       {
    //         "cardName": "Random qui s'arrête regarder",
    //         "nbPlayed": 0,
    //         "nbCheck": 0
    //       },
    //       {"cardName": "tier", "nbPlayed": 1, "nbCheck": 0},
    //       {"cardName": "Tir plaque original", "nbPlayed": 2, "nbCheck": 2},
    //       {"cardName": "Couple / Duo", "nbPlayed": 2, "nbCheck": 1},
    //       {"cardName": "Attend un pote", "nbPlayed": 2, "nbCheck": 1},
    //       {"cardName": "Laisse la plaque ouverte", "nbPlayed": 1, "nbCheck": 0},
    //       {
    //         "cardName": "Plaque ouverte +1min / pers",
    //         "nbPlayed": 1,
    //         "nbCheck": 0
    //       },
    //       {"cardName": "Trop propre", "nbPlayed": 3, "nbCheck": 2},
    //       {"cardName": "Discute à coté", "nbPlayed": 0, "nbCheck": 0},
    //       {"cardName": "Discute plaque ouverte", "nbPlayed": 2, "nbCheck": 0},
    //       {"cardName": "Fusion de groupe", "nbPlayed": 2, "nbCheck": 2},
    //       {"cardName": "Tous dans la même tenue", "nbPlayed": 1, "nbCheck": 0},
    //       {"cardName": "Fumi", "nbPlayed": 1, "nbCheck": 0},
    //       {"cardName": "Perdu", "nbPlayed": 1, "nbCheck": 0},
    //       {"cardName": "Chantier", "nbPlayed": 1, "nbCheck": 0},
    //       {"cardName": "Traquenard", "nbPlayed": 1, "nbCheck": 1},
    //       {"cardName": "Hamac", "nbPlayed": 1, "nbCheck": 0}
    //     ]
    //   },
    //   "games": [
    //     {
    //       "gameNumber": 1,
    //       "points": 8,
    //       "gameType": "Plaque",
    //       "date": "09 août 2023",
    //       "hour": "20:13",
    //       "time": "00:00:04",
    //       "bingoCardList": [
    //         {"name": "Fil d'attente", "isSelect": true, "nbLineComplete": 1},
    //         {"name": "Kta star", "isSelect": false, "nbLineComplete": 0},
    //         {"name": "Attend un pote", "isSelect": false, "nbLineComplete": 0},
    //         {"name": "Solitaire", "isSelect": false, "nbLineComplete": 0},
    //         {
    //           "name": "Reste à côté de la plaque",
    //           "isSelect": false,
    //           "nbLineComplete": 0
    //         },
    //         {
    //           "name": "Tir plaque original",
    //           "isSelect": true,
    //           "nbLineComplete": 1
    //         },
    //         {"name": "Bus", "isSelect": false, "nbLineComplete": 0},
    //         {"name": "Lampe allumée", "isSelect": false, "nbLineComplete": 0},
    //         {
    //           "name": "Galère à cause du sac",
    //           "isSelect": false,
    //           "nbLineComplete": 0
    //         },
    //         {
    //           "name": "Discute plaque ouverte",
    //           "isSelect": false,
    //           "nbLineComplete": 0
    //         },
    //         {"name": "Trop propre", "isSelect": true, "nbLineComplete": 1},
    //         {"name": "Fifi tier", "isSelect": false, "nbLineComplete": 0},
    //         {
    //           "name": "Fermeture de plaque hasardeuse",
    //           "isSelect": false,
    //           "nbLineComplete": 0
    //         },
    //         {"name": "Copain", "isSelect": false, "nbLineComplete": 0},
    //         {"name": "Touristes", "isSelect": false, "nbLineComplete": 0},
    //         {
    //           "name": "Tir sur la mauvaise plaque",
    //           "isSelect": true,
    //           "nbLineComplete": 1
    //         }
    //       ]
    //     }
    //   ]
    // };
    setState(() {
      //_general = data["general"];
      _bingoGames = data["games"];
      _bingoGames = _bingoGames.reversed.toList();
      for (int it = 0; it < _bingoGames.length; it++) {
        cardList.add(GlobalKey());
      }
    });
  }

  Future<Map<String, dynamic>> getGeneralStatistics() async {
    // final Map<String, dynamic> data1 = {
    //   "general": {
    //     "nbGames": 3,
    //     "bingoPlaque": 2,
    //     "bingoKta": 1,
    //     "bingoWin": 0,
    //     "cardList": [
    //       {"cardName": "Bus", "nbPlayed": 2, "nbCheck": 0},
    //       {"cardName": "Kta star", "nbPlayed": 3, "nbCheck": 1},
    //       {"cardName": "Copain", "nbPlayed": 2, "nbCheck": 0},
    //       {"cardName": "Lampe allumée", "nbPlayed": 1, "nbCheck": 0},
    //       {"cardName": "Touristes", "nbPlayed": 2, "nbCheck": 0},
    //       {
    //         "cardName": "Regarde mais s'arrête pas",
    //         "nbPlayed": 0,
    //         "nbCheck": 0
    //       },
    //       {"cardName": "Police", "nbPlayed": 1, "nbCheck": 1},
    //       {
    //         "cardName": "Fermeture de plaque hasardeuse",
    //         "nbPlayed": 2,
    //         "nbCheck": 1
    //       },
    //       {"cardName": "Claque la plaque", "nbPlayed": 0, "nbCheck": 0},
    //       {"cardName": "Solitaire", "nbPlayed": 3, "nbCheck": 1},
    //       {"cardName": "Arrive pas à ouvrir", "nbPlayed": 1, "nbCheck": 1},
    //       {"cardName": "Galère à cause du sac", "nbPlayed": 3, "nbCheck": 1},
    //       {
    //         "cardName": "Reste à côté de la plaque",
    //         "nbPlayed": 2,
    //         "nbCheck": 0
    //       },
    //       {"cardName": "Fil d'attente", "nbPlayed": 2, "nbCheck": 2},
    //       {
    //         "cardName": "Tir sur la mauvaise plaque",
    //         "nbPlayed": 2,
    //         "nbCheck": 1
    //       },
    //       {
    //         "cardName": "Random qui s'arrête regarder",
    //         "nbPlayed": 0,
    //         "nbCheck": 0
    //       },
    //       {"cardName": "tier", "nbPlayed": 1, "nbCheck": 0},
    //       {"cardName": "Tir plaque original", "nbPlayed": 2, "nbCheck": 2},
    //       {"cardName": "Couple / Duo", "nbPlayed": 2, "nbCheck": 1},
    //       {"cardName": "Attend un pote", "nbPlayed": 2, "nbCheck": 1},
    //       {"cardName": "Laisse la plaque ouverte", "nbPlayed": 1, "nbCheck": 0},
    //       {
    //         "cardName": "Plaque ouverte +1min / pers",
    //         "nbPlayed": 1,
    //         "nbCheck": 0
    //       },
    //       {"cardName": "Trop propre", "nbPlayed": 3, "nbCheck": 2},
    //       {"cardName": "Discute à coté", "nbPlayed": 0, "nbCheck": 0},
    //       {"cardName": "Discute plaque ouverte", "nbPlayed": 2, "nbCheck": 0},
    //       {"cardName": "Fusion de groupe", "nbPlayed": 2, "nbCheck": 2},
    //       {"cardName": "Tous dans la même tenue", "nbPlayed": 1, "nbCheck": 0},
    //       {"cardName": "Fumi", "nbPlayed": 1, "nbCheck": 0},
    //       {"cardName": "Perdu", "nbPlayed": 1, "nbCheck": 0},
    //       {"cardName": "Chantier", "nbPlayed": 1, "nbCheck": 0},
    //       {"cardName": "Traquenard", "nbPlayed": 1, "nbCheck": 1},
    //       {"cardName": "Hamac", "nbPlayed": 1, "nbCheck": 0}
    //     ]
    //   }
    // }; //jsonDecode(await readGames());
    final data = jsonDecode(await readFile.readStats());
    return data["general"];
  }

  Color getCardColor(final String gameType) {
    if (gameType == "Plaque") return Theme.of(context).colorScheme.primary;
    if (gameType == "Exploration") return Colors.green;
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

  void updateState(final int index, final bool status) {
    setState(() {
      if (status) {
        if (expandedIndex != -1) {
          cardList[expandedIndex].currentState?.collapse();
        }
        cardList[index].currentState?.expand();
        expandedIndex = index;
      } else {
        cardList[index].currentState?.collapse();
        expandedIndex = -1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Statistiques")),
        body: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView(children: [
              Container(
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                  child: StatTypeButton(
                      statType: statType, updateStatType: updateStatType)),
              if (statType == StatType.general)
                GeneralStatistic(
                  statistics: getGeneralStatistics,
                ),
              if (statType == StatType.list)
                _bingoGames.isNotEmpty
                    ? SingleChildScrollView(
                        child: Container(
                            margin: EdgeInsets.symmetric(vertical: 20),
                            height: MediaQuery.of(context).size.height,
                            child: ListView.builder(
                                controller:
                                    ScrollController(keepScrollOffset: false),
                                itemCount: _bingoGames.length,
                                itemBuilder: (context, index) {
                                  final String points =
                                      _bingoGames[index]["points"].toString();
                                  final String gameType =
                                      _bingoGames[index]["gameType"];
                                  final String date =
                                      _bingoGames[index]["date"];
                                  final String hour =
                                      _bingoGames[index]["hour"];
                                  final String time =
                                      _bingoGames[index]["time"];
                                  final String gameNumber = _bingoGames[index]
                                          ["gameNumber"]
                                      .toString();
                                  return Consumer<GameData>(
                                      builder: (context, provider, child) {
                                    GameData gameData =
                                        context.watch<GameData>();
                                    return GameList(
                                        points: points,
                                        gameType: gameType,
                                        date: date,
                                        hour: hour,
                                        time: time,
                                        gameNumber: gameNumber,
                                        index: index,
                                        board: _bingoGames[index],
                                        gameData: gameData,
                                        getStat: test,
                                        updateState: updateState,
                                        cardKey: cardList[index]);
                                  });
                                })))
                    : Container()
            ])));
  }
}
