import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plaktago/components/app_bar.dart';
import 'package:plaktago/components/outlined_button.dart';
import 'package:plaktago/game/display_score.dart';
import 'package:plaktago/game/game_action.dart';
import 'package:plaktago/game/timer/display_timer.dart';
import 'package:plaktago/game/timer/timer.dart';
import 'package:plaktago/utils/get_icon.dart';
import 'package:plaktago/utils/isar_service.dart';
import 'package:plaktago/data_class/game.dart';
import 'package:plaktago/game/board/board.dart';

class Bingo extends StatefulWidget {
  final List<Game> gameList;
  final bool newGame;
  final IsarService isarService;
  final bool displayTimer;

  Bingo({
    Key? key,
    required this.gameList,
    required this.newGame,
    required this.isarService,
    required this.displayTimer,
  }) : super(key: key);

  @override
  State<Bingo> createState() => _Bingo();
}

class _Bingo extends State<Bingo> {
  late BingoTimer timer;
  late Timer saveTimer;
  late GameAction gameAction;
  int value = 0;
  List<int> choosePartieList = [];

  @override
  void initState() {
    super.initState();

    choosePartieList = Iterable<int>.generate(widget.gameList.length).toList();
    timer = BingoTimer(time: widget.gameList.elementAt(value).time);
    gameAction = GameAction(isarService: widget.isarService);
    saveTimer = Timer.periodic(
      const Duration(seconds: 60),
      (t) => () => widget.isarService.saveTempGame(widget.gameList.elementAt(value)),
    );
  }

  void addLines(final int newLines) => widget.gameList.elementAt(value).nbLines += newLines;

  void changePoints(final int newPoint, final int index) {
    setState(() {
      widget.gameList.elementAt(value).points += newPoint;
      widget.gameList.elementAt(value).time = timer.getTime();
      widget.isarService.saveTempGame(widget.gameList.elementAt(value));
      if (widget.gameList.elementAt(value).points == 56) {
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

  void _deleteGame() {
    bool isDelete = false;

    isDelete = gameAction.askDeleteGame(context, widget.gameList.elementAt(value).id);
    if (isDelete) {
      setState(() {
        widget.gameList.removeWhere((element) => element.id == widget.gameList.elementAt(value).id);
        choosePartieList.removeLast();
        value = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double borderHeight = MediaQuery.of(context).size.width / 7.9;
    final double width = MediaQuery.of(context).size.width / 2.8;
    return Scaffold(
      appBar: PAppBar(
        title: Row(
          children: [
            getIcon(widget.gameList.elementAt(value).bingoType),
            SizedBox(width: 15),
            Text('Bingo ${widget.gameList.elementAt(value).bingoType.name}'),
          ]
        ),
        actions: [
          IconButton(
            icon: Icon(FontAwesomeIcons.trash),
            onPressed: _deleteGame,
            color: Theme.of(context).colorScheme.primary)
        ]
      ),
      body: ListView(
        children: [
          if (widget.gameList.length > 1)
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 20),
                child: SizedBox(
                  height: 40,
                  width: widget.gameList.length * ((MediaQuery.of(context).size.width / 4) - 10),
                  child: AnimatedToggleSwitch<int>.size(
                    textDirection: TextDirection.ltr,
                    current: value,
                    values: choosePartieList,
                    iconOpacity: 0.2,
                    indicatorSize: const Size.fromWidth(100),
                    customIconBuilder: (context, local, global) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('${local.value + 1}', style: TextStyle(color: Colors.black)),
                          // alternativeIconBuilder(context, local, global),
                        ],
                      );
                    },
                    style: ToggleStyle(borderColor: Colors.transparent),
                    styleBuilder: (i) => ToggleStyle(
                      indicatorColor: Theme.of(context).colorScheme.primary
                    ),
                    onChanged: (i) => setState(() => value = i),
                  )
                )
              )
            ),
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
                  DisplayScore(score: widget.gameList.elementAt(value).points, borderHeight: borderHeight, width: width)
                ]
              )
            )
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 20),
              child: Board(
                changePoints: changePoints,
                bingoCard: widget.gameList.elementAt(value).bingoCards,
                addLine: addLines,
              )
            )
          ),
          POutlinedButton(
            margin: EdgeInsets.only(bottom: 20, top: 20),
            label: "Enregistrer la partie",
            width: MediaQuery.of(context).size.width / 1.7,
            onPressed: () => gameAction.askSaveGame(context, widget.gameList.elementAt(value)),
            iconData: Icons.save,
            labelFontSize: MediaQuery.of(context).size.width / 25,
          ),
        ]
      )
    );
  }
}
