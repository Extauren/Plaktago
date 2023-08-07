import 'package:flutter/material.dart';
import 'package:plaktago/home/plaqueTypeButton.dart';
import 'package:plaktago/home/ratDropdownButton.dart';
import 'package:plaktago/utils/appSettings.dart';
import 'difficultyButton.dart';
import '../game/bingo.dart';
import 'drawer.dart';
import 'bingoTypeButton.dart';
import 'modeButton.dart';
import 'launchGame.dart';
import '../utils/bingoParams.dart';
import 'personalize.dart';
import 'package:plaktago/game/timer/timer.dart';

class Home extends StatefulWidget {
  BingoParams bingoParams;
  final Function changeTheme;
  final AppSettings appSettings;
  bool isPlaying;
  Timer timer;
  BingoParams playingGame;
  Home(
      {Key? key,
      required this.changeTheme,
      required this.appSettings,
      required this.bingoParams,
      required this.isPlaying,
      required this.timer,
      required this.playingGame})
      : super(key: key);

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  final Key bingoTypeKey = PageStorageKey('bingoType');
  final Key personalizeKey = PageStorageKey('personalizeKey');
  List<PersonalizeCard> personalizeCard = <PersonalizeCard>[];
  int nbCards = 0;

  void updateState() {
    setState(() {});
  }

  void resetHome() {
    setState(() {
      widget.bingoParams = BingoParams();
      personalizeCard = [];
      nbCards = 0;
    });
  }

  void changeIsPlaying(bool newValue) {
    if (widget.isPlaying != newValue) {
      widget.isPlaying = newValue;
    }
  }

  void changeNbCardValue(int value) {
    setState(() {
      nbCards += value;
    });
  }

  void launchGame() {
    final int nbCardNeed = 16 - nbCards;
    widget.timer = Timer(timer: 0);

    if (nbCards < 16 && widget.bingoParams.mode == Mode.personalize) {
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
    } else {
      widget.playingGame = widget.bingoParams.clone();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Game(
                  bingoParams: widget.playingGame,
                  personalizeCards: personalizeCard,
                  changeIsPlaying: changeIsPlaying,
                  timer: widget.timer,
                  newGame: true))).then((value) {
        updateState();
      });
    }
  }

  void comeBacktoGame() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Game(
                bingoParams: widget.playingGame,
                personalizeCards: personalizeCard,
                changeIsPlaying: changeIsPlaying,
                timer: widget.timer,
                newGame: false))).then((value) {
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
              // const Image(
              //   image: AssetImage('logo.png'),
              //   height: 40,
              //   width: 40, //MediaQuery.of(context).size.width / 2,
              // ),
              Container(
                  margin: const EdgeInsets.only(left: 0),
                  child: Text(
                    'Plaktago',
                  )),
            ],
          ),
          actions: <Widget>[
            if (widget.isPlaying == true)
              IconButton(
                icon: Icon(Icons.play_circle_fill_outlined,
                    color: Theme.of(context).colorScheme.primary, size: 28),
                onPressed: comeBacktoGame,
              )
          ],
        ),
        drawer: DrawerApp(
            changeTheme: widget.changeTheme, appSettings: widget.appSettings),
        body: ListView(children: [
          Container(
              margin: const EdgeInsets.only(top: 60.0, left: 10, right: 10),
              child: Text("Le bingo des catacombes",
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center)),
          // if (widget.isPlaying == true)
          //   Container(
          //       margin: EdgeInsets.only(top: 40, left: 60, right: 60),
          //       child: ElevatedButton(
          //         onPressed: comeBacktoGame,
          //         //style: ButtonStyle(
          //         //backgroundColor: MaterialStateProperty.all(
          //         //    Theme.of(context).colorScheme.secondary)),
          //         child: Text(
          //           'Reprendre la partie',
          //           style: TextStyle(color: Colors.black),
          //         ),
          //       )),
          Container(
              margin: EdgeInsets.only(top: 50),
              child: BingoTypeButton(
                  key: bingoTypeKey,
                  bingoType: widget.bingoParams.bingoType,
                  updateBingoType: widget.bingoParams.updateBingoType,
                  updateParentState: updateState)),
          Container(
              margin: EdgeInsets.only(top: 40, bottom: 50),
              child: ModeButton(
                  mode: widget.bingoParams.mode,
                  updateBingoMode: widget.bingoParams.updateMode,
                  updateParentState: updateState)),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            if (widget.bingoParams.mode == Mode.personalize)
              ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width,
                    maxHeight: MediaQuery.of(context).size.height,
                  ),
                  child: Personalize(
                      key: personalizeKey,
                      cards: personalizeCard,
                      type: widget.bingoParams.bingoType,
                      nbCardSelect: nbCards,
                      changeNbCardValue: changeNbCardValue))
            else if (widget.bingoParams.bingoType == BingoType.plaque &&
                widget.bingoParams.mode == Mode.random)
              ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width / 2,
                    maxHeight: 60,
                  ),
                  child: PlaqueTypeButton(
                    selectecPlaque: widget.bingoParams.plaque,
                    updatePlaque: widget.bingoParams.updatePlaque,
                  )),
            if (widget.bingoParams.bingoType == BingoType.sousterrain &&
                widget.bingoParams.mode == Mode.random)
              ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width / 2,
                    maxHeight: 60,
                  ),
                  child: RatDropdownButton(
                      type: widget.bingoParams.ratType,
                      update: widget.bingoParams.updateRat)),
            if (widget.bingoParams.mode == Mode.random)
              ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width / 2,
                    maxHeight: 60,
                  ),
                  child: DifficultyButton(
                      difficulty: widget.bingoParams.difficulty,
                      update: widget.bingoParams.updateDifficulty)),
          ]),
          if ((widget.bingoParams.mode == Mode.personalize) ||
              widget.bingoParams.mode == Mode.random)
            Container(
                margin: EdgeInsets.symmetric(vertical: 50),
                child: LaunchGame(
                    launchGame: launchGame,
                    btek: btek,
                    nbCards: nbCards,
                    mode: widget.bingoParams.mode)),
        ]));
  }
}