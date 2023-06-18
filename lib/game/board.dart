import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:convert';
import 'package:plaktago/game/cardName.dart';

class BingoCard {
  String name;
  bool isSelect;
  int nbLineComplete;

  BingoCard(
      {required this.name, this.isSelect = false, this.nbLineComplete = 0});

  Map<String, dynamic> toMap() => {
        'name': name,
        'isSelect': isSelect,
        'nbLineComplete': nbLineComplete,
      };

  factory BingoCard.fromMap(Map<String, dynamic> map) => BingoCard(
        name: map['name'] as String,
        isSelect: map['isSelect'] as bool,
        nbLineComplete: map['nbLinesComplete'] as int,
      );

  String toJson() => json.encode(toMap());

  factory BingoCard.fromJson(String source) {
    return BingoCard.fromMap(json.decode(source) as Map<String, dynamic>);
  }
}

class Board extends StatefulWidget {
  final String gameType;
  const Board({Key? key, required this.gameType}) : super(key: key);

  @override
  State<Board> createState() => _Board();
}

class _Board extends State<Board> {
  static const int nbLines = 5;
  static List<BingoCard> _bingoCard = <BingoCard>[];

  @override
  void initState() {
    CardName card;
    List<CardName> cardList = <CardName>[];
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
        return Colors.green;
      }
      return Colors.orange;
    }
    return Colors.red;
  }

  void _checkColumn(int index, bool newState) {
    int counter = 0;
    double buffer = index - ((index / nbLines) * nbLines) + index % nbLines;
    int cardPos = buffer.round();

    for (int it = 0; it < nbLines; it++) {
      if (_bingoCard.elementAt(cardPos + (it * nbLines)).isSelect == true) {
        counter += 1;
      }
    }
    if (counter == nbLines) {
      for (int it = 0; it < nbLines; it++) {
        _bingoCard.elementAt(cardPos + (it * nbLines)).nbLineComplete += 1;
      }
    } else if (counter == nbLines - 1 && !newState) {
      for (int it = 0; it < nbLines; it++) {
        _bingoCard.elementAt(cardPos + (it * nbLines)).nbLineComplete -= 1;
      }
    }
  }

  void _checkLine(int index, bool newState) {
    int cardPos = index - (index % nbLines);
    int counter = 0;
    for (int it = 0; it < nbLines; it++) {
      if (_bingoCard.elementAt(cardPos + it).isSelect == true) {
        counter += 1;
      }
    }
    if (counter == nbLines) {
      for (int it = 0; it < nbLines; it++) {
        _bingoCard.elementAt(cardPos + it).nbLineComplete += 1;
      }
    } else if (counter == nbLines - 1 && !newState) {
      for (int it = 0; it < nbLines; it++) {
        _bingoCard.elementAt(cardPos + it).nbLineComplete -= 1;
      }
    }
  }

  void _checkDiagonal(int index, bool newState) {
    int cardPos = index;
    int counter = 0;
    int buffer = 0;
    int incrementValue = 0;
    double halLines = (nbLines / 2) - 1;

    if (index == nbLines * (halLines.round() - 1) + 1) {
      _checkDiagonal(nbLines - 1, newState);
    }
    while (cardPos >= nbLines + 1) {
      cardPos -= nbLines + 1;
    }
    if (cardPos == 0) {
      incrementValue = nbLines + 1;
    } else if (cardPos == nbLines - 1) {
      incrementValue = cardPos;
    } else {
      return;
    }
    buffer = cardPos;
    for (int it = 0; it < nbLines; it++) {
      if (_bingoCard.elementAt(buffer).isSelect) {
        counter += 1;
      }
      buffer += incrementValue;
    }
    buffer = cardPos;
    if (counter == nbLines) {
      for (int it = 0; it < nbLines; it++) {
        _bingoCard.elementAt(buffer).nbLineComplete += 1;
        buffer += incrementValue;
      }
    } else if (counter == nbLines - 1 && !newState) {
      for (int it = 0; it < nbLines; it++) {
        _bingoCard.elementAt(buffer).nbLineComplete -= 1;
        buffer += incrementValue;
      }
    }
  }

  void _onCardTapped(int index) {
    bool newState = !_bingoCard.elementAt(index).isSelect;
    setState(() {
      _bingoCard.elementAt(index).isSelect =
          !_bingoCard.elementAt(index).isSelect;
      _checkColumn(index, newState);
      _checkLine(index, newState);
      _checkDiagonal(index, newState);
    });
  }

  void refreshBoard() {
    CardName card;
    List<CardName> cardList = [];
    cardList.addAll(cardNameList);
    _bingoCard.clear();
    setState(() {
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
    // return MaterialApp(
    //     theme: ThemeData(useMaterial3: true),
    //     home:
    return Column(children: [
      SizedBox(
          height: 430,
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: nbLines,
              ),
              padding: EdgeInsets.all(5.0),
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
                                textAlign: TextAlign.center))),
                  ),
                );
              })),
      TextButton.icon(
        onPressed: refreshBoard,
        icon: const Icon(
          Icons.restart_alt,
          color: Colors.orange,
        ),
        label: const Text(
          'Random',
          style: TextStyle(color: Colors.orange),
        ),
      ),
    ]);
  }
}
