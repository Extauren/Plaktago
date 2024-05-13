import 'package:flutter/material.dart';
import 'package:plaktago/components/border_button.dart';
import 'package:plaktago/components/separator.dart';
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
  final List<String> titles = [
    "Total",
    "Lignes",
    "Points",
    "Plaque",
    "Kta",
    "Explo",
    "Chantier"
  ];
  List<CardList> cardList = [];

  @override
  void initState() {
    data = widget.isarService.getGeneral();
    super.initState();
  }

  List<Widget> getStatistics(final General data) {
    List<Widget> values = List.generate(titles.length, (index) => Container());

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
    values[6] = Text(data.bingoChantier.toString(),
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
                    height: 240,
                    width: 370,
                    child: GridView.builder(
                        controller: ScrollController(keepScrollOffset: false),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, childAspectRatio: 1.5),
                        padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                        itemCount: 7,
                        itemBuilder: (BuildContext context, int index) {
                          return Align(
                              child: SizedBox(
                                  height: 65,
                                  width: 100,
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                          border: Border.all(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary)),
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
                                          ]))));
                        })),
                if (snapshot.data!.nbGames >= 0)
                  Column(children: [
                    PSeparator(
                      text: "Parties",
                    ),
                    SizedBox(height: 20),
                    Pourcentage(
                      nbGames: snapshot.data!.nbGames.toString(),
                      bingoPlaque: snapshot.data!.bingoPlaque.toString(),
                      bingoKta: snapshot.data!.bingoKta.toString(),
                      bingoExplo: snapshot.data!.bingoExplo.toString(),
                      bingoChantier: snapshot.data!.bingoChantier.toString(),
                    ),
                  ]),
                SizedBox(
                  height: 40,
                ),
                PSeparator(
                  text: "Liste des cartes",
                ),
                SizedBox(height: 40),
                SizedBox(
                    height: 280,
                    child: BestCardsList(
                      cardList: snapshot.data!.cardList,
                      nbRows: 5,
                      headingRowHeight: 50,
                      dataRowHeight: 45,
                    )),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                        padding: EdgeInsets.only(left: 0, top: 10),
                        child: PBorderButton(
                          label: "Plus de cartes",
                          onPressed: () =>
                              goToCardListStat(snapshot.data!.cardList),
                          backgroundColor:
                              Theme.of(context).colorScheme.background,
                        ))),
                SizedBox(
                  height: 20,
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
