import 'package:flutter/material.dart';
import 'board/board.dart';
import 'timer/timer.dart';
import '../utils/saveGame.dart';
import 'package:plaktago/game/board/cardName.dart';
import 'board/bingoCard.dart';
import 'dart:math';
import 'package:plaktago/utils/bingoParams.dart';

class Game extends StatefulWidget {
  final BingoParams bingoParams;
  const Game({
    Key? key,
    required this.bingoParams,
  }) : super(key: key);

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
    cardList = cardNameListPlaque
        .where((element) =>
            element.difficulty <= widget.bingoParams.difficulty.value)
        .toList();
    for (int it = 0; it < nbLines * nbLines; it++) {
      card = cardList.elementAt(Random().nextInt(cardList.length));
      cardList.remove(card);
      bingoCard.add(BingoCard(name: card.name));
    }
  }

  void refreshBoard() {
    CardName card;
    List<CardName> cardList = [];
    cardList = cardNameListPlaque
        .where((element) =>
            element.difficulty <= widget.bingoParams.difficulty.value)
        .toList();
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
    saveGame.writeGame(bingoCard, points, widget.bingoParams, timer.getTime());
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Bingo ${widget.bingoParams.bingoType.name}',
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
            Row(
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
            )
          ]),
          Center(
              child: ConstrainedBox(
                  constraints:
                      const BoxConstraints(maxHeight: 500, maxWidth: 800),
                  child: Board(
                    gameType: widget.bingoParams.bingoType.name,
                    changePoints: changePoints,
                    bingoCard: bingoCard,
                    nbLines: nbLines,
                    refreshBoard: refreshBoard,
                  ))),
        ]));
  }
}
