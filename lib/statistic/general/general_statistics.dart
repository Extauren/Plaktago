import 'package:flutter/material.dart';
import 'package:plaktago/components/outlined_button.dart';
import 'package:plaktago/data_class/app_settings.dart';
import 'package:plaktago/statistic/general/best_cards_list.dart';
import 'package:plaktago/statistic/general/cards_list.dart';
import 'package:plaktago/utils/isar_service.dart';
import 'package:plaktago/data_class/general.dart';
import '../../data_class/save_game.dart';
import 'pourcentage.dart';

class GeneralStatistic extends StatefulWidget {
  final IsarService isarService;
  final AppSettings appSettings;
  const GeneralStatistic(
      {Key? key, required this.isarService, required this.appSettings})
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
    "Lignes",
    "Points",
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
            color: Colors.white,
            fontSize: textFontSize));
    values[1] = data.nbLines < 0
        ? Text("Null",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: textFontSize))
        : Text(data.nbLines.toString(),
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: textFontSize));
    values[2] = data.nbPoints < 0
        ? Text("Null",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: textFontSize))
        : Text(data.nbPoints.toString(),
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: textFontSize));
    values[3] = Text(data.bingoPlaque.toString(),
        style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: textFontSize));
    values[4] = Text(data.bingoKta.toString(),
        style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: textFontSize));
    values[5] = Text(data.bingoExplo.toString(),
        style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: textFontSize));
    return values;
  }

  void goToCardListStat(final List<CardList> cardList) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CardListStat(
                  cardList: cardList,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<General>(
        future: data,
        builder: (BuildContext context, AsyncSnapshot<General> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            List<Widget> values = getStatistics(snapshot.data!);
            children = [
              Column(children: [
                SizedBox(
                    height: 190,
                    width: 370,
                    child: GridView.builder(
                        controller: ScrollController(keepScrollOffset: false),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, childAspectRatio: 1.5),
                        padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                        itemCount: 6,
                        itemBuilder: (BuildContext context, int index) {
                          return Align(
                              child: SizedBox(
                                  height: 65,
                                  width: 100,
                                  child: Card(
                                      margin: const EdgeInsets.all(0),
                                      color: Color.fromRGBO(57, 65, 89, 1),
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
                                                        color: Colors.white))),
                                            values[index]
                                          ])))));
                        })),
                if (snapshot.data!.nbGames > 0)
                  Pourcentage(
                    nbGames: snapshot.data!.nbGames.toString(),
                    bingoPlaque: snapshot.data!.bingoPlaque.toString(),
                    bingoKta: snapshot.data!.bingoKta.toString(),
                    bingoExplo: snapshot.data!.bingoExplo.toString(),
                  ),
                SizedBox(
                  height: 80,
                ),
                SizedBox(
                    height: 312,
                    child: BestCardsList(
                      cardList: snapshot.data!.cardList,
                      nbRows: 5,
                    )),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                        padding: EdgeInsets.only(left: 6),
                        child: TextButton(
                            onPressed: () =>
                                goToCardListStat(snapshot.data!.cardList),
                            child: Text('Plus de cartes')))),
                SizedBox(
                  height: 80,
                ),

                // Align(
                //     alignment: Alignment.bottomRight,
                //     child: Container(
                //         height: 35,
                //         width: 120,
                //         margin:
                //             EdgeInsets.symmetric(vertical: 10, horizontal: 6),
                //         child: FloatingActionButton.extended(
                //           onPressed: () {},
                //           elevation: 0.5,
                //           shape: RoundedRectangleBorder(
                //               side: BorderSide(
                //                   width: 0,
                //                   color: Theme.of(context).colorScheme.surface),
                //               borderRadius: BorderRadius.circular(10)),
                //           backgroundColor:
                //               Theme.of(context).colorScheme.surface,
                //           splashColor: Theme.of(context).colorScheme.primary,
                //           label: Text("Plus de cartes",
                //               style: TextStyle(
                //                 fontSize: 14,
                //                 color: Theme.of(context).colorScheme.primary,
                //               )),
                //         ))),
                //   POutlinedButton(
                //       label: "Liste des cartes",
                //       onPreed: () => goToCardListStat(snapshot.data!.cardList),
                //       width: 160,
                //       margin: EdgeInsets.only(bottom: 10)),
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
            children = const <Widget>[];
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
