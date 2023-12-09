import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plaktago/data_class/bingo_card.dart';
import 'package:plaktago/game/board/check_board.dart';

class PBoard extends StatefulWidget {
  final List<BingoCard> bingoCard;
  final bool writePerm;
  final Function? changePoints;
  final Function? addLine;
  final double sliderValue;
  final ConfettiController? controller;

  const PBoard(
      {Key? key,
      required this.bingoCard,
      required this.writePerm,
      this.changePoints,
      this.addLine,
      this.sliderValue = 17,
      this.controller})
      : super(key: key);

  @override
  State<PBoard> createState() => _PBoard();
}

class _PBoard extends State<PBoard> {
  final int nbLines = 4;
  late int order;
  static CheckBoard checkBoard = CheckBoard(nbLines: 4);
  static List<int> firstDiagonalValues = [];
  static List<int> secondDiagonalValues = [];

  @override
  void initState() {
    super.initState();
    firstDiagonalValues =
        List<int>.generate(nbLines, (index) => index * (nbLines + 1));
    secondDiagonalValues =
        List<int>.generate(nbLines, (index) => (nbLines - 1) * (index + 1));
    checkBoard = CheckBoard(nbLines: nbLines);
    order = getMaxOrder();
    print(order);
  }

  int getMaxOrder() {
    int buffer = 0;
    for (int it = 0; it < widget.bingoCard.length; it++) {
      if (buffer < widget.bingoCard.elementAt(it).order) {
        buffer = widget.bingoCard.elementAt(it).order;
      }
    }
    return buffer + 1;
  }

  ShapeBorder getCardShape(final int index) {
    final Radius corner = Radius.circular(8);
    if (index == 0) {
      return RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: corner));
    }
    if (index == nbLines - 1) {
      return RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight: corner));
    }
    if (index == nbLines * (nbLines - 1)) {
      return RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: corner));
    }
    if (index == nbLines * nbLines - 1) {
      return RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomRight: corner));
    }
    return RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.zero));
  }

  void _onCardTapped(final int index) {
    bool newState = !widget.bingoCard.elementAt(index).isSelect;
    int points = 0;
    double nbLinesComplete = 0.0;

    if (widget.writePerm) {
      (newState) ? points += 1 : points -= 1;
      if (newState) {
        widget.bingoCard.elementAt(index).order = order;
        order += 1;
      }
      if (!newState) {
        widget.bingoCard.elementAt(index).order = -1;
        order -= 1;
      }
      setState(() {
        widget.bingoCard.elementAt(index).isSelect =
            !widget.bingoCard.elementAt(index).isSelect;
        points += checkBoard.checkColumn(widget.bingoCard, index, newState);
        points += checkBoard.checkLine(widget.bingoCard, index, newState);
        if (firstDiagonalValues.contains(index)) {
          points += checkBoard.checkDiagonal(
              widget.bingoCard, 0, newState, nbLines + 1);
        } else if (secondDiagonalValues.contains(index)) {
          points += checkBoard.checkDiagonal(
              widget.bingoCard, nbLines - 1, newState, nbLines - 1);
        }
        nbLinesComplete = points / 5;
        widget.addLine!(nbLinesComplete.round());
        if (newState && points % 5 == 0 || points == 9 || points == 13) {
          widget.controller!.play();
        }
        widget.changePoints!(points, index);
      });
    }
  }

  Color getCardColor(int index) {
    if (widget.bingoCard.elementAt(index).order <= widget.sliderValue) {
      if (widget.bingoCard.elementAt(index).isSelect == true) {
        if (widget.bingoCard.elementAt(index).nbLineComplete > 0) {
          return Colors.green[300]!;
        }
        return Theme.of(context).colorScheme.secondary;
      }
    }
    return Theme.of(context).cardColor;
  }

  Widget getIcon(final int index) {
    if (widget.bingoCard.elementAt(index).icon != null) {
      return Padding(
          padding: EdgeInsets.only(bottom: 7),
          child: Icon(
              IconDataSolid(int.parse(widget.bingoCard.elementAt(index).icon!)),
              size: 17,
              color: Colors.black));
    }
    return SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        controller: ScrollController(keepScrollOffset: false),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: nbLines,
        ),
        padding: EdgeInsets.all(10.0),
        itemCount: nbLines * nbLines,
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
                  child: Container(
                      margin: const EdgeInsets.all(0.5),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            getIcon(index),
                            Text(widget.bingoCard.elementAt(index).name,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black))
                          ]))),
            ),
          ));
        });
  }
}
