import 'package:flutter/material.dart';
import 'package:plaktago/components/table.dart';
import 'package:plaktago/data_class/save_game.dart';

class BestCardsList extends StatefulWidget {
  final List<CardList> cardList;
  final int nbRows;

  BestCardsList({Key? key, required this.cardList, required this.nbRows})
      : super(key: key);

  @override
  State<BestCardsList> createState() => _BestCardsList();
}

class _BestCardsList extends State<BestCardsList> {
  List<String> headerText = ["Nom", "Joué", "Coché", "%"];
  List<List<String>> rowsText = [[], [], [], []];
  List<String> pourcentages = [];

  @override
  void initState() {
    super.initState();
    getPourcentages();
    rowsText[0] = widget.cardList.map((e) => e.cardName.toString()).toList();
    rowsText[1] = widget.cardList.map((e) => e.nbCheck.toString()).toList();
    rowsText[2] = widget.cardList.map((e) => e.nbPlayed.toString()).toList();
    rowsText[3] = pourcentages;
  }

  void getPourcentages() {
    double pourcentage = 0.0;

    for (int it = 0; it < widget.cardList.length; it++) {
      pourcentage = widget.cardList.elementAt(it).nbCheck /
          widget.cardList.elementAt(it).nbPlayed *
          100;
      pourcentages.add(pourcentage.round().toString());
    }
    pourcentages.sort((a, b) => b.compareTo(a));
  }

  @override
  Widget build(BuildContext context) {
    return PTable(
        headerText: headerText, rowsText: rowsText, nbRows: widget.nbRows);
  }
}
