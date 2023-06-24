import 'package:flutter/material.dart';
import 'package:plaktago/game/plaqueTypeButton.dart';
import 'game/difficultyButton.dart';
import 'game/bingo.dart';
import 'utils/saveGame.dart';
import 'drawer.dart';

enum BingoType {
  plaque('plaque'),
  sousterre('sous terrain');

  const BingoType(this.name);
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

  void resetHome() {
    setState(() {
      _bingoTypeName = BingoType.plaque.name;
      _bingoType = BingoType.plaque;
      selectePlaque = PlaqueType.triangle;
    });
  }

  void launchGame() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Game(
                gameType: _bingoTypeName,
                saveGame: SaveGame(),
                theme: widget.theme))).then((value) {
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
              const Image(
                image: AssetImage('logo.png'),
                height: 40,
                width: 40,
              ),
              Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Plaktago',
                    style: Theme.of(context).textTheme.bodyLarge,
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
              child: Text("Bienvenue sur Plaktago",
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center)),
          Container(
              margin: const EdgeInsets.only(top: 20.0, left: 15, right: 15),
              child: Text(
                "Le jeux vous offre deux type de partie. Les parties surfaciens ainsi que les parties sous terraine.",
                style: Theme.of(context).textTheme.bodySmall,
              )),
          Container(
              margin: const EdgeInsets.only(top: 10.0, left: 20.0, right: 20),
              child: Text(
                "Surfacien : Une partie surfacien nécéssite d'être à proximité d'une plaque et d'avoir une vision sur celle-ci. Le but de ces parties est de jouer avec les cataphiles que vous observer entrer en sortir.",
                style: Theme.of(context).textTheme.bodySmall,
              )),
          Container(
              margin: const EdgeInsets.only(top: 10.0, left: 20.0, right: 20),
              child: Text(
                "Sous terrain : C'est partie ce passe sous terre. Vous allez jouer avec les cataphiles que vous croiserez sous terre dans un salle ou dans un galerie.",
                style: Theme.of(context).textTheme.bodySmall,
              )),
          Container(
              margin: EdgeInsets.all(20),
              child: Row(
                children: <Widget>[
                  SizedBox(
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: ListTileTheme(
                          selectedColor: Colors.red,
                          child: ListTile(
                            title: Text(BingoType.plaque.name,
                                style: Theme.of(context).textTheme.bodyMedium),
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
                    width: MediaQuery.of(context).size.width / 2,
                    child: ListTile(
                      title: Text(BingoType.sousterre.name,
                          style: Theme.of(context).textTheme.bodyMedium),
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
              )),
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
                style: TextStyle(color: _getTextColor()),
              ),
            ),
          )
        ]));
  }
}
