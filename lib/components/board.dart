import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:plaktago/components/dialog.dart';
import 'package:plaktago/data_class/bingo_card.dart';
import 'package:plaktago/game/board/check_board.dart';
import 'package:plaktago/utils/get_card_icon.dart';

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
      this.controller,
      })
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
    BingoCard card = widget.bingoCard.elementAt(index);
    bool newState = !card.isSelect;
    int points = 0;
    double nbLinesComplete = 0.0;

    if (widget.writePerm) {
      (newState) ? points += 1 : points -= 1;
      if (newState) {
        card.order = order;
        order += 1;
      }
      if (!newState) {
        card.order = -1;
        order -= 1;
      }
      setState(() {
        card.isSelect = !card.isSelect;
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

  void _displayCardDescription(final int index) {
    final BingoCard card = widget.bingoCard.elementAt(index);
    final String desc = card.desc == "" ? "Pas de description" : card.desc;

    PDialog(
      context: context,
      title: card.name,
      desc: desc,
      bntOkOnPress: () {},
      displayBtn: false
    ).show();
  }

  Color getCardColor(final BingoCard card) {
    if (card.order <= widget.sliderValue) {
      if (card.isSelect == true) {
        if (card.nbLineComplete > 0) {
          return Theme.of(context).colorScheme.primary;
        }
        return Theme.of(context).colorScheme.secondary;
      }
    }
    return Theme.of(context).cardColor;
  }

  @override
  Widget build(BuildContext context) {
    final double fontSize = MediaQuery.of(context).size.width * 0.032;

    return GridView.builder(
        controller: ScrollController(keepScrollOffset: false),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: nbLines, childAspectRatio: 100 / 125),
        padding: EdgeInsets.all(10.0),
        itemCount: nbLines * nbLines,
        itemBuilder: (BuildContext context, int index) {
          final BingoCard card = widget.bingoCard.elementAt(index);
          final Widget icon = getCardIcon(card, EdgeInsets.only(top: 15), context);
          final AlignmentGeometry textAlign = card.icon == null ? Alignment.center : Alignment.bottomCenter;
          const double horizonTextPadding = 2.0;
          final textStyle = TextStyle(fontSize: fontSize,fontWeight: FontWeight.w600,color: Colors.black);
          final Size txtSize = _textSize(card.name, textStyle);

          return Align(
            child: GestureDetector(
              onTap: () => _onCardTapped(index),
              onLongPress: () => _displayCardDescription(index),
              child: Card(
                  shape: getCardShape(index),
                  margin: const EdgeInsets.all(1),
                  color: getCardColor(card),
                  child: Container(
                      margin: const EdgeInsets.all(0.5),
                      child: Stack(alignment: Alignment.center, children: [
                        Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                                padding: EdgeInsets.only(top: 2), child: icon)),
                        Align(
                          alignment: textAlign,
                          child: LayoutBuilder(builder: (context, constraints) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: card.icon == null ? 0 : getTextPadding(txtSize.width, constraints.maxWidth), left: horizonTextPadding, right: horizonTextPadding),
                            child: Text(
                              card.name,
                              textAlign: TextAlign.center,
                              style: textStyle
                            )
                          );}
                        )),
                      ])))
            ),
          );
        });
  }

  double getTextPadding (final double txtWitdh, final double txtSpace) {
    print(txtSpace.toInt());
    print(txtWitdh.toInt());

    if (txtWitdh > txtSpace * 2) {
      return 10.0;
    }
    if (txtWitdh <= txtSpace) {
      return 25;
    }
    return 15.0;
  }
  
  Size _textSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style), maxLines: 1, textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }
}
