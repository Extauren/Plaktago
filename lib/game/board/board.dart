import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'dart:math';
import 'package:plaktago/components/board.dart';
import 'package:plaktago/components/outlined_button.dart';
import 'package:plaktago/data_class/bingo_card.dart';

class Board extends StatefulWidget {
  final Function changePoints;
  final List<BingoCard> bingoCard;
  final VoidCallback saveGame;
  final Function addLine;

  Board(
      {Key? key,
      required this.changePoints,
      required this.bingoCard,
      required this.saveGame,
      required this.addLine})
      : super(key: key);

  @override
  State<Board> createState() => _Board();
}

class _Board extends State<Board> {
  late ConfettiController _controllerCenter;

  @override
  void initState() {
    super.initState();
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 2));
  }

  @override
  void dispose() {
    _controllerCenter.dispose();
    super.dispose();
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
            colors: [Theme.of(context).colorScheme.secondary],
            createParticlePath: drawStar,
          ),
        ),
        SizedBox(
            height: MediaQuery.of(context).size.width / 0.8,
            child: PBoard(
              bingoCard: widget.bingoCard,
              writePerm: true,
              changePoints: widget.changePoints,
              addLine: widget.addLine,
              controller: _controllerCenter,
            )),
        POutlinedButton(
            label: "Enregistrer la partie",
            width: MediaQuery.of(context).size.width / 1.5,
            onPressed: widget.saveGame,
            iconData: Icons.save,
            margin: EdgeInsets.only(bottom: 10, top: 10)),
      ],
    );
  }
}
