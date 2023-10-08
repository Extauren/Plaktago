import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:plaktago/game/board/bingo_card.dart';
import 'package:plaktago/utils/game/game.dart';
import 'package:plaktago/utils/isar_service.dart';
import 'package:plaktago/utils/app_settings.dart';
import '../game/bingo.dart';
import 'drawer.dart';
import 'bingo_type_button.dart';
import 'mode_button.dart';
import 'launch_game.dart';
import 'personalize.dart';

class Home extends StatefulWidget {
  final Game bingoParams;
  final Function changeTheme;
  final AppSettings appSettings;
  final IsarService isarService;
  Home(
      {Key? key,
      required this.changeTheme,
      required this.appSettings,
      required this.bingoParams,
      required this.isarService})
      : super(key: key);

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  final Key bingoTypeKey = PageStorageKey('bingoType');
  final Key personalizeKey = PageStorageKey('personalizeKey');
  int nbCards = 0;
  List<PersonalizeCard> persCard = [];
  ScrollController _childScrollController = ScrollController();
  ScrollController _parentScrollController = ScrollController();
  Game activeGame = Game();
  late Future<Game?> test = Future.value(null);

  @override
  void initState() {
    super.initState();
    getOnGoingGame();
    test = widget.isarService.getOnGoingGame();
  }

  void getOnGoingGame() async {
    Game? game = await widget.isarService.getOnGoingGame();
    if (game != null) {
      setState(() {
        activeGame = game;
      });
    }
    test = widget.isarService.getOnGoingGame();
  }

  void resetHome() {
    setState(() {
      widget.bingoParams.resetGameData();
      nbCards = 0;
    });
  }

  void changeNbCardValue(int value) {
    setState(() {
      nbCards += value;
    });
  }

  void startGame() {
    if (widget.bingoParams.mode == Mode.personalize) {
      List<BingoCard> buffer = [];
      for (int it = 0; it < persCard.length; it++) {
        buffer.add(BingoCard(name: persCard.elementAt(it).name));
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
                isarService: widget.isarService))).then((value) {
      nbCards = 0;
      setState(() {
        test = Future.value(null);
        getOnGoingGame();
      });
    });
  }

  void launchGame() {
    final int nbCardNeed = 16 - nbCards;
    if (nbCards < 16 && widget.bingoParams.mode == Mode.personalize) {
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
    if (activeGame.isPlaying) {
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
        btnCancelOnPress: () {},
      ).show();
      return;
    }
    startGame();
  }

  void refresh() {
    setState(() {});
  }

  void comeBacktoGame() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Bingo(
                bingoParams: activeGame,
                newGame: false,
                isarService: widget.isarService))).then((value) {
      setState(() {
        test = Future.value(null);
        getOnGoingGame();
      });
    });
  }

  void setIsAcool() {
    setState(() {
      if (widget.bingoParams.isAlcool) {
        widget.bingoParams.isAlcool = false;
      } else {
        widget.bingoParams.isAlcool = true;
      }
    });
  }

  void btek() {
    print("BTek");
  }

  void updateBingoType(final BingoType bingoType) {
    setState(() {
      widget.bingoParams.bingoType = bingoType;
    });
  }

  void setMode(final Mode mode) {
    setState(() {
      widget.bingoParams.mode = mode;
    });
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
          FutureBuilder<Game?>(
              future: test,
              builder: (BuildContext context, AsyncSnapshot<Game?> snapshot) {
                Widget child = Container();
                if (snapshot.hasData) {
                  if (snapshot.data != null && activeGame.isPlaying) {
                    child = Align(
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
                                "Reprendre la partie",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.black),
                              ),
                            )));
                  }
                }
                return child;
              }),
          Container(
              margin: EdgeInsets.only(top: 40, left: 5, right: 5),
              child: BingoTypeButton(
                key: bingoTypeKey,
                bingoType: widget.bingoParams.bingoType,
                updateBingoType: updateBingoType,
              )),
          Container(
              margin: EdgeInsets.only(top: 40, bottom: 0),
              child: ModeButton(
                mode: widget.bingoParams.mode,
                updateBingoMode: setMode,
              )),
          if (widget.bingoParams.mode == Mode.personalize)
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
                            cards: persCard,
                            type: widget.bingoParams.bingoType,
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
                  ),
                )),
          Align(
            child: Container(
                //constraints: BoxConstraints(maxWidth: 200),
                width: 130,
                margin: EdgeInsets.only(bottom: 20),
                child: LaunchGame(
                    launchGame: launchGame,
                    btek: btek,
                    nbCards: nbCards,
                    mode: widget.bingoParams.mode)),
          )
        ]));
  }
}
