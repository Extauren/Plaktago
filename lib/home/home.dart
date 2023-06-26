import 'package:flutter/material.dart';
import 'package:plaktago/game/plaqueTypeButton.dart';
import 'package:plaktago/game/ratDropdownButton.dart';
import 'package:plaktago/utils/saveGame.dart';
import '../game/difficultyButton.dart';
import '../game/bingo.dart';
import 'drawer.dart';
import 'bingoTypeButton.dart';
import 'package:flutter/gestures.dart';
import 'modeButton.dart';

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
  PlaqueType? selectePlaque = PlaqueType.triangle;
  RatType? ratType = RatType.salle;
  BingoType bingoTypeView = BingoType.plaque;
  Mode modeView = Mode.random;

  void resetHome() {
    setState(() {
      bingoTypeView = BingoType.plaque;
      selectePlaque = PlaqueType.triangle;
      ratType = RatType.salle;
    });
  }

  void updateBingoType(final BingoType newValue) {
    // setState(() {
    //   bingoTypeView = newValue;
    // });
  }

  void launchGame() {
    Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    Game(gameType: bingoTypeView.name, theme: widget.theme)))
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
              margin: EdgeInsets.only(top: 20),
              child: BingoTypeButton(
                  bingoTypeView: bingoTypeView,
                  updateBingoType: updateBingoType)),
          Container(
              margin: EdgeInsets.only(bottom: 20),
              height: 80,
              child: ModeButton(
                modeView: modeView,
              )),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            if (bingoTypeView == BingoType.plaque)
              ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width / 2,
                    maxHeight: 160,
                  ),
                  child: PlaqueTypeButton(
                    selectecPlaque: selectePlaque!,
                  )),
            if (bingoTypeView == BingoType.sousterrain)
              ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width / 2,
                    maxHeight: 160,
                  ),
                  child: RatDropdownButton(type: ratType!)),
            ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width / 2,
                  maxHeight: 160,
                ),
                child: DifficultyButton()),
          ]),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 150),
              child: ExtraLongDetector(
                  duration: Duration(seconds: 10),
                  onLongPress: btek,
                  child: ElevatedButton(
                    onPressed: launchGame,
                    child: Text(
                      'Jouer',
                      style: TextStyle(color: Colors.black),
                    ),
                  ))),
          TextButton(onPressed: saveGame.resetFile, child: Text("Reset file"))
        ]));
  }
}

class ExtraLongDetector extends StatelessWidget {
  final Widget? child;
  final Duration duration;
  final VoidCallback onLongPress;

  const ExtraLongDetector({
    super.key,
    this.child,
    required this.duration,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return RawGestureDetector(
      gestures: <Type, GestureRecognizerFactory>{
        LongPressGestureRecognizer:
            GestureRecognizerFactoryWithHandlers<LongPressGestureRecognizer>(
          () => LongPressGestureRecognizer(duration: duration),
          (instance) => instance.onLongPress = onLongPress,
        ),
      },
      child: child,
    );
  }
}
