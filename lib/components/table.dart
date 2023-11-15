import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';

class PTable extends StatefulWidget {
  final int nbRows;
  final List<String> headerText;
  final List<List<String>> rowsText;
  PTable(
      {Key? key,
      required this.nbRows,
      required this.headerText,
      required this.rowsText})
      : super(key: key);

  @override
  State<PTable> createState() => _PTable();
}

class _PTable extends State<PTable> {
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
          headingRowHeight: 60,
          dataRowHeight: 50,
          columns: [
            DataColumn2(label: Text(widget.headerText[0]), fixedWidth: 105),
            DataColumn2(label: Text(widget.headerText[1]), fixedWidth: 100),
            DataColumn2(label: Text(widget.headerText[2]), fixedWidth: 100),
            DataColumn2(label: Text(widget.headerText[3]), fixedWidth: 55),
          ],
          rows: List<DataRow>.generate(
              widget.nbRows,
              (index) => DataRow(cells: [
                    DataCell(Text(
                      widget.rowsText[0][index],
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    )),
                    DataCell(Center(
                        child: Text(
                      widget.rowsText[1][index],
                    ))),
                    DataCell(Center(child: Text(widget.rowsText[2][index]))),
                    DataCell(Text(widget.rowsText[3][index]))
                  ]))),
    );
  }
}
