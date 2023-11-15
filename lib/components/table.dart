import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';

class PTable extends StatelessWidget {
  PTable(
      {Key? key,
      required this.nbRows,
      required this.headerText,
      required this.rowsText,
      this.headingRowHeight,
      this.dataRowHeight});

  final int nbRows;
  final List<String> headerText;
  final List<List<String>> rowsText;
  final double? headingRowHeight;
  final double? dataRowHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: DataTable2(
          showBottomBorder: false,
          border: TableBorder.all(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              color: Theme.of(context).colorScheme.secondary),
          horizontalMargin: 12,
          headingRowHeight: headingRowHeight,
          dataRowHeight: dataRowHeight,
          headingTextStyle: TextStyle(fontWeight: FontWeight.bold),
          columns: [
            DataColumn2(label: Text(headerText[0]), fixedWidth: 101),
            DataColumn2(label: Text(headerText[1]), fixedWidth: 96),
            DataColumn2(label: Text(headerText[2]), fixedWidth: 96),
            DataColumn2(label: Text(headerText[3]), fixedWidth: 55),
          ],
          rows: List<DataRow>.generate(
              nbRows,
              (index) => DataRow(cells: [
                    DataCell(Text(
                      rowsText[0][index],
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    )),
                    DataCell(Center(
                        child: Text(
                      rowsText[1][index],
                    ))),
                    DataCell(Center(child: Text(rowsText[2][index]))),
                    DataCell(Text(rowsText[3][index]))
                  ]))),
    );
  }
}
