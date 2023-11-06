import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:plaktago/data_class/app_settings.dart';
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

  int getPourcentage(final int check, final int played) {
    double pourcentage = 0;
    pourcentage = check / played * 100;
    return pourcentage.round();
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
                                      color:
                                          Theme.of(context).colorScheme.surface,
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
                  height: 40,
                ),
                // NumberCards(
                //     cardList: snapshot.data!.cardList,
                //     appSettings: widget.appSettings),
                ConstrainedBox(
                    //height: MediaQuery.of(context).size.height / 1.5,
                    constraints: BoxConstraints(
                      maxHeight: 600,
                    ),
                    //maxWidth: MediaQuery.of(context).size.width),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: DataTable2(
                          columnSpacing: 0,
                          horizontalMargin: 12,
                          minWidth: 450,
                          columns: [
                            DataColumn(
                              label: Text('Nom'),
                              //size: ColumnSize.L,
                            ),
                            DataColumn2(
                              label: Text('Proposé'),
                              size: ColumnSize.S,
                            ),
                            DataColumn2(
                              label: Text('Coché'),
                              size: ColumnSize.S,
                            ),
                            DataColumn2(
                              label: Text('%'),
                              size: ColumnSize.S,
                            ),
                          ],
                          rows: List<DataRow>.generate(
                              snapshot.data!.cardList.length,
                              (index) => DataRow(cells: [
                                    DataCell(ConstrainedBox(
                                        constraints:
                                            BoxConstraints(maxWidth: 130),
                                        child: Text(
                                          snapshot.data!.cardList
                                              .elementAt(index)
                                              .cardName,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 3,
                                        ))),
                                    DataCell(Text(snapshot.data!.cardList
                                        .elementAt(index)
                                        .nbPlayed
                                        .toString())),
                                    DataCell(Text(snapshot.data!.cardList
                                        .elementAt(index)
                                        .nbCheck
                                        .toString())),
                                    DataCell(Text(getPourcentage(
                                            snapshot.data!.cardList
                                                .elementAt(index)
                                                .nbCheck,
                                            snapshot.data!.cardList
                                                .elementAt(index)
                                                .nbPlayed)
                                        .toString()))
                                  ]))),
                    ))
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
