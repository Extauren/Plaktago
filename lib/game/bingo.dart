import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:isar/isar.dart';
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
import 'package:another_flushbar/flushbar.dart';

class Bingo extends StatefulWidget {
  final Game bingoParams;
  final bool newGame;
  final IsarService isarService;
  final Id id;
  Bingo({
    Key? key,
    required this.bingoParams,
    required this.newGame,
    required this.isarService,
    this.id = -1,
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
              nbShot: card.nbShot));
        }
        newBingoCards.shuffle();
        widget.bingoParams.bingoCards = newBingoCards;
      }
    }
    _saveOnGoingGame();
    timer1 = Timer.periodic(
      const Duration(
        seconds: 60,
      ),
      (t) => _saveOnGoingGame(),
    );
  }

  void askSaveGame() {
    PDialog(
            context: context,
            title: "Sauvegarder la partie",
            desc: "Voulez vous vraiment sauvegarder cette partie ?",
            bntOkOnPress: _saveGame)
        .show();
  }

  void _saveGame() {
    initializeDateFormatting();
    late Game game;
    if (widget.newGame) {
      game = Game(
          id: widget.id,
          gameNumber: widget.bingoParams.gameNumber,
          points: widget.bingoParams.points,
          bingoType: widget.bingoParams.bingoType,
          time: timer.getTime(),
          hour: DateFormat("HH:mm").format(DateTime.now()),
          date: DateFormat('d/M/y').format(DateTime.now()),
          isAlcool: widget.bingoParams.isAlcool,
          nbShot: widget.bingoParams.nbShot,
          bingoCards: widget.bingoParams.bingoCards,
          updateGame: widget.bingoParams.updateGame,
          nbLines: widget.bingoParams.nbLines);
    } else {
      game = Game(
          id: widget.bingoParams.gameNumber,
          gameNumber: widget.bingoParams.gameNumber,
          points: widget.bingoParams.points,
          bingoType: widget.bingoParams.bingoType,
          time: timer.getTime(),
          hour: DateFormat("HH:mm").format(DateTime.now()),
          date: DateFormat('d/M/y').format(DateTime.now()),
          isAlcool: widget.bingoParams.isAlcool,
          nbShot: widget.bingoParams.nbShot,
          bingoCards: widget.bingoParams.bingoCards,
          updateGame: widget.bingoParams.updateGame,
          nbLines: widget.bingoParams.nbLines);
    }
    widget.isarService.saveGame(game, true);
    widget.bingoParams.resetGameData();
    Navigator.pop(context, true);
  }

  void _saveOnGoingGame() {
    initializeDateFormatting();
    Game game = Game(
        id: -1,
        gameNumber: widget.bingoParams.gameNumber,
        points: widget.bingoParams.points,
        bingoType: widget.bingoParams.bingoType,
        time: timer.getTime(),
        hour: DateFormat("HH:mm").format(DateTime.now()),
        date: DateFormat('d/M/y').format(DateTime.now()),
        isAlcool: widget.bingoParams.isAlcool,
        nbShot: widget.bingoParams.nbShot,
        bingoCards: widget.bingoParams.bingoCards,
        isPlaying: widget.bingoParams.isPlaying,
        updateGame: widget.bingoParams.updateGame,
        nbLines: widget.bingoParams.nbLines);
    widget.isarService.saveGame(game, false);
  }

  void changePoints(final int newPoint, final int index) {
    setState(() {
      if (widget.bingoParams.isAlcool && newPoint > 0) {
        Flushbar(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 70),
          borderRadius: BorderRadius.circular(8),
          flushbarPosition: FlushbarPosition.TOP,
          flushbarStyle: FlushbarStyle.FLOATING,
          titleText: Center(
              child: Text("Jeux d'alcool",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black))),
          messageText: Center(
              child: Text(
            widget.bingoParams.bingoCards.elementAt(index).alcoolRule,
            style: TextStyle(fontSize: 16, color: Colors.black),
          )),
          duration: Duration(seconds: 15),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ).show(context);
        widget.bingoParams.nbShot +=
            widget.bingoParams.bingoCards.elementAt(index).nbShot;
      }
      if (widget.bingoParams.isAlcool && newPoint < 0) {
        widget.bingoParams.nbShot -=
            widget.bingoParams.bingoCards.elementAt(index).nbShot;
      }
      widget.bingoParams.points += newPoint;
      widget.bingoParams.time = timer.getTime();
      _saveOnGoingGame();
      if (widget.bingoParams.points == 56) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                  title: Text(style: TextStyle(color: Colors.black), "Bingo"),
                  content: Text(
                      style: TextStyle(color: Colors.black), "Vous avez gagné"),
                  backgroundColor: Colors.yellow[300]);
            });
      }
    });
  }

  void addLines(final int newLines) {
    widget.bingoParams.nbLines += newLines;
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width > 700) {
      screenSizeRatio = 4;
    }
    return Scaffold(
        appBar: AppBar(
            title: Row(children: [
          getIcon(widget.bingoParams.bingoType),
          Text(
            'Bingo ${widget.bingoParams.bingoType.name}',
          ),
          if (widget.bingoParams.isAlcool)
            Container(
                margin: EdgeInsets.only(left: 8, top: 3),
                child: Icon(Icons.wine_bar, size: 30.0)),
        ])),
        body: ListView(children: [
          Align(
              child: Container(
                  margin: EdgeInsets.only(top: 40),
                  width: MediaQuery.of(context).size.width,
                  constraints: BoxConstraints(maxWidth: 450),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width /
                                screenSizeRatio,
                            child: timer),
                        SizedBox(
                            width: MediaQuery.of(context).size.width /
                                screenSizeRatio,
                            child: Container(
                                margin: EdgeInsets.only(
                                    top: widget.bingoParams.isAlcool ? 0 : 5),
                                child: Column(children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Points : ",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500)),
                                      Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5),
                                          child: Text(
                                            widget.bingoParams.points
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.w400),
                                          ))
                                    ],
                                  ),
                                  if (widget.bingoParams.isAlcool)
                                    Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text("Shots : ",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: Text(
                                                  widget.bingoParams.nbShot
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ))
                                          ],
                                        ))
                                ])))
                      ]))),
          Center(
              child: Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Board(
                    changePoints: changePoints,
                    bingoCard: widget.bingoParams.bingoCards,
                    saveGame: askSaveGame,
                    addLine: addLines,
                  ))),
        ]));
  }
}
