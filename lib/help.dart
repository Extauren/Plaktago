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
        body: Padding(
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
                        DataCell(
                            Text(cardNameListPlaque.elementAt(index).name)),
                        DataCell(Text(
                            getType(cardNameListPlaque.elementAt(index).type))),
                        DataCell(Text(
                            cardNameListPlaque.elementAt(index).description)),
                      ]))),
        ));
  }
}
