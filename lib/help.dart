import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:plaktago/game/board/card_name.dart';
import 'package:plaktago/home/bingo_type_button.dart';

class Help extends StatefulWidget {
  Help({
    Key? key,
  }) : super(key: key);

  @override
  State<Help> createState() => _Help();
}

class _Help extends State<Help> {
  String getType(List<BingoType> types) {
    var test = types.asNameMap();
    List<String> i = [];
    test.forEach((key, value) {
      i.add(value.name);
    });
    return i.join(', ');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Aide")),
        body: ListView(children: [
          Container(
              margin: const EdgeInsets.only(
                  top: 20.0, left: 10, right: 10, bottom: 20),
              child: Text("Type de parties",
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center)),
          Container(
              margin: EdgeInsets.only(top: 10, left: 30, right: 10),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text("Bingo Plaque : ",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(
                    width: MediaQuery.of(context).size.width / 1.6,
                    child: Text(
                      "Vous cochez les cases en fonctions des actions que vous voyez des cataphiles qui descentes ou remontes",
                    ))
              ])),
          Container(
              margin: EdgeInsets.only(top: 10, left: 30),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text("Bingo KTA : ",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(
                    width: MediaQuery.of(context).size.width - 150,
                    child: Text(
                      "Vous cochez les cases en fonctions des actions que vous voyez des cataphiles que vous rencontrez",
                    ))
              ])),
          Container(
              margin: EdgeInsets.only(top: 10, left: 30),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text("Bingo Explo : ",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(
                    width: MediaQuery.of(context).size.width - 150,
                    child: Text(
                      "Vous explorer le réseau à la recherche des objectifs proposés par le bingo",
                    ))
              ])),
          Container(
              margin: const EdgeInsets.only(
                  top: 40.0, left: 10, right: 10, bottom: 0),
              child: Text("Description des cartes",
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center)),
          SizedBox(
              height: MediaQuery.of(context).size.height / 1.5,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: DataTable2(
                    columnSpacing: 12,
                    horizontalMargin: 12,
                    minWidth: 600,
                    columns: [
                      DataColumn2(
                        label: Text('Nom'),
                        size: ColumnSize.L,
                      ),
                      DataColumn(
                        label: Text('Type'),
                      ),
                      DataColumn(
                        label: Text('Description'),
                      ),
                    ],
                    rows: List<DataRow>.generate(
                        cardNameListPlaque.length,
                        (index) => DataRow(cells: [
                              DataCell(Text(
                                  cardNameListPlaque.elementAt(index).name)),
                              DataCell(Text(getType(
                                  cardNameListPlaque.elementAt(index).type))),
                              DataCell(Text(cardNameListPlaque
                                  .elementAt(index)
                                  .description)),
                            ]))),
              ))
        ]));
  }
}
