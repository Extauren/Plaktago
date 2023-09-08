import 'package:flutter/material.dart';
import 'package:plaktago/game/board/bingoCard.dart';
import 'package:plaktago/utils/appSettings.dart';
import 'package:plaktago/utils/saveGame.dart';
import '../game/bingo.dart';
import '../game/gameData.dart';
import 'drawer.dart';
import 'bingoTypeButton.dart';
import 'modeButton.dart';
import 'launchGame.dart';
import '../utils/bingoParams.dart';
import 'personalize.dart';
import 'package:plaktago/game/timer/timer.dart';

class Home extends StatefulWidget {
  GameData bingoParams;
  final Function changeTheme;
  final AppSettings appSettings;
  BingoParams playingGame;
  Home(
      {Key? key,
      required this.changeTheme,
      required this.appSettings,
      required this.bingoParams,
      required this.playingGame})
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
    Map<String, dynamic> game = await SaveGame().getOnGoingGame();
    BingoType bingoType = BingoType.sousterrain;

    if (game.toString() != "{}") {
      if (game["gameType"] == "Plaque") {
        bingoType = BingoType.plaque;
      }
      widget.bingoParams.setBingoCards(List<BingoCard>.from(
          game["bingoCardList"].map((model) => BingoCard.fromMap(model))));
      setState(() {
        widget.bingoParams.setIsPlaying(true);
      });
      widget.bingoParams.setPoints(game["points"]);
      widget.bingoParams
          .setBingoParams(BingoParams(bingoType: bingoType, mode: Mode.random));
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
    widget.bingoParams.setTimer(Timer(timer: 0));
    widget.playingGame = widget.bingoParams.bingoParams.clone();
    Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    Game(bingoParams: widget.bingoParams, newGame: true)))
        .then((value) {
      updateState();
    });
  }

  void launchGame() {
    final int nbCardNeed = 16 - nbCards;
    BuildContext dialogContext;

    if (nbCards < 16 &&
        widget.bingoParams.bingoParams.mode == Mode.personalize) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Text("Erreur", style: TextStyle(color: Colors.black)),
                content: Text(
                    style: TextStyle(color: Colors.black),
                    "Vous devez sélectionner $nbCardNeed cases supplémentaires"),
                backgroundColor: Colors.red[300]);
          });
      return;
    }
    if (widget.bingoParams.isPlaying) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            dialogContext = context;
            return AlertDialog(
                title: Text(
                    "Vous avez déja une partie en cours, êtes vous sur de vouloir la supprimer ?",
                    style: TextStyle(color: Colors.black, fontSize: 18)),
                content:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                      margin: EdgeInsets.only(right: 20),
                      child: ElevatedButton(
                          onPressed: () =>
                              {Navigator.pop(dialogContext), startGame()},
                          child: Text("Oui",
                              style: TextStyle(color: Colors.black)))),
                  Container(
                      margin: EdgeInsets.only(left: 20),
                      child: ElevatedButton(
                          onPressed: () => {Navigator.pop(dialogContext)},
                          child: Text("Non",
                              style: TextStyle(color: Colors.black))))
                ]),
                backgroundColor: Colors.grey[300]);
          });
      return;
    }
    startGame();
  }

  void comeBacktoGame() {
    Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    Game(bingoParams: widget.bingoParams, newGame: false)))
        .then((value) {
      updateState();
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
            changeTheme: widget.changeTheme, appSettings: widget.appSettings),
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
              margin: EdgeInsets.only(top: 40),
              child: BingoTypeButton(
                  key: bingoTypeKey,
                  bingoType: widget.bingoParams.bingoParams.bingoType,
                  updateBingoType:
                      widget.bingoParams.bingoParams.updateBingoType,
                  updateParentState: updateState)),
          Container(
              margin: EdgeInsets.only(top: 40, bottom: 50),
              child: ModeButton(
                  mode: widget.bingoParams.bingoParams.mode,
                  updateBingoMode: widget.bingoParams.bingoParams.updateMode,
                  updateParentState: updateState)),
          if (widget.bingoParams.bingoParams.mode == Mode.personalize)
            NotificationListener(
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
                        controller: _childScrollController))),
          if ((widget.bingoParams.bingoParams.mode == Mode.personalize) ||
              widget.bingoParams.bingoParams.mode == Mode.random)
            Align(
              child: Container(
                  constraints: BoxConstraints(maxWidth: 100),
                  margin: EdgeInsets.symmetric(vertical: 00),
                  child: LaunchGame(
                      launchGame: launchGame,
                      btek: btek,
                      nbCards: nbCards,
                      mode: widget.bingoParams.bingoParams.mode)),
            )
        ]));
  }
}
