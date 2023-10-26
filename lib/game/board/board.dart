import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'bingo_card.dart';
import 'check_board.dart';
import 'dart:math';

class Board extends StatefulWidget {
  final String gameType;
  final Function changePoints;
  final List<BingoCard> bingoCard;
  final int nbLines;
  final VoidCallback saveGame;
  final Function addLine;

  Board(
      {Key? key,
      required this.gameType,
      required this.changePoints,
      required this.bingoCard,
      required this.nbLines,
      required this.saveGame,
      required this.addLine})
      : super(key: key);

  @override
  State<Board> createState() => _Board();
}

class _Board extends State<Board> {
  static List<int> firstDiagonalValues = [];
  static List<int> secondDiagonalValues = [];
  static CheckBoard checkBoard = CheckBoard(nbLines: 0);
  late int order;
  late ConfettiController _controllerCenter;

  @override
  void initState() {
    super.initState();
    firstDiagonalValues = List<int>.generate(
        widget.nbLines, (index) => index * (widget.nbLines + 1));
    secondDiagonalValues = List<int>.generate(
        widget.nbLines, (index) => (widget.nbLines - 1) * (index + 1));
    checkBoard = CheckBoard(nbLines: widget.nbLines);
    order = getMaxOrder();
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 2));
  }

  @override
  void dispose() {
    _controllerCenter.dispose();
    super.dispose();
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

  Color getCardColor(int index) {
    if (widget.bingoCard.elementAt(index).isSelect == true) {
      if (widget.bingoCard.elementAt(index).nbLineComplete > 0) {
        return Color.fromRGBO(153, 219, 129, 1);
      }
      return Theme.of(context).colorScheme.primary;
    }
    return Theme.of(context).cardColor;
  }

  void _onCardTapped(final int index) {
    bool newState = !widget.bingoCard.elementAt(index).isSelect;
    int points = 0;
    double nbLines = 0.0;

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
            widget.bingoCard, 0, newState, widget.nbLines + 1);
      } else if (secondDiagonalValues.contains(index)) {
        points += checkBoard.checkDiagonal(
            widget.bingoCard, widget.nbLines - 1, newState, widget.nbLines - 1);
      }
      nbLines = points / 5;
      widget.addLine(nbLines.round());
      if (newState && points % 5 == 0 || points == 9 || points == 13) {
        _controllerCenter.play();
      }
      widget.changePoints(points, index);
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

  Path drawStar(Size size) {
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: ConfettiWidget(
            confettiController: _controllerCenter,
            blastDirectionality: BlastDirectionality.explosive,
            numberOfParticles: 35,
            colors: const [
              Colors.yellow,
            ],
            createParticlePath: drawStar,
          ),
        ),
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
                                          widget.bingoCard
                                              .elementAt(index)
                                              .name,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black)))),
                            ),
                          )));
                })),
        Align(
            child: Container(
                height: 50,
                width: 230,
                margin: EdgeInsets.only(bottom: 10),
                child: FloatingActionButton.extended(
                  onPressed: widget.saveGame,
                  backgroundColor:
                      Theme.of(context).colorScheme.primary, //Colors.grey[100],
                  splashColor: Theme.of(context).colorScheme.primary,
                  icon: Icon(
                    Icons.save,
                    color: Colors.black,
                  ),
                  label: Text("Sauvergarder la partie"),
                ))),
      ],
    );
  }
}
