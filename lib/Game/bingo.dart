import 'package:flutter/material.dart';
import 'package:plaktago/Game/cardName.dart';
import 'timer.dart';

class Bingo extends StatefulWidget {
  final String gameType;
  const Bingo({Key? key, required this.gameType}) : super(key: key);

  @override
  State<Bingo> createState() => _Bingo();
}

class _Bingo extends State<Bingo> {
  static const nbLines = 4;
  static List<BingoCard> _bingoCard = [];

  @override
  void initState() {
    super.initState();
    for (int it = 0; it < nbLines * nbLines; it++) {
      _bingoCard.add(BingoCard(cardNameList.elementAt(it).name));
      _bingoCard.elementAt(it).isSelect = false;
      _bingoCard.elementAt(it).nbLineComplete = 0;
    }
  }

  void resetCard() {
    setState(() {
      for (int it = 0; it < nbLines * nbLines; it++) {
        _bingoCard.elementAt(it).isSelect = false;
        _bingoCard.elementAt(it).nbLineComplete = 0;
      }
    });
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => CountUpTimerPage()),
    // );
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

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
          child: Scaffold(
              appBar: AppBar(
                title: Text('Bingo ${widget.gameType}'),
                backgroundColor: Colors.orange,
              ),
              body: Container(
                  margin:
                      const EdgeInsets.only(left: 80.0, right: 80.0, top: 80.0),
                  child: MaterialApp(
                      theme: ThemeData(useMaterial3: true),
                      home: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: nbLines,
                          ),
                          itemCount: nbLines * nbLines,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                                onTap: () => _onCardTapped(index),
                                child: Card(
                                  color: getCardColor(index),
                                  child: SizedBox(
                                    width: 150,
                                    height: 150,
                                    child: Center(
                                        child: Text(
                                            _bingoCard.elementAt(index).name)),
                                  ),
                                ));
                          }))))),
      ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width - 50,
            maxHeight: 200,
          ),
          child: CountUpTimerPage()),
      TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
        ),
        onPressed: resetCard,
        child: Text('Reset'),
      )
    ]);
  }
}

class BingoCard {
  String name;
  bool isSelect = false;
  int nbLineComplete = 0;

  BingoCard(this.name);
}
