import 'package:flutter/material.dart';
import 'package:plaktago/game/plaqueTypeButton.dart';
import 'game/difficultyButton.dart';
import 'game/bingo.dart';
import 'utils/saveGame.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _Home();
}

enum BingoType {
  plaque('plaque'),
  sousterre('sous terrain');

  const BingoType(this.name);
  final String name;
}

class _Home extends State<Home> {
  _Home();
  String _bingoTypeName = BingoType.plaque.name;
  BingoType? _bingoType = BingoType.plaque;
  PlaqueType? selectePlaque = PlaqueType.triangle;

  void launchGame() {
    Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    Game(gameType: _bingoTypeName, saveGame: SaveGame())))
        .then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              const Image(
                image: AssetImage('logo.png'),
                height: 40,
                width: 40,
              ),
              Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Plaktago',
                    style: TextStyle(color: Colors.black),
                  )),
            ],
          ),
          backgroundColor: Colors.orange,
        ),
        body: ListView(children: [
          Container(
              margin: const EdgeInsets.only(top: 30.0, left: 10, right: 10),
              child: Text("Bienvenue sur Plaktago",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center)),
          Container(
              margin: const EdgeInsets.only(top: 20.0, left: 15, right: 15),
              child: Text(
                "Le jeux vous offre deux type de partie. Les parties surfaciens ainsi que les parties sous terraine.",
                style: TextStyle(fontSize: 13),
              )),
          Container(
              margin: const EdgeInsets.only(top: 10.0, left: 20.0, right: 20),
              child: Text(
                "Surfacien : Une partie surfacien nécéssite d'être à proximité d'une plaque et d'avoir une vision sur celle-ci. Le but de ces parties est de jouer avec les cataphiles que vous observer entrer en sortir.",
                style: TextStyle(fontSize: 13),
              )),
          Container(
              margin: const EdgeInsets.only(top: 10.0, left: 20.0, right: 20),
              child: Text(
                "Sous terrain : C'est partie ce passe sous terre. Vous allez jouer avec les cataphiles que vous croiserez sous terre dans un salle ou dans un galerie.",
                style: TextStyle(fontSize: 13),
              )),
          Container(
              margin: const EdgeInsets.only(top: 30.0, left: 10, right: 10),
              child: ConstrainedBox(
                  constraints: BoxConstraints(
                      //maxWidth: MediaQuery.of(context).size.width - 50,
                      ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: ListTile(
                        title: Text(BingoType.plaque.name),
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
                      )),
                      Expanded(
                        child: ListTile(
                          title: Text(BingoType.sousterre.name),
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
                    ],
                  ))),
          Row(children: [
            if (_bingoType == BingoType.plaque)
              Container(
                  margin: EdgeInsets.only(right: 70),
                  child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 110,
                        maxHeight: 200,
                      ),
                      child: PlaqueTypeButton(
                        selectecPlaque: selectePlaque!,
                      ))),
            ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 100,
                  maxHeight: 200,
                ),
                child: DifficultyButton()),
          ]),
          OutlinedButton(onPressed: launchGame, child: const Text('Jouer')),
        ]));
  }
}
