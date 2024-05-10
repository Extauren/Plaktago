import 'package:flutter/material.dart';
import 'dart:async';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plaktago/components/app_bar.dart';
import 'package:plaktago/components/outlined_button.dart';
import 'package:plaktago/game/create_game.dart';
import 'package:plaktago/game/display_score.dart';
import 'package:plaktago/game/game_action.dart';
import 'package:plaktago/game/timer/display_timer.dart';
import 'package:plaktago/game/timer/timer.dart';
import 'package:plaktago/home/mode_button.dart';
import 'package:plaktago/utils/get_icon.dart';
import 'package:plaktago/utils/isar_service.dart';
import 'package:plaktago/data_class/game.dart';
import 'package:plaktago/game/board/board.dart';

class Bingo extends StatefulWidget {
  final Game bingoParams;
  final bool newGame;
  final IsarService isarService;
  final int id;
  final bool displayTimer;
  Bingo({
    Key? key,
    required this.bingoParams,
    required this.newGame,
    required this.isarService,
    this.id = -1,
    required this.displayTimer,
  }) : super(key: key);

  @override
  State<Bingo> createState() => _Bingo();
}

class _Bingo extends State<Bingo> {
  late BingoTimer timer;
  late Timer saveTimer;
  late GameAction gameAction; 

  @override
  void initState() {
    super.initState();

    widget.bingoParams.isPlaying = true;
    timer = BingoTimer(time: widget.bingoParams.time);
    if (widget.newGame) {
      widget.bingoParams.points = 0;
      if (widget.bingoParams.mode == Mode.random) {
        widget.bingoParams.bingoCards = createCardGame(widget.bingoParams, widget.newGame, 16);
      }
    }
    gameAction = GameAction(isarService: widget.isarService);
    widget.isarService.saveTempGame(widget.bingoParams);
    saveTimer = Timer.periodic(
      const Duration(seconds: 60),
      (t) => () => widget.isarService.saveTempGame(widget.bingoParams),
    );
  }

  void addLines(final int newLines) => widget.bingoParams.nbLines += newLines;

  void changePoints(final int newPoint, final int index) {
    setState(() {
      widget.bingoParams.points += newPoint;
      widget.bingoParams.time = timer.getTime();
      widget.isarService.saveTempGame(widget.bingoParams);
      if (widget.bingoParams.points == 56) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(style: TextStyle(color: Colors.black), "Bingo"),
              content: Image.asset('assets/logo.png'),
              backgroundColor: Colors.yellow[300]
            );
          }
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final double borderHeight = MediaQuery.of(context).size.width / 7.9;
    final double width = MediaQuery.of(context).size.width / 2.8;
    return Scaffold(
      appBar: PAppBar(
        title: Row(
          children: [
            getIcon(widget.bingoParams.bingoType),
            SizedBox(width: 15),
            Text('Bingo ${widget.bingoParams.bingoType.name}'),
          ]
        ),
        actions: [
          IconButton(
            icon: Icon(FontAwesomeIcons.trash),
            onPressed: () => gameAction.askDeleteGame(context, widget.bingoParams),
            color: Theme.of(context).colorScheme.primary)
        ]
      ),
      body: ListView(
        children: [
          Align(
            child: Container(
              margin: EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.displayTimer)
                    DisplayTimer(borderHeight: borderHeight, width: width, timer: timer),
                  DisplayScore(score: widget.bingoParams.points, borderHeight: borderHeight, width: width)
                ]
              )
            )
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 20),
              child: Board(
                changePoints: changePoints,
                bingoCard: widget.bingoParams.bingoCards,
                addLine: addLines,
              )
            )
          ),
          POutlinedButton(
            label: "Enregistrer la partie",
            width: MediaQuery.of(context).size.width / 1.7,
            onPressed: () => gameAction.askSaveGame(context, widget.bingoParams),
            iconData: Icons.save,
            margin: EdgeInsets.only(bottom: 10, top: 10),
            labelFontSize: MediaQuery.of(context).size.width / 25,
          ),
        ]
      )
    );
  }
}
