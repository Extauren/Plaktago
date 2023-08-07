import 'package:flutter/material.dart';
import 'package:plaktago/game/board/cardName.dart';
import '../utils/saveGame.dart';
import 'graph.dart';
import 'graph2.dart';

class GeneralStatistic extends StatefulWidget {
  final Function getGeneralStatistics;
  const GeneralStatistic({Key? key, required this.getGeneralStatistics})
      : super(key: key);

  @override
  State<GeneralStatistic> createState() => _GeneralStatistic();
}

class _GeneralStatistic extends State<GeneralStatistic> {
  Map<String, dynamic> data = {};
  List<Widget> values = [
    Container(),
    Container(),
    Container(),
    Container(),
    Container(),
    Container(),
  ];
  final List<String> titles = [
    "Partie total",
    "Bingo Plaque",
    "Bingo Rat",
    "Bingo gagnés",
    "Carte la + jouée",
    "Carte la - jouée"
  ];
  List<CardList> cardList = [];

  @override
  void initState() {
    super.initState();
    getStatistics();
  }

  void getStatistics() async {
    data = await widget.getGeneralStatistics();
    setState(() {
      values[0] = Text(data["nbGames"].toString(),
          style: TextStyle(
              fontWeight: FontWeight.w600, color: Colors.black, fontSize: 26));
      values[1] = Text(data["bingoPlaque"].toString(),
          style: TextStyle(
              fontWeight: FontWeight.w600, color: Colors.black, fontSize: 26));
      values[2] = Text(data["bingoRat"].toString(),
          style: TextStyle(
              fontWeight: FontWeight.w600, color: Colors.black, fontSize: 26));
      values[3] = Text(data["bingoWin"].toString(),
          style: TextStyle(
              fontWeight: FontWeight.w600, color: Colors.black, fontSize: 26));
      final List tmp = data["cardList"];
      for (int it = 0; it < tmp.length; it++) {
        cardList.add(CardList.fromJson(tmp.elementAt(it)));
      }
      values[4] = Text(cardList[0].cardName.toString(),
          style: TextStyle(
              fontWeight: FontWeight.w600, color: Colors.black, fontSize: 18));
      values[5] = Text(cardList[cardList.length - 1].cardName.toString(),
          style: TextStyle(
              fontWeight: FontWeight.w600, color: Colors.black, fontSize: 18));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
          height: 190,
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, childAspectRatio: 1.4),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              itemCount: 6,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                    margin: const EdgeInsets.all(5),
                    color: Colors.indigo[100],
                    child: Center(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                          Container(
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              child: Text(titles[index],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black))),
                          values[index]
                        ])));
              })),
      if (cardList.length == cardNameListPlaque.length)
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
