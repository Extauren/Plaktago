import 'package:flutter/material.dart';
import 'board.dart';
import 'timer.dart';

class Game extends StatefulWidget {
  final String gameType;
  const Game({Key? key, required this.gameType}) : super(key: key);

  @override
  State<Game> createState() => _Game();
}

class _Game extends State<Game> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Bingo ${widget.gameType}'),
          backgroundColor: Colors.orange,
        ),
        body: ListView(children: [
          Center(
              child: Row(
            children: [
              ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 400,
                    maxHeight: 200,
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
