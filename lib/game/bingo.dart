import 'package:flutter/material.dart';
import 'board.dart';
import 'timer.dart';
import '../utils/saveGame.dart';

class Game extends StatefulWidget {
  final SaveGame saveGame;
  final String gameType;
  const Game({Key? key, required this.gameType, required this.saveGame})
      : super(key: key);

  @override
  State<Game> createState() => _Game();
}

class _Game extends State<Game> {
  void _saveGame() {
    widget.saveGame.writeGame();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Bingo ${widget.gameType}'),
          backgroundColor: Colors.orange,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.save,
                color: Colors.white,
              ),
              onPressed: _saveGame,
            )
          ],
        ),
        body: ListView(children: [
          Center(
              child: Row(
            children: [
              ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 300,
                    maxHeight: 150,
                  ),
                  child: CountUpTimerPage()),
            ],
          )),
          Center(
              child: ConstrainedBox(
                  constraints:
                      const BoxConstraints(maxHeight: 1000, maxWidth: 800),
                  child: Board(gameType: widget.gameType))),
        ]));
  }
}
