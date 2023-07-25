import 'package:flutter/material.dart';
import 'package:plaktago/home/plaqueTypeButton.dart';
import 'package:plaktago/home/ratDropdownButton.dart';
import 'package:plaktago/utils/appSettings.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
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
  final Function changeTheme;
  final AppSettings appSettings;
  const Home({Key? key, required this.changeTheme, required this.appSettings})
      : super(key: key);

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  BingoParams bingoParams = BingoParams();
  List<PersonalizeCard> personalizeCard = <PersonalizeCard>[];
  int nbCards = 0;
  bool isPlaying = false;
  final StopWatchTimer stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countUp,
    onStopped: () {},
    onEnded: () {},
  );
  late Timer timer = Timer(
    timer: 0,
  );

  // @override
  // void initState() {
  //   super.initState();
  //   Timer();
  // }

  void updateState() {
    setState(() {});
  }

  void resetHome() {
    setState(() {
      bingoParams = BingoParams.newBingoParams();
      personalizeCard = [];
      nbCards = 0;
    });
  }

  void changeIsPlaying(bool newValue) {
    if (isPlaying != newValue) {
      isPlaying = newValue;
    }
  }

  void changeNbCardValue(int value) {
    setState(() {
      nbCards += value;
    });
  }

  void launchGame() {
    final int nbCardNeed = 16 - nbCards;
    timer = Timer(timer: 0);

    if (nbCards < 16 && bingoParams.mode == Mode.personalize) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Text("Erreur"),
                content: Text(
                    "Vous devez sélectionner $nbCardNeed cases supplémentaires"),
                backgroundColor: Colors.red[300]);
          });
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Game(
                  bingoParams: bingoParams,
                  personalizeCards: personalizeCard,
                  changeIsPlaying: changeIsPlaying,
                  timer: timer,
                  newGame: true))).then((value) {
        updateState();
        //time = timer.getTime();
        //print(time);
      });
    }
  }

  void comeBacktoGame() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Game(
                bingoParams: bingoParams,
                personalizeCards: personalizeCard,
                changeIsPlaying: changeIsPlaying,
                timer: timer,
                newGame: false))).then((value) {
      updateState();
      //time = timer.getTime();
      //print(time);
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
              //   width: 40,//MediaQuery.of(context).size.width / 2,
              // ),
              Container(
                  margin: const EdgeInsets.only(left: 0),
                  child: Text(
                    'Plaktago',
                  )),
            ],
          ),
          actions: <Widget>[
            if (isPlaying == true)
              IconButton(
                icon: Icon(
                  Icons.play_circle_fill_outlined,
                ),
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
          Container(
              margin: EdgeInsets.only(top: 50),
              child: BingoTypeButton(
                  bingoType: bingoParams.bingoType,
                  updateBingoType: bingoParams.updateBingoType,
                  updateParentState: updateState)),
          Container(
              margin: EdgeInsets.only(top: 40, bottom: 50),
              child: ModeButton(
                  mode: bingoParams.mode,
                  updateBingoMode: bingoParams.updateMode,
                  updateParentState: updateState)),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            if (bingoParams.mode == Mode.personalize)
              ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width,
                    maxHeight: MediaQuery.of(context).size.height,
                  ),
                  child: Personalize(
                      cards: personalizeCard,
                      type: bingoParams.bingoType,
                      nbCardSelect: nbCards,
                      changeNbCardValue: changeNbCardValue))
            else if (bingoParams.bingoType == BingoType.plaque &&
                bingoParams.mode == Mode.random)
              ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width / 2,
                    maxHeight: 60,
                  ),
                  child: PlaqueTypeButton(
                    selectecPlaque: bingoParams.plaque,
                    updatePlaque: bingoParams.updatePlaque,
                  )),
            if (bingoParams.bingoType == BingoType.sousterrain &&
                bingoParams.mode == Mode.random)
              ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width / 2,
                    maxHeight: 60,
                  ),
                  child: RatDropdownButton(
                      type: bingoParams.ratType,
                      update: bingoParams.updateRat)),
            if (bingoParams.mode == Mode.random)
              ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width / 2,
                    maxHeight: 60,
                  ),
                  child: DifficultyButton(
                      difficulty: bingoParams.difficulty,
                      update: bingoParams.updateDifficulty)),
          ]),
          if ((bingoParams.mode == Mode.personalize) ||
              bingoParams.mode == Mode.random)
            Container(
                margin: EdgeInsets.symmetric(vertical: 50),
                child: LaunchGame(
                    launchGame: launchGame,
                    btek: btek,
                    nbCards: nbCards,
                    mode: bingoParams.mode)),
        ]));
  }
}
