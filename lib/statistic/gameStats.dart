import 'package:flutter/material.dart';
import 'package:plaktago/utils/saveGame.dart';

class GameStats extends StatefulWidget {
  final Map<String, dynamic> bingoStat;
  const GameStats({Key? key, required this.bingoStat}) : super(key: key);

  @override
  State<GameStats> createState() => _GameStats();
}

class _GameStats extends State<GameStats> {
  static List<dynamic> bingoCard = [];
  late double _sliderValue;
  late double _sliderMaxValue;

  @override
  void initState() {
    super.initState();
    bingoCard = widget.bingoStat["bingoCardList"];
    List cardSelect =
        bingoCard.where((element) => element["isSelect"] == true).toList();
    if (cardSelect.length < 2) {
      _sliderMaxValue = 1.0;
    } else {
      Map<String, dynamic> maxOrder = bingoCard.reduce((value, element) =>
          value["order"] > element["order"] ? value : element);
      _sliderMaxValue = double.parse(maxOrder["order"].toString());
    }
    _sliderValue = _sliderMaxValue;
  }

  ShapeBorder getCardShape(final int index) {
    final Radius corner = Radius.circular(8);
    if (index == 0) {
      return RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: corner));
    }
    if (index == 4 - 1) {
      return RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight: corner));
    }
    if (index == 4 * (4 - 1)) {
      return RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: corner));
    }
    if (index == 4 * 4 - 1) {
      return RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomRight: corner));
    }
    return RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.zero));
  }

  Color getCardColor(int index) {
    if (bingoCard.elementAt(index)["order"] <= _sliderValue) {
      if (bingoCard.elementAt(index)["isSelect"] == true) {
        if (bingoCard.elementAt(index)["nbLineComplete"] > 0) {
          return Color.fromRGBO(153, 219, 129, 1);
        }
        return Theme.of(context).colorScheme.secondary;
      }
    }
    return Theme.of(context).cardColor;
  }

  void deleteGame(BuildContext dialogContext) async {
    final int gameNumber = widget.bingoStat["gameNumber"];
    SaveGame saveGame = SaveGame();

    saveGame.deleteGame(gameNumber);
    Navigator.pop(dialogContext);
    Navigator.pop(context);
  }

  void checkDeleteGame() {
    BuildContext dialogContext;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          dialogContext = context;
          return AlertDialog(
              title: Text("Voulez vous vraiment supprimer cette partie ?",
                  style: TextStyle(color: Colors.black, fontSize: 18)),
              content:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                    margin: EdgeInsets.only(right: 20),
                    child: ElevatedButton(
                        onPressed: () => {deleteGame(dialogContext)},
                        child: Text("Oui",
                            style: TextStyle(color: Colors.black)))),
                Container(
                    margin: EdgeInsets.only(left: 20),
                    child: ElevatedButton(
                        onPressed: () => {Navigator.pop(dialogContext)},
                        child:
                            Text("Non", style: TextStyle(color: Colors.black))))
              ]),
              backgroundColor: Colors.grey[300]);
        });
  }

  @override
  Widget build(BuildContext context) {
    final String type = widget.bingoStat["gameType"];
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Bingo $type',
          ),
          actions: [
            IconButton(
              onPressed: checkDeleteGame,
              icon: Icon(
                Icons.delete,
                color: Theme.of(context).colorScheme.primary,
                size: 28,
              ),
            ),
          ],
        ),
        body: ListView(children: [
          Center(
              child: Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Text(
                    widget.bingoStat["date"],
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ))),
          Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width / 2,
                        ),
                        child: Text(
                          widget.bingoStat["time"],
                          style: const TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        )),
                    ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width / 2,
                        ),
                        child: Container(
                            margin: EdgeInsets.only(top: 3, left: 50),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Points : ",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500)),
                                Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      widget.bingoStat["points"].toString(),
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w400),
                                    ))
                              ],
                            )))
                  ])),
          Container(
              margin: EdgeInsets.only(top: 20),
              height: MediaQuery.of(context).size.height / 1.77,
              constraints: BoxConstraints(maxWidth: 450, maxHeight: 450),
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  padding: EdgeInsets.all(10.0),
                  itemCount: bingoCard.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Align(
                        child: SizedBox(
                            height: 100,
                            width: 100,
                            child: Card(
                                shape: getCardShape(index),
                                margin: const EdgeInsets.all(0.5),
                                color: getCardColor(index),
                                child: Center(
                                    child: Container(
                                        margin: const EdgeInsets.all(0.5),
                                        child: Text(
                                            bingoCard.elementAt(index)["name"],
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black)))))));
                  })),
          Slider(
            min: 0.0,
            max: _sliderMaxValue,
            value: _sliderValue,
            divisions: _sliderMaxValue.toInt(),
            inactiveColor: Theme.of(context).colorScheme.onBackground,
            onChanged: (value) {
              setState(() {
                _sliderValue = value;
              });
            },
          ),
          // Align(
          //     child: Container(
          //         width: 230,
          //         height: 40,
          //         margin: EdgeInsets.only(top: 20, bottom: 10),
          //         child: ElevatedButton(
          //           onPressed: () => {},
          //           child: TextButton.icon(
          //             onPressed: deleteGame,
          //             icon: Icon(
          //               Icons.delete,
          //               color: Colors.black,
          //             ),
          //             label: Text(
          //               'Supprimer la partie',
          //               style: TextStyle(color: Colors.black),
          //             ),
          //           ),
          //         )))
        ]));
  }
}
