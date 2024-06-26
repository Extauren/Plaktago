import 'package:flutter/material.dart';
import 'package:plaktago/components/border_button.dart';
import 'package:plaktago/data_class/bingo_card.dart';
import 'package:plaktago/data_class/game.dart';
import 'package:plaktago/home/come_back_button.dart';
import 'package:plaktago/home/personalize/perso.dart';
import 'package:plaktago/utils/isar_service.dart';
import 'package:plaktago/data_class/app_settings.dart';
import 'package:plaktago/game/bingo.dart';
import 'package:plaktago/home/bingo_type_button.dart';
import 'package:plaktago/home/mode_button.dart';
import 'package:plaktago/home/personalize/personalize.dart';
import 'package:plaktago/components/dialog.dart';

class Home extends StatefulWidget {
  final Game bingoParams;
  final Function changeTheme;
  final AppSettings appSettings;
  final IsarService isarService;

  Home({
    Key? key,
    required this.changeTheme,
    required this.appSettings,
    required this.bingoParams,
    required this.isarService
  }) : super(key: key);

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  final Key bingoTypeKey = PageStorageKey('bingoType');
  int nbCards = 0;
  List<PersonalizeCard> persCard = [];
  ScrollController parentScrollController = ScrollController();
  Game activeGame = Game();
  Future<Game?> futureGame = Future.value(null);

  @override
  void initState() {
    super.initState();
    getOnGoingGame();
  }

  void getOnGoingGame() async {
    Game? game = await widget.isarService.getOnGoingGame();
    if (game != null) {
      setState(() {
        activeGame = game;
        futureGame = widget.isarService.getOnGoingGame();
      });
    } else {
      setState(() {
        futureGame = Future.value(null);
      });
    }
  }

  void changeNbCardValue(int value) => setState(() { nbCards = value; });

  void updateBingoType(final BingoType bingoType) => setState(() { widget.bingoParams.bingoType = bingoType; });

  void setMode(final Mode mode) => setState(() { widget.bingoParams.mode = mode; });

  void startGame() {
    if (widget.bingoParams.mode == Mode.personalize) {
      List<BingoCard> buffer = [];
      for (int it = 0; it < persCard.length; it++) {
        buffer.add(BingoCard(
          name: persCard.elementAt(it).name,
          icon: persCard.elementAt(it).icon
        ));
      }
      buffer.shuffle();
      widget.bingoParams.bingoCards = buffer;
    }
    activeGame = widget.bingoParams;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Bingo(
          bingoParams: activeGame,
          newGame: true,
          isarService: widget.isarService,
          displayTimer: widget.appSettings.displayTimer
        ))).then((value) {
        nbCards = 0;
        setState(() {
          getOnGoingGame();
        });
      }
    );
  }

  void launchGame() {
    final int nbCardNeed = 16 - nbCards;

    if (nbCards < 16 && widget.bingoParams.mode == Mode.personalize) {
      PDialog(
        context: context,
        desc: 'Vous devez sélectionner $nbCardNeed cases supplémentaires',
        title: "Erreur",
        bntOkOnPress: () {}
      ).show();
      return;
    }
    if (activeGame.isPlaying) {
      PDialog(
        context: context,
        title: 'Partie en cours',
        desc: 'Vous avez déja une partie en cours, êtes vous sur de vouloir la supprimer ?',
        bntOkOnPress: startGame
      ).show();
      return;
    }
    startGame();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        Widget plaque = Container();
        if (constraints.maxHeight > 640) {
          plaque = Container(
            margin: const EdgeInsets.only(top: 0, left: 80, right: 80),
            child: Image.asset('assets/homePlaque.png')
          );
        }
        return Scaffold(
          body: ListView(
            controller: parentScrollController,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20, left: 60, right: 60),
                child: Image.asset('assets/lettrahge0_1x.png')
              ),
              ComeBacktoGameButton(
                game: futureGame,
                activeGame: activeGame,
                isarService: widget.isarService,
                displayTimer: widget.appSettings.displayTimer,
                getOnGoingGame: getOnGoingGame
              ),
              Container(
                margin: EdgeInsets.only(top: 40, left: 0, right: 0),
                child: BingoTypeButton(
                  key: bingoTypeKey,
                  bingoType: widget.bingoParams.bingoType,
                  updateBingoType: updateBingoType,
                )
              ),
              Container(
                margin: EdgeInsets.only(top: 40, bottom: 0),
                child: ModeButton(
                  mode: widget.bingoParams.mode,
                  updateBingoMode: setMode,
                )
              ),
              if (widget.bingoParams.mode == Mode.personalize)
                Perso(
                  parentScrollController: parentScrollController,
                  cards: persCard,
                  type: widget.bingoParams.bingoType,
                  nbCards: nbCards,
                  changeNbCardValue: changeNbCardValue,
                ),
              Align(
                child: Padding(
                  padding: EdgeInsets.only(top: 40, bottom: 20),
                  child: PBorderButton(
                    heroTag: "newGame",
                    label: "Jouer",
                    labelStyle: TextStyle(fontSize: 18, color: Colors.black),
                    onPressed: launchGame,
                    width: 120,
                    height: 42,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  )
                )
              ),
              plaque
            ]
          )
        );
      }
    );
  }
}