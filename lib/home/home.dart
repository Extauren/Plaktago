import 'package:flutter/material.dart';
import 'package:plaktago/home/plaqueTypeButton.dart';
import 'package:plaktago/home/ratDropdownButton.dart';
import 'package:plaktago/utils/saveGame.dart';
import 'difficultyButton.dart';
import '../game/bingo.dart';
import 'drawer.dart';
import 'bingoTypeButton.dart';
import 'modeButton.dart';
import 'launchGame.dart';
import '../utils/bingoParams.dart';

class Home extends StatefulWidget {
  final Function changeTheme;
  final ThemeMode theme;
  const Home({Key? key, required this.changeTheme, required this.theme})
      : super(key: key);

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  final saveGame = SaveGame();
  BingoParams bingoParams = BingoParams();

  void updateState() {
    setState(() {});
  }

  void resetHome() {
    setState(() {
      bingoParams = BingoParams.newBingoParams();
    });
  }

  void launchGame() {
    Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    Game(bingoParams: bingoParams, theme: widget.theme)))
        .then((value) {
      resetHome();
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
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        ),
        drawer: DrawerApp(
          changeTheme: widget.changeTheme,
        ),
        body: ListView(children: [
          Container(
              margin: const EdgeInsets.only(top: 60.0, left: 10, right: 10),
              child: Text("Le bingo des catacombes",
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center)),
          Container(
              height: 80,
              width: 100,
              margin: EdgeInsets.only(top: 20),
              child: BingoTypeButton(
                  bingoType: bingoParams.bingoType,
                  updateBingoType: bingoParams.updateBingoType,
                  updateParentState: updateState)),
          Container(
              margin: EdgeInsets.only(bottom: 20),
              height: 80,
              child: ModeButton(
                  mode: bingoParams.mode,
                  updateBingoMode: bingoParams.updateMode,
                  updateParentState: updateState)),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            if (bingoParams.bingoType == BingoType.plaque)
              ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width / 2,
                    maxHeight: 160,
                  ),
                  child: PlaqueTypeButton(
                    selectecPlaque: bingoParams.plaque,
                    updatePlaque: bingoParams.updatePlaque,
                  )),
            if (bingoParams.bingoType == BingoType.sousterrain)
              ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width / 2,
                    maxHeight: 160,
                  ),
                  child: RatDropdownButton(
                      type: bingoParams.ratType,
                      update: bingoParams.updateRat)),
            ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width / 2,
                  maxHeight: 160,
                ),
                child: DifficultyButton(
                    difficulty: bingoParams.difficulty,
                    update: bingoParams.updateDifficulty)),
          ]),
          LaunchGame(launchGame: launchGame, btek: btek),
          TextButton(onPressed: saveGame.resetFile, child: Text("Reset file"))
        ]));
  }
}
