import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:plaktago/game/bingo.dart';
import 'package:plaktago/home/bingo_type_button.dart';
import 'package:plaktago/utils/game/game.dart';
import 'package:plaktago/utils/isar_service.dart';
import 'game_stats.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GameStat extends StatefulWidget {
  final Game game;
  final int index;
  Function getStat;
  Function updateState;
  final GlobalKey<ExpansionTileCardState> cardKey;
  final IsarService isarService;
  GameStat({
    Key? key,
    required this.game,
    required this.index,
    required this.getStat,
    required this.updateState,
    required this.cardKey,
    required this.isarService,
  }) : super(key: key);

  @override
  State<GameStat> createState() => _GameStat();
}

class _GameStat extends State<GameStat> {
  bool isExpanded = false;
  int sizeRatio = 1;

  void goToGameStats() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => GameStats(
                  game: widget.game,
                  isarService: widget.isarService,
                ))).then((value) {
      setState(() {});
    });
  }

  Icon getTraillingIcon() {
    if (!isExpanded) {
      return Icon(
        Icons.keyboard_arrow_up,
        color: Colors.black,
      );
    }
    return Icon(
      Icons.keyboard_arrow_down,
      color: Colors.black,
    );
  }

  void setGame() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Bingo(
                bingoParams: widget.game,
                newGame: false,
                isarService: widget.isarService,
                personalizeCards: [],
                id: widget.game.id))).then((value) {
      setState(() {
        widget.getStat();
      });
    });
  }

  void comeBackToGame() {
    if (widget.game.isPlaying) {
      AwesomeDialog(
        context: context,
        animType: AnimType.scale,
        dialogType: DialogType.warning,
        headerAnimationLoop: false,
        dialogBackgroundColor: Colors.grey[300],
        title: 'Partie en cours',
        titleTextStyle:
            TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        desc:
            'Vous avez déja une partie en cours, êtes vous sur de vouloir la supprimer ?',
        descTextStyle: TextStyle(color: Colors.black),
        btnOkOnPress: setGame,
        btnCancelText: "Annuler",
        btnCancelOnPress: () => {},
      ).show();
    } else {
      setGame();
    }
  }

  Widget getIcon() {
    if (widget.game.points.toString() == "56") {
      return Container(
          margin: EdgeInsets.only(right: 20),
          child: Icon(
            FontAwesomeIcons.crown,
            color: Colors.yellow,
            size: 20.0,
          ));
    } else {
      if (widget.game.bingoType == BingoType.kta) {
        return Container(
            margin: EdgeInsets.only(right: 20),
            child: Icon(
              FontAwesomeIcons.dungeon,
              color: Colors.black,
              size: 20.0,
            ));
      }
      if (widget.game.bingoType == BingoType.exploration) {
        return Container(
            margin: EdgeInsets.only(right: 20),
            child: Icon(
              FontAwesomeIcons.personWalking,
              color: Colors.black,
              size: 20.0,
            ));
      }
      if (widget.game.bingoType == BingoType.plaque) {
        return Container(
            margin: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.aspect_ratio,
              color: Colors.black,
              size: 20.0,
            ));
      }
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width > 700) {
      sizeRatio = 2;
    }
    Widget icon = getIcon();
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
              title: DefaultTextStyle(
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                  child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Text(widget.game.gameNumber.toString()),
                          Container(margin: EdgeInsets.only(left: 20)),
                        ]),
                        icon,
                        Text(widget.game.bingoType.name),
                        Spacer(),
                        Row(children: [
                          Text(widget.game.date),
                          Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Icon(
                                widget.game.favorite
                                    ? FontAwesomeIcons.heartCircleCheck
                                    : FontAwesomeIcons.heart,
                                color: Colors.red,
                              ))
                        ]),
                      ])),
              trailing: getTraillingIcon(),
              expandedColor: Colors.indigo[50], //Colors.grey[300],
              baseColor: Colors.indigo[100], //getBackgroundColor(),
              expandedTextColor: Colors.black,
              initialPadding: EdgeInsets.only(bottom: 10, left: 20, right: 20),
              finalPadding: EdgeInsets.only(bottom: 10, left: 20, right: 20),
              initialElevation: 2.0,
              elevation: 4.0,
              children: [
                DefaultTextStyle(
                    style: TextStyle(fontSize: 16, color: Colors.black),
                    child: Column(children: [
                      Text("Points : ${widget.game.points}"),
                      SizedBox(height: 5),
                      Text("Heure : ${widget.game.hour}"),
                      SizedBox(height: 5),
                      Text("Durée : ${widget.game.time}"),
                      SizedBox(height: 10)
                    ])),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                      height: 30.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                Theme.of(context).colorScheme.primary),
                          ),
                          onPressed: goToGameStats,
                          child: Text(
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                              "Revoir la partie"))),
                  Container(
                      height: 30.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                Theme.of(context).colorScheme.primary),
                          ),
                          onPressed: comeBackToGame,
                          child: Text(
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                              "Reprendre la partie")))
                ])
              ],
            )));
  }
}
