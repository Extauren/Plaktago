import 'package:flutter/material.dart';
import '../home/modeButton.dart';
import 'board/board.dart';
import 'timer/timer.dart';
import '../utils/saveGame.dart';
import 'package:plaktago/game/board/cardName.dart';
import 'board/bingoCard.dart';
import 'dart:math';
import 'package:plaktago/utils/bingoParams.dart';
import '../home/personalize.dart';

class Game extends StatefulWidget {
  final BingoParams bingoParams;
  List<PersonalizeCard> personalizeCards;
  Function changeIsPlaying;
  final bool newGame;
  Timer timer;
  Game(
      {Key? key,
      required this.bingoParams,
      required this.changeIsPlaying,
      required this.newGame,
      required this.timer,
      this.personalizeCards = const []})
      : super(key: key);

  @override
  State<Game> createState() => _Game();
}

class _Game extends State<Game> {
  static int points = 0;
  static const int nbLines = 4;
  static List<BingoCard> bingoCard = <BingoCard>[];

  @override
  void initState() {
    if (widget.newGame) {
      widget.changeIsPlaying(true);
      super.initState();
      points = 0;
      if (widget.bingoParams.mode == Mode.personalize) {
        PersonalizeCard card;
        List<PersonalizeCard> cards = widget.personalizeCards
            .where((element) => element.isSelect == true)
            .toList();
        for (int it = 0; it < nbLines * nbLines; it++) {
          card = cards.elementAt(Random().nextInt(cards.length));
          cards.remove(card);
          bingoCard.add(BingoCard(name: card.name));
        }
      } else {
        CardName card;
        List<CardName> cardList = <CardName>[];
        bingoCard.clear();
        cardList = cardNameListPlaque
            .where((element) =>
                element.difficulty <= widget.bingoParams.difficulty.value &&
                element.type.contains(widget.bingoParams.bingoType))
            .toList();
        for (int it = 0; it < nbLines * nbLines; it++) {
          card = cardList.elementAt(Random().nextInt(cardList.length));
          cardList.remove(card);
          bingoCard.add(BingoCard(name: card.name));
        }
      }
    }
  }

  void refreshBoard() {
    CardName card;
    List<CardName> cardList = [];
    cardList = cardNameListPlaque
        .where((element) =>
            element.difficulty <= widget.bingoParams.difficulty.value &&
            element.type.contains(widget.bingoParams.bingoType))
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
    saveGame.writeGame(
        bingoCard, points, widget.bingoParams, widget.timer.getTime());
    widget.changeIsPlaying(false);
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
          Container(
              margin: EdgeInsets.only(top: 40),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width / 2,
                          //maxHeight: 130,
                        ),
                        child: widget.timer),
                    ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width / 2,
                          //maxHeight: 130,
                        ),
                        child: Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Points : ",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500)),
                                Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      points.toString(),
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w400),
                                    ))
                              ],
                            )))
                  ])),
          Center(
              child: ConstrainedBox(
                  constraints:
                      const BoxConstraints(maxHeight: 500, maxWidth: 800),
                  child: Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Board(
                        gameType: widget.bingoParams.bingoType.name,
                        changePoints: changePoints,
                        bingoCard: bingoCard,
                        nbLines: nbLines,
                        refreshBoard: refreshBoard,
                      )))),
        ]));
  }
}
