import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:plaktago/game/board/bingo_card.dart';
import 'package:plaktago/utils/game/game.dart';
import 'package:plaktago/utils/isar_service.dart';
import 'package:plaktago/utils/app_settings.dart';
import '../game/bingo.dart';
import '../game/game_data.dart';
import 'drawer.dart';
import 'bingo_type_button.dart';
import 'mode_button.dart';
import 'launch_game.dart';
import '../utils/bingo_params.dart';
import 'personalize.dart';
import 'package:plaktago/game/timer/timer.dart';

class Home extends StatefulWidget {
  GameData bingoParams;
  final Function changeTheme;
  final AppSettings appSettings;
  BingoParams playingGame;
  IsarService isarService;
  Home(
      {Key? key,
      required this.changeTheme,
      required this.appSettings,
      required this.bingoParams,
      required this.playingGame,
      required this.isarService})
      : super(key: key);

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  final Key bingoTypeKey = PageStorageKey('bingoType');
  final Key personalizeKey = PageStorageKey('personalizeKey');
  int nbCards = 0;
  ScrollController _childScrollController = ScrollController();
  ScrollController _parentScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    getOnGoingGame();
  }

  void getOnGoingGame() async {
    Game? game = await widget.isarService.getOnGoingGame();
    if (game != null) {
      setState(() {
        widget.bingoParams.setIsPlaying(true);
      });
      widget.bingoParams.setPoints(game.points);
      widget.bingoParams.setBingoCards(game.bingoCardList);
      widget.bingoParams.setBingoParams(
          BingoParams(bingoType: game.bingoType, mode: Mode.random));
    }
  }

  void updateState() {
    setState(() {});
  }

  void resetHome() {
    setState(() {
      widget.bingoParams.setBingoParams(BingoParams());
      widget.bingoParams.setPersonalizeCards([]);
      nbCards = 0;
    });
  }

  void changeNbCardValue(int value) {
    setState(() {
      nbCards += value;
    });
  }

  void startGame() {
    widget.bingoParams.setTimer(Timer(time: widget.bingoParams.time));
    //widget.playingGame = widget.bingoParams.bingoParams.clone();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Bingo(
                bingoParams: widget.bingoParams,
                newGame: true,
                isarService: widget.isarService))).then((value) {
      updateState();
    });
  }

  void launchGame() {
    final int nbCardNeed = 16 - nbCards;
    if (nbCards < 16 &&
        widget.bingoParams.bingoParams.mode == Mode.personalize) {
      AwesomeDialog(
        context: context,
        animType: AnimType.scale,
        dialogType: DialogType.error,
        headerAnimationLoop: false,
        dialogBackgroundColor: Colors.grey[300],
        body: Center(
          child: Text(
            'Vous devez sélectionner $nbCardNeed cases supplémentaires',
            style: TextStyle(fontStyle: FontStyle.italic, color: Colors.black),
          ),
        ),
        title: 'Erreur',
        titleTextStyle: TextStyle(color: Colors.black),
        desc: 'This is also Ignored',
        btnOkOnPress: () {},
      ).show();
      return;
    }
    if (widget.bingoParams.isPlaying) {
      AwesomeDialog(
        context: context,
        animType: AnimType.scale,
        dialogType: DialogType.warning,
        headerAnimationLoop: false,
        dialogBackgroundColor: Colors.grey[300],
        title: 'Partie en cours',
        titleTextStyle:
            TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        desc:
            'Vous avez déja une partie en cours, êtes vous sur de vouloir la supprimer ?',
        descTextStyle: TextStyle(color: Colors.black),
        btnOkOnPress: startGame,
        btnCancelText: "Annuler",
        btnCancelOnPress: () => {},
      ).show();
      return;
    }
    startGame();
  }

  void comeBacktoGame() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Bingo(
                  bingoParams: widget.bingoParams,
                  newGame: false,
                  isarService: widget.isarService,
                ))).then((value) {
      updateState();
    });
  }

  void setIsAcool() {
    setState(() {
      widget.bingoParams.setIsAlcool();
    });
  }

  void btek() {
    print("BTek");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Text(
                'Plaktago',
              ),
            ],
          ),
        ),
        drawer: DrawerApp(
            changeTheme: widget.changeTheme,
            appSettings: widget.appSettings,
            isarService: widget.isarService),
        body: ListView(controller: _parentScrollController, children: [
          Container(
              margin: const EdgeInsets.only(
                  top: 60.0, left: 10, right: 10, bottom: 20),
              child: Text("Le bingo des catacombes",
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center)),
          if (widget.bingoParams
              .isPlaying) //context.watch<GameData>().isPlaying == true)
            // Consumer<GameData>(builder: (context, provider, child) {
            //   var gameData = context.watch<GameData>();
            Align(
                child: Container(
                    margin: EdgeInsets.only(top: 10),
                    constraints: BoxConstraints(maxWidth: 180),
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: ElevatedButton(
                      onPressed: comeBacktoGame,
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Theme.of(context).colorScheme.secondary)),
                      child: Text(
                        'Reprendre la partie',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black),
                      ),
                    ))),
          Container(
              margin: EdgeInsets.only(top: 40, left: 5, right: 5),
              child: BingoTypeButton(
                  key: bingoTypeKey,
                  bingoType: widget.bingoParams.bingoParams.bingoType,
                  updateBingoType:
                      widget.bingoParams.bingoParams.updateBingoType,
                  updateParentState: updateState)),
          Container(
              margin: EdgeInsets.only(top: 40, bottom: 0),
              child: ModeButton(
                  mode: widget.bingoParams.bingoParams.mode,
                  updateBingoMode: widget.bingoParams.bingoParams.updateMode,
                  updateParentState: updateState)),
          if (widget.bingoParams.bingoParams.mode == Mode.personalize)
            Container(
                margin: EdgeInsets.only(top: 40),
                child: NotificationListener(
                    onNotification: (ScrollNotification notification) {
                      if (notification is ScrollUpdateNotification) {
                        if (notification.metrics.pixels ==
                            notification.metrics.maxScrollExtent) {
                          _parentScrollController.animateTo(
                              _parentScrollController.position.maxScrollExtent,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        } else if (notification.metrics.pixels ==
                            notification.metrics.minScrollExtent) {
                          _parentScrollController.animateTo(
                              _parentScrollController.position.minScrollExtent,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        }
                      }
                      return true;
                    },
                    child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width,
                          maxHeight: MediaQuery.of(context).size.height,
                        ),
                        child: Personalize(
                            key: personalizeKey,
                            cards: widget.bingoParams.personalizeCard,
                            type: widget.bingoParams.bingoParams.bingoType,
                            nbCardSelect: nbCards,
                            changeNbCardValue: changeNbCardValue,
                            controller: _childScrollController)))),
          if (!widget.bingoParams.isAlcool)
            Container(
                margin: EdgeInsets.symmetric(vertical: 40, horizontal: 100),
                child: OutlinedButton(
                  onPressed: setIsAcool,
                  child: TextButton.icon(
                    onPressed: setIsAcool,
                    icon: Icon(
                      Icons.wine_bar,
                    ),
                    label: Text(
                      "Jeux d'alcool",
                    ),
                  ),
                )),
          if (widget.bingoParams.isAlcool)
            Container(
                margin: EdgeInsets.symmetric(vertical: 40, horizontal: 100),
                child: FilledButton(
                    onPressed: setIsAcool,
                    child: TextButton.icon(
                      onPressed: setIsAcool,
                      icon: Icon(
                        Icons.wine_bar,
                        color: Colors.black,
                      ),
                      label: Text(
                        "Jeux d'alcool",
                        style: TextStyle(color: Colors.black),
                      ),
                    ))),
          if ((widget.bingoParams.bingoParams.mode == Mode.personalize) ||
              widget.bingoParams.bingoParams.mode == Mode.random)
            Align(
              child: Container(
                  constraints: BoxConstraints(maxWidth: 100),
                  margin: EdgeInsets.only(bottom: 20),
                  child: LaunchGame(
                      launchGame: launchGame,
                      btek: btek,
                      nbCards: nbCards,
                      mode: widget.bingoParams.bingoParams.mode)),
            )
        ]));
  }
}
