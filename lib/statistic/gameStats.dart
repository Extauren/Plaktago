import 'package:flutter/material.dart';

class GameStats extends StatefulWidget {
  final Map<String, dynamic> bingoStat;
  const GameStats({Key? key, required this.bingoStat}) : super(key: key);

  @override
  State<GameStats> createState() => _GameStats();
}

class _GameStats extends State<GameStats> {
  static List bingoCard = [];
  @override
  void initState() {
    super.initState();
    bingoCard = widget.bingoStat["bingoCardList"];
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
    if (bingoCard.elementAt(index)["isSelect"] == true) {
      if (bingoCard.elementAt(index)["nbLineComplete"] > 0) {
        return Color.fromRGBO(219, 150, 129, 1);
      }
      return Color.fromRGBO(153, 219, 129, 1);
    }
    return Theme.of(context).cardColor;
  }

  @override
  Widget build(BuildContext context) {
    final String type = widget.bingoStat["gameType"];
    return Scaffold(
        appBar: AppBar(title: Text("Bingo $type")),
        body: Column(children: [
          Text(widget.bingoStat["date"]),
          SizedBox(
              height: 410,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  padding: EdgeInsets.all(10.0),
                  itemCount: bingoCard.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      shape: getCardShape(index),
                      margin: const EdgeInsets.all(0.5),
                      color: getCardColor(index),
                      child: Center(
                          child: Container(
                              margin: const EdgeInsets.all(0.5),
                              child: Text(bingoCard.elementAt(index)["name"],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black)))),
                    );
                  }))
        ]));
  }
}
