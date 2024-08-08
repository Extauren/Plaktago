import 'package:flutter/material.dart';
import 'package:plaktago/components/border_button.dart';
import 'package:plaktago/data_class/game.dart';
import 'package:plaktago/game/bingo.dart';
import 'package:plaktago/utils/isar_service.dart';

class ComeBacktoGameButton extends StatefulWidget{
  final Future<List<Game>?> onGoingGames;
  final IsarService isarService;
  final bool displayTimer;
  final Function getOnGoingGame;

  ComeBacktoGameButton({
    Key? key,
    required this.onGoingGames,
    required this.isarService,
    required this.displayTimer,
    required this.getOnGoingGame
  });
  
  @override
  State<ComeBacktoGameButton> createState() => _ComeBacktoGameButton();
}

class _ComeBacktoGameButton extends State<ComeBacktoGameButton> {
  
  void _comeBacktoGame() async {
    List<Game>? test = await widget.onGoingGames;
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Bingo(
                gameList: test!,
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
    return FutureBuilder<List<Game>?>(
      future: widget.onGoingGames,
      builder: (BuildContext context, AsyncSnapshot<List<Game>?> snapshot) {
        Color backgroundColor = Colors.grey[600]!;
        void Function() comeBack = () {};
        String label = "Reprendre la partie";
        if (snapshot.hasData) {
          if (snapshot.data!.isNotEmpty) {
            backgroundColor = Theme.of(context).colorScheme.primary;
            comeBack = _comeBacktoGame;
            if (snapshot.data!.length > 1) label = "Reprendre les parties";
          }
        }
        return Align(
          child: Padding(
              padding: EdgeInsets.only(top: 30),
              child: PBorderButton(
                heroTag: "oldGame",
                label: label,
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