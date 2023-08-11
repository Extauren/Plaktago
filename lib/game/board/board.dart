import 'package:flutter/material.dart';
import 'bingoCard.dart';
import 'checkBoard.dart';

class Board extends StatefulWidget {
  final String gameType;
  final Function changePoints;
  final List<BingoCard> bingoCard;
  final int nbLines;
  final VoidCallback saveGame;

  Board(
      {Key? key,
      required this.gameType,
      required this.changePoints,
      required this.bingoCard,
      required this.nbLines,
      required this.saveGame})
      : super(key: key);

  @override
  State<Board> createState() => _Board();
}

class _Board extends State<Board> {
  static List<int> firstDiagonalValues = [];
  static List<int> secondDiagonalValues = [];
  static CheckBoard checkBoard = CheckBoard(nbLines: 0);

  @override
  void initState() {
    super.initState();
    firstDiagonalValues = List<int>.generate(
        widget.nbLines, (index) => index * (widget.nbLines + 1));
    secondDiagonalValues = List<int>.generate(
        widget.nbLines, (index) => (widget.nbLines - 1) * (index + 1));
    checkBoard = CheckBoard(nbLines: widget.nbLines);
  }

  Color getCardColor(int index) {
    if (widget.bingoCard.elementAt(index).isSelect == true) {
      if (widget.bingoCard.elementAt(index).nbLineComplete > 0) {
        return Color.fromRGBO(153, 219, 129,
            1); //Colors.grey[600]!; //Color.fromRGBO(219, 150, 129, 1);
      }
      return Theme.of(context)
          .colorScheme
          .secondary; //Color.fromRGBO(153, 219, 129, 1);
    }
    return Theme.of(context).cardColor;
  }

  void _onCardTapped(final int index) {
    bool newState = !widget.bingoCard.elementAt(index).isSelect;
    int points = 0;

    (newState) ? points += 1 : points -= 1;
    setState(() {
      widget.bingoCard.elementAt(index).isSelect =
          !widget.bingoCard.elementAt(index).isSelect;
      points += checkBoard.checkColumn(widget.bingoCard, index, newState);
      points += checkBoard.checkLine(widget.bingoCard, index, newState);
      if (firstDiagonalValues.contains(index)) {
        points += checkBoard.checkDiagonal(
            widget.bingoCard, 0, newState, widget.nbLines + 1);
      } else if (secondDiagonalValues.contains(index)) {
        points += checkBoard.checkDiagonal(
            widget.bingoCard, widget.nbLines - 1, newState, widget.nbLines - 1);
      }
      widget.changePoints(points);
    });
  }

  ShapeBorder getCardShape(final int index) {
    final Radius corner = Radius.circular(8);
    if (index == 0) {
      return RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: corner));
    }
    if (index == widget.nbLines - 1) {
      return RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight: corner));
    }
    if (index == widget.nbLines * (widget.nbLines - 1)) {
      return RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: corner));
    }
    if (index == widget.nbLines * widget.nbLines - 1) {
      return RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomRight: corner));
    }
    return RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.zero));
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          height: MediaQuery.of(context).size.height / 1.77,
          constraints: BoxConstraints(maxWidth: 450, maxHeight: 450),
          child: GridView.builder(
              controller: ScrollController(keepScrollOffset: false),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: widget.nbLines,
              ),
              padding: EdgeInsets.all(10.0),
              itemCount: widget.nbLines * widget.nbLines,
              itemBuilder: (BuildContext context, int index) {
                return Align(
                    child: SizedBox(
                        height: 100,
                        width: 100,
                        child: GestureDetector(
                          onTap: () => _onCardTapped(index),
                          child: Card(
                            shape: getCardShape(index),
                            margin: const EdgeInsets.all(0.5),
                            color: getCardColor(index),
                            child: Center(
                                child: Container(
                                    margin: const EdgeInsets.all(0.5),
                                    child: Text(
                                        widget.bingoCard.elementAt(index).name,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black)))),
                          ),
                        )));
              })),
      Container(
          margin: EdgeInsets.only(bottom: 10),
          child: ElevatedButton(
            onPressed: widget.saveGame,
            child: TextButton.icon(
              onPressed: widget.saveGame,
              icon: Icon(
                Icons.save,
                color: Colors.black,
              ),
              label: Text(
                'Sauvegarder la partie',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ))
    ]);
  }
}
