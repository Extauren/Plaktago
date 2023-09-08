import 'package:flutter/material.dart';
import 'package:plaktago/game/board/card_name.dart';
import '../utils/save_game.dart';
import 'graph.dart';
import 'graph2.dart';

class GeneralStatistic extends StatefulWidget {
  final Function statistics;
  const GeneralStatistic({Key? key, required this.statistics})
      : super(key: key);

  @override
  State<GeneralStatistic> createState() => _GeneralStatistic();
}

class _GeneralStatistic extends State<GeneralStatistic> {
  Map<String, dynamic> data = {};
  bool nbGame = false;
  double textFontSize = 22;
  List<Widget> values = [
    Container(),
    Container(),
    Container(),
    Container(),
    Container(),
    Container(),
  ];
  final List<String> titles = [
    "Total",
    "Plaque",
    "Rat",
    "Gagnés",
    "Plus jouée",
    "Moins jouée"
  ];
  List<CardList> cardList = [];

  @override
  void initState() {
    getStatistics();
    super.initState();
  }

  void getStatistics() async {
    data = await widget.statistics();
    setState(() {
      if (data["nbGames"] > 0) {
        nbGame = true;
      }
      values[0] = Text(data["nbGames"].toString(),
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black,
              fontSize: textFontSize));
      values[1] = Text(data["bingoPlaque"].toString(),
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black,
              fontSize: textFontSize));
      values[2] = Text(data["bingoRat"].toString(),
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black,
              fontSize: textFontSize));
      values[3] = Text(data["bingoWin"].toString(),
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black,
              fontSize: textFontSize));
      final List tmp = data["cardList"];
      for (int it = 0; it < tmp.length; it++) {
        cardList.add(CardList.fromJson(tmp.elementAt(it)));
      }
      values[4] = Container(
          margin: EdgeInsets.only(top: 4),
          child: Text(cardList[0].cardName.toString(),
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 18)));
      values[5] = Container(
          margin: EdgeInsets.only(top: 4),
          child: Text(cardList[cardList.length - 1].cardName.toString(),
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 18)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
          height: 200,
          width: 400,
          child: GridView.builder(
              controller: ScrollController(keepScrollOffset: false),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, childAspectRatio: 1.4),
              padding: EdgeInsets.symmetric(horizontal: 20),
              itemCount: 6,
              itemBuilder: (BuildContext context, int index) {
                return Align(
                    child: SizedBox(
                        height: 80,
                        width: 120,
                        child: Card(
                            margin: const EdgeInsets.all(5),
                            color: Colors.indigo[100],
                            child: Center(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                  Container(
                                      margin: const EdgeInsets.only(top: 4),
                                      child: Text(titles[index],
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black))),
                                  values[index]
                                ])))));
              })),
      if (nbGame)
        PieChartSample2(
          nbGames: data["nbGames"].toString(),
          bingoPlaque: data["bingoPlaque"].toString(),
          bingoRat: data["bingoRat"].toString(),
        ),
      if (cardList.length == cardNameListPlaque.length)
        BarChartSample2(
          cardList: cardList,
        ),
      // if (cardList.length != cardNameListPlaque.length)
      //   CircularProgressIndicator(),
    ]);
  }
}
