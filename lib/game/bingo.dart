import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
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
import 'package:another_flushbar/flushbar.dart';

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
                  content: Image.asset('assets/logo.png'),
                  // Text(
                  //     style: TextStyle(color: Colors.black), "Vous avez gagné"),
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
    if (MediaQuery.of(context).size.width > 700) {
      screenSizeRatio = 4;
    }
    return Scaffold(
        appBar: PAppBar(
            title: Row(children: [
          getIcon(widget.bingoParams.bingoType),
          //Theme.of(context).colorScheme.primary),
          Text(
            'Bingo ${widget.bingoParams.bingoType.name}',
            //style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
        ]), actions: [
          IconButton(icon: Icon(FontAwesomeIcons.trash), onPressed: askDeleteGame, color: Theme.of(context).colorScheme.primary)]),
        body: ListView(children: [
          Align(
              child: Container(
                  margin: EdgeInsets.only(top: 40),
                  width: MediaQuery.of(context).size.width,
                  constraints: BoxConstraints(maxWidth: 450),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (widget.displayTimer)
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 2.5,
                          height: 53,
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
                              child: timer,
                            )),
                        //SizedBox(height: 25),
                        SizedBox(
                            height: 53,
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
                                    margin: EdgeInsets.only(top: 3),
                                    child: Column(children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("Points : ",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500)),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5),
                                              child: Text(
                                                widget.bingoParams.points
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 24,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ))
                                        ],
                                      ),
                                    ]))))
                      ]))),
          Container(
              margin: EdgeInsets.only(top: 30),
              child: Board(
                changePoints: changePoints,
                bingoCard: widget.bingoParams.bingoCards,
                saveGame: askSaveGame,
                addLine: addLines,
              )),
        ]));
  }
}
