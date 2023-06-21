import 'package:flutter/material.dart';
import 'dart:math';
import 'package:plaktago/game/board/cardName.dart';
import 'bingoCard.dart';
import 'checkBoard.dart';

class Board extends StatefulWidget {
  final String gameType;
  final Function changePoints;
  final VoidCallback resetPoint;

  const Board(
      {Key? key,
      required this.gameType,
      required this.changePoints,
      required this.resetPoint})
      : super(key: key);

  @override
  State<Board> createState() => _Board();
}

class _Board extends State<Board> {
  static const int nbLines = 4;
  static List<int> firstDiagonalValues =
      List<int>.generate(nbLines, (index) => index * (nbLines + 1));
  static List<int> secondDiagonalValues =
      List<int>.generate(nbLines, (index) => (nbLines - 1) * (index + 1));
  static List<BingoCard> _bingoCard = <BingoCard>[];
  static CheckBoard checkBoard = CheckBoard(nbLines: nbLines);

  @override
  void initState() {
    print(secondDiagonalValues);
    CardName card;
    List<CardName> cardList = <CardName>[];
    _bingoCard.clear();
    cardList.addAll(cardNameList);
    super.initState();
    for (int it = 0; it < nbLines * nbLines; it++) {
      card = cardList.elementAt(Random().nextInt(cardList.length));
      cardList.remove(card);
      _bingoCard.add(BingoCard(name: card.name));
    }
  }

  Color getCardColor(int index) {
    if (_bingoCard.elementAt(index).isSelect == true) {
      if (_bingoCard.elementAt(index).nbLineComplete > 0) {
        return Colors.black12;
      }
      return Colors.lightGreen;
    }
    return Theme.of(context).primaryColor;
  }

  void _onCardTapped(final int index) {
    bool newState = !_bingoCard.elementAt(index).isSelect;
    setState(() {
      widget.changePoints(!_bingoCard.elementAt(index).isSelect);
      _bingoCard.elementAt(index).isSelect =
          !_bingoCard.elementAt(index).isSelect;
      checkBoard.checkColumn(_bingoCard, index, newState);
      checkBoard.checkLine(_bingoCard, index, newState);
      if (firstDiagonalValues.contains(index)) {
        checkBoard.checkDiagonal(_bingoCard, 0, newState, nbLines + 1);
      } else if (secondDiagonalValues.contains(index)) {
        checkBoard.checkDiagonal(
            _bingoCard, nbLines - 1, newState, nbLines - 1);
      }
    });
  }

  void refreshBoard() {
    CardName card;
    List<CardName> cardList = [];
    cardList.addAll(cardNameList);
    _bingoCard.clear();
    setState(() {
      widget.resetPoint();
      for (int it = 0; it < nbLines * nbLines; it++) {
        card = cardList.elementAt(Random().nextInt(cardList.length));
        cardList.remove(card);
        _bingoCard.add(BingoCard(name: card.name));
        _bingoCard.elementAt(it).isSelect = false;
        _bingoCard.elementAt(it).nbLineComplete = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
          height: 410,
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: nbLines,
              ),
              padding: EdgeInsets.all(10.0),
              itemCount: nbLines * nbLines,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => _onCardTapped(index),
                  child: Card(
                    margin: const EdgeInsets.all(0.8),
                    color: getCardColor(index),
                    child: Center(
                        child: Container(
                            margin: const EdgeInsets.all(0.5),
                            child: Text(_bingoCard.elementAt(index).name,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black)))),
                  ),
                );
              })),
      TextButton.icon(
        onPressed: refreshBoard,
        icon: Icon(
          Icons.restart_alt,
          color: Theme.of(context).secondaryHeaderColor,
        ),
        label: Text(
          'Random',
          style: TextStyle(color: Theme.of(context).secondaryHeaderColor),
        ),
      ),
    ]);
  }
}
