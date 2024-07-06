import 'package:flutter/material.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:plaktago/game/bingo.dart';
import 'package:plaktago/data_class/game.dart';
import 'package:plaktago/utils/get_icon.dart';
import 'package:plaktago/utils/isar_service.dart';
import 'game_stats.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GameTileCard extends StatefulWidget {
  final Game game;
  final int index;
  final Function getStat;
  final Function updateState;
  final GlobalKey<ExpansionTileCardState> cardKey;
  final IsarService isarService;
  final Function getGames;
  final bool displayTimer;
  GameTileCard(
      {Key? key,
      required this.game,
      required this.index,
      required this.getStat,
      required this.updateState,
      required this.cardKey,
      required this.isarService,
      required this.getGames,
      required this.displayTimer})
      : super(key: key);

  @override
  State<GameTileCard> createState() => _GameTileCard();
}

class _GameTileCard extends State<GameTileCard> {
  bool isExpanded = false;
  int sizeRatio = 1;

  void goToGameStats() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => GameStats(
                  game: widget.game,
                  isarService: widget.isarService,
                  displayTimer: widget.displayTimer,
                ))).then((value) {
      setState(() {
        widget.getStat();
      });
    });
  }

  Icon getTraillingIcon() {
    if (isExpanded) {
      return Icon(
        Icons.keyboard_arrow_up,
        color: Theme.of(context).colorScheme.primary,
      );
    }
    return Icon(
      Icons.keyboard_arrow_down,
      color: Theme.of(context).colorScheme.primary,
    );
  }

  // void setGame() {
  //   widget.game.updateGame = true;
  //   Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //           builder: (context) => Bingo(
  //                 bingoParams: widget.game,
  //                 newGame: false,
  //                 isarService: widget.isarService,
  //                 id: widget.game.id,
  //                 displayTimer: widget.displayTimer,
  //               ))).then((value) {
  //     setState(() {
  //       widget.getStat();
  //     });
  //   });
  // }

  // void comeBackToGame() {
  //   if (widget.game.isPlaying) {
  //     AwesomeDialog(
  //       context: context,
  //       animType: AnimType.scale,
  //       dialogType: DialogType.warning,
  //       headerAnimationLoop: false,
  //       dialogBackgroundColor: Colors.grey[50],
  //       title: 'Partie en cours',
  //       titleTextStyle:
  //           TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
  //       desc:
  //           'Vous avez déja une partie en cours, êtes vous sur de vouloir la supprimer ?',
  //       descTextStyle: TextStyle(color: Colors.black),
  //       btnOkOnPress: setGame,
  //       btnCancelText: "Annuler",
  //       btnCancelOnPress: () => {},
  //     ).show();
  //   } else {
  //     setGame();
  //   }
  // }

  void setGameToFavorite() {
    widget.game.favorite = !widget.game.favorite;
    setState(() {
      widget.isarService.updateGame(widget.game);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width > 700) {
      sizeRatio = 2;
    }
    Widget icon = getIcon(widget.game.bingoType);
    return Align(
        child: SizedBox(
            width: MediaQuery.of(context).size.width / sizeRatio,
            child: ExpansionTileCard(
              key: widget.cardKey,
              onExpansionChanged: (status) => {
                setState(() {
                  widget.updateState(widget.index, status);
                  isExpanded = status;
                })
              },
              shadowColor: Colors.black,
              title: DefaultTextStyle(
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                  child: Row(children: [
                    Row(children: [
                      Text(widget.game.gameNumber.toString()),
                      Container(margin: EdgeInsets.only(left: 20)),
                    ]),
                    icon,
                    SizedBox(width: 15),
                    if (MediaQuery.of(context).size.width > 370)
                      Text(widget.game.bingoType.name),
                    Spacer(),
                    Row(children: [
                      Text(widget.game.date),
                      Container(
                          margin: EdgeInsets.only(left: 10),
                          child: IconButton(
                              onPressed: setGameToFavorite,
                              icon: Icon(
                                widget.game.favorite
                                    ? FontAwesomeIcons.solidHeart
                                    : FontAwesomeIcons.heart,
                                color: Color.fromRGBO(242, 48, 48, 1),
                              )))
                    ]),
                  ])),
              trailing: getTraillingIcon(),
              expandedColor: Color.fromRGBO(57, 65, 89, 1),
              baseColor: Theme.of(context).colorScheme.surface,
              expandedTextColor: Colors.black,
              initialPadding: EdgeInsets.only(bottom: 10, left: 20, right: 20),
              finalPadding: EdgeInsets.only(bottom: 10, left: 20, right: 20),
              initialElevation: 2.0,
              elevation: 4.0,
              children: [
                DefaultTextStyle(
                    style: TextStyle(fontSize: 16, color: Colors.white),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              width:
                                  (MediaQuery.of(context).size.width - 60) / 3,
                              child: Column(children: [
                                Text("Heure"),
                                SizedBox(height: 10),
                                Text(widget.game.hour.toString(),
                                    style: TextStyle(fontSize: 20)),
                              ])),
                          SizedBox(
                              width:
                                  (MediaQuery.of(context).size.width - 60) / 3,
                              child: Column(children: [
                                Text("Points"),
                                SizedBox(height: 10),
                                Text(widget.game.points.toString(),
                                    style: TextStyle(fontSize: 20)),
                              ])),
                          if (widget.displayTimer)
                            SizedBox(
                                width:
                                    (MediaQuery.of(context).size.width - 60) /
                                        3,
                                child: Column(children: [
                                  Text("Durée"),
                                  SizedBox(height: 10),
                                  Text(widget.game.time.toString(),
                                      style: TextStyle(fontSize: 20)),
                                ])),
                        ])),
                SizedBox(height: 10),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Align(
                      child: Container(
                          height: 35,
                          width: 120,
                          margin:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                          child: FloatingActionButton.extended(
                            onPressed: goToGameStats,
                            elevation: 0.5,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 0,
                                    color:
                                        Theme.of(context).colorScheme.surface),
                                borderRadius: BorderRadius.circular(10)),
                            backgroundColor:
                                Theme.of(context).colorScheme.surface,
                            splashColor: Theme.of(context).colorScheme.primary,
                            label: Text("Revoir la partie",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).colorScheme.primary,
                                )),
                          ))),
                  // Align(
                  //     child: Container(
                  //         height: 30,
                  //         width: 140,
                  //         margin: EdgeInsets.symmetric(
                  //             vertical: 10, horizontal: 15),
                  //         child: FloatingActionButton.extended(
                  //           onPressed: comeBackToGame,
                  //           elevation: 0.5,
                  //           backgroundColor: Color.fromRGBO(152, 148, 224, 0.8),
                  //           splashColor: Theme.of(context).colorScheme.primary,
                  //           label: Text("Reprendre la partie",
                  //               style: TextStyle(
                  //                   fontSize: 14,
                  //                   color: Colors.black,
                  //                   fontWeight: FontWeight.w600)),
                  //         ))),
                ])
              ],
            )));
  }
}
