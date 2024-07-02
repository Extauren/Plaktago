import 'package:flutter/material.dart';
import 'package:plaktago/components/table.dart';
import 'package:plaktago/data_class/save_game.dart';
import 'package:plaktago/game/board/cardName/card_name.dart';

class CardListData {
  final int pourcentage;
  final String difficulty;
  final String cardName;
  final int nbPlayed;
  final int nbCheck;

  CardListData(
      { required this.pourcentage,
      required this.difficulty,
      required this.cardName,
      required this.nbPlayed,
      required this.nbCheck});
}

class BestCardsList extends StatefulWidget {
  final List<CardList> cardList;
  final int nbRows;
  final double? headingRowHeight;
  final double? dataRowHeight;

  BestCardsList(
      {Key? key,
      required this.cardList,
      required this.nbRows,
      this.headingRowHeight,
      this.dataRowHeight})
      : super(key: key);

  @override
  State<BestCardsList> createState() => _BestCardsList();
}

class _BestCardsList extends State<BestCardsList> {
  List<String> headerText = ["Nom", "Joué", "Coché", "Diff"];
  List<List<String>> rowsText = [[], [], [], []];
  List<CardListData> cardListData = [];

  @override
  void initState() {
    super.initState();
    getPourcentages();
    rowsText[0] = cardListData.map((e) => e.cardName).toList();
    rowsText[1] = cardListData.map((e) => e.nbPlayed.toString()).toList();
    rowsText[2] = cardListData.map((e) => e.nbCheck.toString()).toList();
    rowsText[3] = cardListData.map((e) => e.difficulty.toString()).toList();
  }

  void getPourcentages() {
    double pourcentage = 0;
    String difficulty = "NA";

    for (int it = 0; it < widget.cardList.length; it++) {
      if (widget.cardList.elementAt(it).nbPlayed == 0) {
        pourcentage = 0;
      } else {
        pourcentage = widget.cardList.elementAt(it).nbCheck /
            widget.cardList.elementAt(it).nbPlayed *
            100;
      }
      if (widget.cardList.elementAt(it).difficulty != Difficulty.unknow) {
        difficulty = widget.cardList.elementAt(it).difficulty.name[0].toUpperCase();
      }
      cardListData.add(CardListData(
          pourcentage: pourcentage.round(),
          difficulty: difficulty,
          cardName: widget.cardList.elementAt(it).cardName,
          nbPlayed: widget.cardList.elementAt(it).nbPlayed,
          nbCheck: widget.cardList.elementAt(it).nbCheck));
    }
    cardListData.sort((a, b) {
      int cmp = b.pourcentage.compareTo(a.pourcentage);
      if (cmp != 0) return cmp;
      return b.nbPlayed.compareTo(a.nbPlayed);
    });
  }

  @override
  Widget build(BuildContext context) {
    return PTable(
      headerText: headerText,
      rowsText: rowsText,
      nbRows: widget.nbRows,
      headingRowHeight: widget.headingRowHeight,
      dataRowHeight: widget.dataRowHeight,
    );
  }
}
