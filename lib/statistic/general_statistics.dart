import 'package:flutter/material.dart';
import 'package:plaktago/utils/isar_service.dart';
import 'package:plaktago/utils/general.dart';
import '../utils/save_game.dart';
import 'graph.dart';
import 'graph2.dart';

class GeneralStatistic extends StatefulWidget {
  final IsarService isarService;
  const GeneralStatistic({Key? key, required this.isarService})
      : super(key: key);

  @override
  State<GeneralStatistic> createState() => _GeneralStatistic();
}

class _GeneralStatistic extends State<GeneralStatistic> {
  late final Future<General> data;
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
    "Gagnés",
    "Plus jouée",
    "Plaque",
    "Kta",
    "Explo",
  ];
  List<CardList> cardList = [];

  @override
  void initState() {
    data = widget.isarService.getGeneral();
    super.initState();
  }

  List<Widget> getStatistics(final General data) {
    List<Widget> values = [
      Container(),
      Container(),
      Container(),
      Container(),
      Container(),
      Container(),
    ];
    values[0] = Text(data.nbGames.toString(),
        style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: textFontSize));
    values[1] = Text(data.bingoWin.toString(),
        style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: textFontSize));
    // final List tmp = data.cardList;
    // for (int it = 0; it < tmp.length; it++) {
    //   cardList.add(CardList.fromJson(tmp.elementAt(it)));
    // }
    // values[2] = Container(
    //     margin: EdgeInsets.only(top: 4),
    //     child: Text(cardList[0].cardName.toString(),
    //         style: TextStyle(
    //             fontWeight: FontWeight.w600,
    //             color: Colors.black,
    //             fontSize: 18)));
    values[3] = Text(data.bingoPlaque.toString(),
        style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: textFontSize));
    values[4] = Text(data.bingoKta.toString(),
        style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: textFontSize));
    values[5] = Text(data.bingoExplo.toString(),
        style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: textFontSize));
    return values;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<General>(
        future: data,
        builder: (BuildContext context, AsyncSnapshot<General> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            List<Widget> values = getStatistics(snapshot.data!);
            children = <Widget>[
              Column(children: [
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                            Container(
                                                margin: const EdgeInsets.only(
                                                    top: 4),
                                                child: Text(titles[index],
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.black))),
                                            values[index]
                                          ])))));
                        })),
                PieChartSample2(
                  nbGames: snapshot.data!.nbGames.toString(),
                  bingoPlaque: snapshot.data!.bingoPlaque.toString(),
                  bingoKta: snapshot.data!.bingoKta.toString(),
                  bingoExplo: snapshot.data!.bingoExplo.toString(),
                ),
                BarChartSample2(
                  cardList: snapshot.data!.cardList,
                ),
              ])
            ];
          } else if (snapshot.hasError) {
            children = <Widget>[
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              ),
            ];
          } else {
            children = const <Widget>[
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Awaiting result...'),
              ),
            ];
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          );
        });
  }
}
