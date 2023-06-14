import 'package:flutter/material.dart';

class Bingo extends StatefulWidget {
  const Bingo({super.key});

  @override
  State<Bingo> createState() => _Bingo();
}

class _Bingo extends State<Bingo> {
  static List<BingoCard> _bingoCard = [
    BingoCard(),
    BingoCard(),
    BingoCard(),
    BingoCard(),
    BingoCard(),
    BingoCard(),
    BingoCard(),
    BingoCard(),
    BingoCard(),
    BingoCard(),
  ];

  void resetCard() {
    setState(() {
      for (int it = 0; it < 9; it++) {
        _bingoCard.elementAt(it).isSelect = false;
        _bingoCard.elementAt(it).lineIsComplete = false;
      }
    });
  }

  Color getCardColor(int index) {
    if (_bingoCard.elementAt(index).isSelect == true) {
      if (_bingoCard.elementAt(index).lineIsComplete == true) {
        return Colors.green;
      }
      return Colors.orange;
    }
    return Colors.red;
  }

  void _checkColumn(int index) {
    int counter = 0;
    double buffer = index - ((index / 3) * 3) + index % 3;
    int cardPos = buffer.round();

    for (int it = 0; it < 3; it++) {
      if (_bingoCard.elementAt(cardPos + (it * 3)).isSelect == true) {
        counter += 1;
      }
    }
    if (counter == 3) {
      for (int it = 0; it < 3; it++) {
        _bingoCard.elementAt(cardPos + (it * 3)).lineIsComplete = true;
      }
    } else {
      for (int it = 0; it < 3; it++) {
        _bingoCard.elementAt(cardPos + (it * 3)).lineIsComplete = false;
      }
    }
  }

  void _onCardTapped(int index) {
    int cardPos = index - (index % 3);
    int counter = 0;

    setState(() {
      _bingoCard.elementAt(index).isSelect =
          !_bingoCard.elementAt(index).isSelect;
      _checkColumn(index);
      for (int it = 0; it < 3; it++) {
        if (_bingoCard.elementAt(cardPos + it).isSelect == true) {
          counter += 1;
        }
      }
      if (counter == 3) {
        for (int it = 0; it < 3; it++) {
          _bingoCard.elementAt(cardPos + it).lineIsComplete = true;
        }
      } else {
        for (int it = 0; it < 3; it++) {
          _bingoCard.elementAt(cardPos + it).lineIsComplete = false;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: 9,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => _onCardTapped(index),
                  child: Card(
                    color: getCardColor(index),
                    child: Center(child: Text("1")),
                  ),
                );
              })),
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
  String name = "Card name";
  bool isSelect = false;
  bool lineIsComplete = false;

  //BingoCard({this.name, this.isSelect});
}
