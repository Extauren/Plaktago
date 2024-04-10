import 'package:flutter/material.dart';
import 'dart:async';
import 'package:isar/isar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plaktago/components/app_bar.dart';
import 'package:plaktago/components/dialog.dart';
import 'package:plaktago/game/timer/timer.dart';
import 'package:plaktago/home/bingo_type_button.dart';
import 'package:plaktago/home/mode_button.dart';
import 'package:plaktago/utils/get_icon.dart';
import 'package:plaktago/utils/isar_service.dart';
import 'package:plaktago/data_class/game.dart';
import 'board/board.dart';
import 'package:plaktago/game/board/card_name.dart';
import '../data_class/bingo_card.dart';
import 'dart:math';

class Bingo extends StatefulWidget {
  final Game bingoParams;
  final bool newGame;
  final IsarService isarService;
  final Id id;
  final bool displayTimer;
  Bingo({
    Key? key,
    required this.bingoParams,
    required this.newGame,
    required this.isarService,
    this.id = -1,
    required this.displayTimer,
  }) : super(key: key);

  @override
  State<Bingo> createState() => _Bingo();
}

class _Bingo extends State<Bingo> {
  int screenSizeRatio = 2;
  late BingoTimer timer;
  late Timer timer1;

  @override
  void initState() {
    super.initState();
    List<BingoCard> newBingoCards = [];

    widget.bingoParams.isPlaying = true;
    timer = BingoTimer(time: widget.bingoParams.time);
    if (widget.newGame) {
      widget.bingoParams.points = 0;
      if (widget.bingoParams.mode == Mode.random) {
        CardName card;
        List<CardName> cardList = <CardName>[];
        cardList = cardNameListPlaque
            .where((element) =>
                element.type.contains(widget.bingoParams.bingoType))
            .toList();
        for (int it = 0; it < 4 * 4; it++) {
          if (cardList.isEmpty &&
              widget.bingoParams.bingoType == BingoType.exploration) {
            cardList = cardNameListPlaque
                .where((element) => element.type.contains(BingoType.kta))
                .toList();
          }
          card = cardList.elementAt(Random().nextInt(cardList.length));
          cardList.remove(card);
          newBingoCards.add(BingoCard(
              name: card.name,
              icon: card.icon,
              alcoolRule: card.alcoolRule,
              nbShot: card.nbShot,
              desc: card.description));
        }
        newBingoCards.shuffle();
        widget.bingoParams.bingoCards = newBingoCards;
      }
    }
    _saveGame(false);
    timer1 = Timer.periodic(
      const Duration(
        seconds: 60,
      ),
      (t) => () => _saveGame(false),
    );
  }

  void askSaveGame() {
    PDialog(
            context: context,
            title: "Sauvegarder la partie",
            desc: "Voulez vous vraiment sauvegarder cette partie ?",
            bntOkOnPress: () => _saveGame(true))
        .show();
  }

  void _saveGame(final bool newGame) {
    int id = 0;

    if (newGame) {
    if (widget.newGame) {
      id = widget.id;
    } else {
      id = widget.bingoParams.gameNumber;
    }
    widget.isarService.saveGame(widget.bingoParams, id, newGame);
    Navigator.pop(context, true);
    } else {
    widget.isarService.saveGame(widget.bingoParams, -1, newGame);
    }
  }

  void changePoints(final int newPoint, final int index) {
    setState(() {
      widget.bingoParams.points += newPoint;
      widget.bingoParams.time = timer.getTime();
      _saveGame(false);
      if (widget.bingoParams.points == 56) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                  title: Text(style: TextStyle(color: Colors.black), "Bingo"),
                  content: Image.asset('assets/logo.png'),
                  backgroundColor: Colors.yellow[300]);
            });
      }
    });
  }

  void addLines(final int newLines) {
    widget.bingoParams.nbLines += newLines;
  }

  void deleteGame() {
    widget.isarService.deleteOnGoingGame();
    widget.bingoParams.resetGameData();
    Navigator.pop(context, true);
  }

  void askDeleteGame() {
    PDialog(
            context: context,
            title: "Supprimer la partie",
            desc: "Voulez vous vraiment supprimer cette partie ?",
            bntOkOnPress: deleteGame)
        .show();
  }

  @override
  Widget build(BuildContext context) {
    final double fontSize = MediaQuery.of(context).size.width * 0.055;
    final double borderHeight = MediaQuery.of(context).size.width / 6.7;
    if (MediaQuery.of(context).size.width > 700) {
      screenSizeRatio = 4;
    }
    return Scaffold(
        appBar: PAppBar(
            title: Row(children: [
              getIcon(widget.bingoParams.bingoType),
              SizedBox(width: 15),
              Text(
                'Bingo ${widget.bingoParams.bingoType.name}',
              ),
            ]),
            actions: [
              IconButton(
                  icon: Icon(FontAwesomeIcons.trash),
                  onPressed: askDeleteGame,
                  color: Theme.of(context).colorScheme.primary)
            ]),
        body:
            ListView(children: [
          Align(
              child: Container(
                  margin: EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (widget.displayTimer)
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 2.5,
                              height: borderHeight,
                              child: Container(
                                padding: EdgeInsets.only(
                                    top:
                                        MediaQuery.of(context).size.width / 40),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    border: Border.all(
                                        width: 1.5,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary)),
                                child: timer,
                              )),
                        SizedBox(
                            height: borderHeight,
                            width: MediaQuery.of(context).size.width / 2.5,
                            child: Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    border: Border.all(
                                        width: 1.5,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary)),
                                child: Container(
                                    margin: EdgeInsets.only(
                                        top: MediaQuery.of(context).size.width /
                                            150),
                                    child: Column(children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("Points : ",
                                              style: TextStyle(
                                                  fontSize: fontSize,
                                                  fontWeight: FontWeight.w500)),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5),
                                              child: Text(
                                                widget.bingoParams.points
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: fontSize * 1.2,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ))
                                        ],
                                      ),
                                    ]))))
                      ]))),
          Center(
              child: Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Board(
                    changePoints: changePoints,
                    bingoCard: widget.bingoParams.bingoCards,
                    saveGame: askSaveGame,
                    addLine: addLines,
                  ))),
        ]
                //)
                ));
  }
}
