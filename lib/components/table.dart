import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plaktago/statistic/general/best_cards_list.dart';
import 'package:plaktago/utils/get_card_icon.dart';
import 'package:plaktago/utils/get_icon.dart';

class PTable extends StatefulWidget {
  PTable({
    Key? key,
    required this.nbRows,
    required this.headerText,
    required this.cardData,
    this.headingRowHeight,
    this.dataRowHeight});

  final int nbRows;
  final List<String> headerText;
  final List<CardListData> cardData;
  final double? headingRowHeight;
  final double? dataRowHeight;

@override
  State<PTable> createState() => _Ptable();
}

class _Ptable extends State<PTable> {

  void _sortByType(final bool ascending) {
    setState(() {
      if (ascending) {
        widget.cardData.sort((a, b) => a.type[0].name.compareTo(b.type[0].name));
      }
      else {
        widget.cardData.sort((a, b) => b.type[0].name.compareTo(a.type[0].name));
      }
    });
  }

  void _sortByName(final bool ascending) {
    setState(() {
      if (ascending) {
        widget.cardData.sort((a, b) => a.cardName.compareTo(b.cardName));
      }
      else {
        widget.cardData.sort((a, b) => b.cardName.compareTo(a.cardName));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 10),
    child:
    DataTable2(
      showCheckboxColumn: false,
      showHeadingCheckBox: false,
      showBottomBorder: false,
      sortArrowIcon: IconData(0),
      datarowCheckboxTheme: CheckboxThemeData(
        overlayColor: MaterialStateColor.resolveWith((states) => Theme.of(context).colorScheme.primary),
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
        )
      ),
      border: TableBorder.all(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
          color: Theme.of(context).colorScheme.secondary),
      horizontalMargin: 12,
      headingRowHeight: widget.headingRowHeight,
      dataRowHeight: widget.dataRowHeight,
      headingTextStyle: TextStyle(fontWeight: FontWeight.bold),
      columns: [
        DataColumn2(label: Center(child: Text(widget.headerText[0])), size: ColumnSize.M, onSort: ((columnIndex, ascending) => _sortByName(ascending))),
        DataColumn2(label: Icon(IconDataSolid(int.parse("0xf00d"))), size: ColumnSize.S), // Icone case vide
        DataColumn2(label: Icon(IconDataSolid(int.parse("0xf00c"))), size: ColumnSize.S), // Icone case remplis
        DataColumn2(label: Text(widget.headerText[3]), size: ColumnSize.S, onSort: ((columnIndex, ascending) => _sortByType(ascending))), //Icone type de bingo ?
      ],
      rows: List<DataRow>.generate(widget.nbRows,
        (index) => DataRow(
          cells: [
            DataCell(Center(
              child: Text(
                widget.cardData.elementAt(index).cardName,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              )
            )),
            DataCell(Center(child: Text(widget.cardData.elementAt(index).nbPlayed.toString()))),
            DataCell(Center(child: Text(widget.cardData.elementAt(index).nbCheck.toString()))),
            DataCell(getIcon(widget.cardData.elementAt(index).type[0])),
          ],
          onSelectChanged: (value) => CardDialog(context: context, card: widget.cardData.elementAt(index)).show()
        )
      ),
    ));
  }
}

class CardDialog {
  CardDialog({
    required this.context,
    required this.card,
  });

  final BuildContext context;
  final CardListData card;

  void show() => AwesomeDialog(
    context: context,
    animType: AnimType.bottomSlide,
    dialogType: DialogType.noHeader,
    headerAnimationLoop: false,
    padding: EdgeInsets.only(top: 5, left: 30, right: 30, bottom: 10),
    dialogBackgroundColor: Theme.of(context).colorScheme.surface,
    body: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getCardIcon(card.icon, EdgeInsets.only(right: 10), context, Theme.of(context).colorScheme.primaryContainer),
            Text(
              card.cardName,
              style: TextStyle(
                fontSize: 18,
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold
              )
            )
          ]
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Column(
            children: [
              SizedBox(height: 8),
              card.desc == ""
               ? Text("Pas de description")
               : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    card.desc,
                    textAlign: TextAlign.center
                  )
                )
            ]
          )
        ),
        Padding(
          padding: EdgeInsets.only(top: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  getIcon(card.type[0]),
                  SizedBox(height: 8),
                  Text(card.type[0].name)
                ],
              ),
              Column(
                children: [
                  Icon(IconDataSolid(int.parse("0xf624"))),
                  SizedBox(height: 8),
                  Text(card.difficulty)
                ],
              )
            ]
          )
        ),
      ]
    ),
    borderSide: BorderSide(width: 0.5, color: Theme.of(context).colorScheme.secondary),
  ).show();
}

