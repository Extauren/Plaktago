import 'package:flutter/material.dart';
import 'board/board.dart';
import 'timer/timer.dart';
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
  static int points = 0;

  @override
  void initState() {
    super.initState();
    points = 0;
  }

  void _saveGame() {
    widget.saveGame.writeGame();
    Navigator.pop(context);
  }

  void changePoints(bool newPoint) {
    setState(() {
      if (newPoint) {
        points += 1;
      } else {
        points -= 1;
      }
    });
  }

  void resetPoints() {
    setState(() {
      points = 0;
    });
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
              Row(
                children: [
                  Text("Points : ",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                  Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        points.toString(),
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w400),
                      ))
                ],
              )
            ],
          )),
          Center(
              child: ConstrainedBox(
                  constraints:
                      const BoxConstraints(maxHeight: 500, maxWidth: 800),
                  child: Board(
                    gameType: widget.gameType,
                    changePoints: changePoints,
                    resetPoint: resetPoints,
                  ))),
        ]));
  }
}
