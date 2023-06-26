import 'package:flutter/material.dart';
import 'board/board.dart';
import 'timer/timer.dart';
import '../utils/saveGame.dart';
import 'package:plaktago/game/board/cardName.dart';
import 'board/bingoCard.dart';
import 'dart:math';

class Game extends StatefulWidget {
  final String gameType;
  final ThemeMode theme;
  const Game({Key? key, required this.gameType, required this.theme})
      : super(key: key);

  @override
  State<Game> createState() => _Game();
}

class _Game extends State<Game> {
  static int points = 0;
  static const int nbLines = 4;
  static List<BingoCard> bingoCard = <BingoCard>[];
  static Timer timer = Timer();

  @override
  void initState() {
    super.initState();
    points = 0;
    CardName card;
    List<CardName> cardList = <CardName>[];
    bingoCard.clear();
    cardList.addAll(cardNameList);
    super.initState();
    for (int it = 0; it < nbLines * nbLines; it++) {
      card = cardList.elementAt(Random().nextInt(cardList.length));
      cardList.remove(card);
      bingoCard.add(BingoCard(name: card.name));
    }
  }

  void refreshBoard() {
    CardName card;
    List<CardName> cardList = [];
    cardList.addAll(cardNameList);
    bingoCard.clear();
    setState(() {
      points = 0;
      for (int it = 0; it < nbLines * nbLines; it++) {
        card = cardList.elementAt(Random().nextInt(cardList.length));
        cardList.remove(card);
        bingoCard.add(BingoCard(name: card.name));
        bingoCard.elementAt(it).isSelect = false;
        bingoCard.elementAt(it).nbLineComplete = 0;
      }
    });
  }

  void _saveGame() {
    SaveGame saveGame = SaveGame();
    saveGame.writeGame(bingoCard, points, widget.gameType, timer.getTime());
    Navigator.pop(context);
  }

  void changePoints(bool newPoint) {
    setState(() {
      if (newPoint) {
        points += 1;
      } else {
        points -= 1;
      }
    });
  }

  void resetPoints() {
    setState(() {
      points = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Bingo ${widget.gameType}',
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.save,
              ),
              onPressed: _saveGame,
            )
          ],
        ),
        body: ListView(children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 200,
                  maxHeight: 130,
                ),
                child: timer),
            Container(
                //margin: const EdgeInsets.only(left: 60, top: 15),
                child: Row(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Points : ",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      points.toString(),
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                    ))
              ],
            ))
            //],
            //),
          ]),
          Center(
              child: ConstrainedBox(
                  constraints:
                      const BoxConstraints(maxHeight: 500, maxWidth: 800),
                  child: Board(
                    gameType: widget.gameType,
                    changePoints: changePoints,
                    resetPoint: resetPoints,
                    theme: widget.theme,
                    bingoCard: bingoCard,
                    nbLines: nbLines,
                    refreshBoard: refreshBoard,
                  ))),
        ]));
  }
}
