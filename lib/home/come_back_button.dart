import 'package:flutter/material.dart';
import 'package:plaktago/components/border_button.dart';
import 'package:plaktago/data_class/game.dart';
import 'package:plaktago/game/bingo.dart';
import 'package:plaktago/utils/isar_service.dart';

class ComeBacktoGameButton extends StatefulWidget{
  final Future<Game?> game;
  final Game activeGame;
  final IsarService isarService;
  final bool displayTimer;
  final Function getOnGoingGame;

  ComeBacktoGameButton({
    Key? key,
    required this.game,
    required this.activeGame,
    required this.isarService,
    required this.displayTimer,
    required this.getOnGoingGame
  });
  
  @override
  State<ComeBacktoGameButton> createState() => _ComeBacktoGameButton();
}

class _ComeBacktoGameButton extends State<ComeBacktoGameButton> {
  
  void _comeBacktoGame() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Bingo(
                bingoParams: widget.activeGame,
                newGame: false,
                isarService: widget.isarService,
                displayTimer: widget.displayTimer))).then((value) {
      setState(() {
        widget.getOnGoingGame();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Game?>(
      future: widget.game,
      builder: (BuildContext context, AsyncSnapshot<Game?> snapshot) {
        Color backgroundColor = Colors.grey[600]!;
        void Function() comeBack = () {};
        if (snapshot.hasData) {
          if (snapshot.data!.isPlaying) {
            backgroundColor = Theme.of(context).colorScheme.primary;
            comeBack = _comeBacktoGame;
          }
        }
        return Align(
          child: Padding(
              padding: EdgeInsets.only(top: 30),
              child: PBorderButton(
                heroTag: "oldGame",
                label: "Reprendre la partie",
                onPressed: comeBack,
                width: 180,
                height: 42,
                labelStyle: TextStyle(fontSize: 16, color: Colors.black),
                backgroundColor: backgroundColor,
                splashColor: backgroundColor,
        )));
      });
  }

}