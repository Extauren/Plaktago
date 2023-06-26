import 'package:flutter/material.dart';
import 'package:plaktago/game/plaqueTypeButton.dart';
import 'package:plaktago/game/ratDropdownButton.dart';
import 'package:plaktago/utils/saveGame.dart';
import 'game/difficultyButton.dart';
import 'game/bingo.dart';
import 'drawer.dart';
import 'segmentButton.dart';

enum BingoType {
  plaque('Plaque'),
  sousterre('Sous terrain');

  const BingoType(this.name);
  final String name;
}

enum Test {
  plaque('Aléatoire'),
  sousterre('Personalisé');

  const Test(this.name);
  final String name;
}

class Home extends StatefulWidget {
  final Function changeTheme;
  final ThemeMode theme;
  const Home({Key? key, required this.changeTheme, required this.theme})
      : super(key: key);

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  String _bingoTypeName = BingoType.plaque.name;
  BingoType? _bingoType = BingoType.plaque;
  PlaqueType? selectePlaque = PlaqueType.triangle;
  RatType? ratType = RatType.salle;
  final saveGame = SaveGame();

  void resetHome() {
    setState(() {
      _bingoTypeName = BingoType.plaque.name;
      _bingoType = BingoType.plaque;
      selectePlaque = PlaqueType.triangle;
      ratType = RatType.salle;
    });
  }

  void launchGame() {
    Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    Game(gameType: _bingoTypeName, theme: widget.theme)))
        .then((value) {
      resetHome();
    });
  }

  Color _getTextColor() {
    if (widget.theme == ThemeMode.dark) {
      return Colors.white;
    }
    return Colors.black;
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
              //   width: 40,
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
              margin: const EdgeInsets.only(top: 30.0, left: 10, right: 10),
              child: Text("Le bingo des catacombes",
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center)),
          Container(height: 100, child: SegmentedButtonApp()),
          Container(
              margin: EdgeInsets.all(20),
              width: 100,
              child: Card(
                  color: Colors.white,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                            //width: MediaQuery.of(context).size.width / 2.5,
                            child: ListTileTheme(
                                selectedColor: Colors.red,
                                child: ListTile(
                                  title: Text(BingoType.plaque.name,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                  leading: Radio<BingoType>(
                                    value: BingoType.plaque,
                                    groupValue: _bingoType,
                                    onChanged: (BingoType? value) {
                                      setState(() {
                                        _bingoType = value;
                                        _bingoTypeName = BingoType.plaque.name;
                                      });
                                    },
                                  ),
                                ))),
                        SizedBox(
                          //width: MediaQuery.of(context).size.width / 2,
                          child: ListTile(
                            title: Text(BingoType.sousterre.name,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            leading: Radio<BingoType>(
                              value: BingoType.sousterre,
                              groupValue: _bingoType,
                              onChanged: (BingoType? value) {
                                setState(() {
                                  _bingoType = value;
                                  _bingoTypeName = BingoType.sousterre.name;
                                });
                              },
                            ),
                          ),
                        )
                      ]))),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            if (_bingoType == BingoType.plaque)
              ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width / 2,
                    maxHeight: 180,
                  ),
                  child: PlaqueTypeButton(
                    selectecPlaque: selectePlaque!,
                  )),
            if (_bingoType == BingoType.sousterre)
              ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width / 2,
                    maxHeight: 180,
                  ),
                  child: RatDropdownButton(type: ratType!)),
            ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width / 2,
                  maxHeight: 180,
                ),
                child: DifficultyButton()),
          ]),
          LimitedBox(
            maxWidth: 100, //MediaQuery.of(context).size.width / 2,
            child: ElevatedButton(
              onPressed: launchGame,
              child: Text(
                'Jouer',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          TextButton(onPressed: saveGame.resetFile, child: Text("Reset file"))
        ]));
  }
}
