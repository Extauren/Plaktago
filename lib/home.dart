import 'package:flutter/material.dart';
import 'package:plaktago/Game/plakChoiceButton.dart';
import 'Game/bingo.dart';
import 'Game/plaqueType.dart';
import 'Game/difficultyButton.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _Home();
}

enum SingingCharacter { Surface, Sousterre }

class _Home extends State<Home> {
  _Home();
  SingingCharacter? _character = SingingCharacter.Surface;

  void launchGame() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const Bingo(
                gameType: "Surfacien",
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(children: [
      Container(
          margin: const EdgeInsets.only(top: 40.0),
          child: Text(
            "Bienvenue sur le KTA Bingo",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
          )),
      Container(
          margin: const EdgeInsets.only(top: 20.0, left: 80.0),
          child: Text(
            "Le jeux vous offre deux type de partie. Les parties surfaciens ainsi que les parties sous terraine.",
            style: TextStyle(fontSize: 18),
          )),
      Container(
          margin: const EdgeInsets.only(top: 10.0, left: 100.0),
          child: Text(
            "Surfacien : Une partie surfacien nécéssite d'être à proximité d'une plaque et d'avoir une vision sur celle-ci. Le but de ces parties est de jouer avec les cataphiles que vous observer entrer en sortir.",
            style: TextStyle(fontSize: 18),
          )),
      Container(
          margin: const EdgeInsets.only(top: 10.0, left: 100.0),
          child: Text(
            "Sous terrain : Comme son nom l'indique ces type de partie ce passe sous terre. Vous allez jouer avec les cataphiles que vous croiserez sous terre dans un salle ou dans un galerie.",
            style: TextStyle(fontSize: 18),
          )),
      Container(
          margin: const EdgeInsets.only(top: 30.0),
          child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width - 50,
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: ListTile(
                    title: const Text('Surfacien'),
                    leading: Radio<SingingCharacter>(
                      value: SingingCharacter.Surface,
                      groupValue: _character,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  )),
                  Expanded(
                    child: ListTile(
                      title: const Text('Sous terre'),
                      leading: Radio<SingingCharacter>(
                        value: SingingCharacter.Sousterre,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),
                  )
                ],
              ))),
      Row(children: <Widget>[
        ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 200,
              maxHeight: 200,
            ),
            child: DropdownMenuExample()),
        ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 200,
              maxHeight: 200,
            ),
            child: DifficultyButton()),
      ]),
      OutlinedButton(onPressed: launchGame, child: const Text('Jouer')),
    ])));
  }
}
