import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../home/modeButton.dart';
import 'board/board.dart';
import 'gameData.dart';
import '../utils/saveGame.dart';
import 'package:plaktago/game/board/cardName.dart';
import 'board/bingoCard.dart';
import 'dart:math';
import '../home/personalize.dart';

class Game extends StatefulWidget {
  final GameData bingoParams;
  List<PersonalizeCard> personalizeCards;
  final bool newGame;
  Game(
      {Key? key,
      required this.bingoParams,
      required this.newGame,
      this.personalizeCards = const []})
      : super(key: key);

  @override
  State<Game> createState() => _Game();
}

class _Game extends State<Game> {
  SaveGame saveGame = SaveGame();
  int screenSizeRatio = 2;

  @override
  void initState() {
    super.initState();
    if (widget.newGame) {
      widget.bingoParams.setIsPlaying(true);
      widget.bingoParams.setPoints(0);
      if (widget.bingoParams.bingoParams.mode == Mode.personalize) {
        PersonalizeCard card;
        List<PersonalizeCard> cards = widget.personalizeCards
            .where((element) => element.isSelect == true)
            .toList();
        for (int it = 0;
            it < widget.bingoParams.nbLines * widget.bingoParams.nbLines;
            it++) {
          card = cards.elementAt(Random().nextInt(cards.length));
          cards.remove(card);
          widget.bingoParams.bingoCard.add(BingoCard(name: card.name));
        }
      } else {
        CardName card;
        List<CardName> cardList = <CardName>[];
        widget.bingoParams.bingoCard.clear();
        cardList = cardNameListPlaque
            .where((element) =>
                element.type.contains(widget.bingoParams.bingoParams.bingoType))
            .toList();
        for (int it = 0;
            it < widget.bingoParams.nbLines * widget.bingoParams.nbLines;
            it++) {
          card = cardList.elementAt(Random().nextInt(cardList.length));
          cardList.remove(card);
          widget.bingoParams.bingoCard.add(BingoCard(name: card.name));
        }
      }
    }
  }

  void askSaveGame() {
    BuildContext dialogContext;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          dialogContext = context;
          return AlertDialog(
              title: Text("Voulez vous vraiment sauvegarder cette partie ?",
                  style: TextStyle(color: Colors.black, fontSize: 18)),
              content:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                    margin: EdgeInsets.only(right: 20),
                    child: ElevatedButton(
                        onPressed: () => {_saveGame(dialogContext)},
                        child: Text("Oui",
                            style: TextStyle(color: Colors.black)))),
                Container(
                    margin: EdgeInsets.only(left: 20),
                    child: ElevatedButton(
                        onPressed: () => {Navigator.pop(dialogContext)},
                        child:
                            Text("Non", style: TextStyle(color: Colors.black))))
              ]),
              backgroundColor: Colors.grey[300]);
        });
  }

  void _saveGame(final BuildContext dialogContext) {
    saveGame.writeGame(
        widget.bingoParams.bingoCard,
        widget.bingoParams.points,
        widget.bingoParams.bingoParams,
        widget.bingoParams.timer.getTime(),
        widget.bingoParams.gameNumber);
    widget.bingoParams.setIsPlaying(false);
    widget.bingoParams.resetGameData();
    Navigator.pop(dialogContext);
    Navigator.pop(context);
  }

  void changePoints(int newPoint) {
    setState(() {
      widget.bingoParams.changePoints(newPoint);
      saveGame.saveOnGoingGame(widget.bingoParams);
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

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width > 700) {
      screenSizeRatio = 4;
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Bingo ${widget.bingoParams.bingoParams.bingoType.name}',
          ),
        ),
        body: ListView(children: [
          // Consumer<GameData>(
          //   builder: (context, provider, child) {
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
                            child: widget.bingoParams.timer),
                        SizedBox(
                            width: MediaQuery.of(context).size.width /
                                screenSizeRatio,
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
                                          widget.bingoParams.points.toString(),
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w400),
                                        ))
                                  ],
                                )))
                      ]))),
          Center(
              child: Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Board(
                    gameType: widget.bingoParams.bingoParams.bingoType.name,
                    changePoints: changePoints,
                    bingoCard: widget.bingoParams.bingoCard,
                    nbLines: widget.bingoParams.nbLines,
                    saveGame: askSaveGame,
                  ))),
        ]));
  }
}
