import 'package:flutter/material.dart';
import 'package:plaktago/components/table.dart';
import 'package:plaktago/data_class/save_game.dart';
import 'package:plaktago/home/bingo_type_button.dart';

class CardListData {
  final int pourcentage;
  final List<BingoType> type;
  final String cardName;
  final int nbPlayed;
  final int nbCheck;
  final String difficulty;
  final String desc;
  final String? icon;

  CardListData({
    required this.pourcentage,
    required this.type,
    required this.cardName,
    required this.nbPlayed,
    required this.nbCheck,
    required this.difficulty,
    required this.desc,
    required this.icon
  });
}

class BestCardsList extends StatefulWidget {
  final List<CardList> cardList;
  final int nbRows;
  final double? headingRowHeight;
  final double? dataRowHeight;

  BestCardsList({
    Key? key,
    required this.cardList,
    required this.nbRows,
    this.headingRowHeight,
    this.dataRowHeight
  }) : super(key: key);

  @override
  State<BestCardsList> createState() => _BestCardsList();
}

class _BestCardsList extends State<BestCardsList> {
  List<String> headerText = ["Nom", "Joué", "Coché", "Type"];
  List<CardListData> cardListData = [];

  @override
  void initState() {
    super.initState();
    getPourcentages();
  }

  void getPourcentages() {
    double pourcentage = 0;
    int cmp = 0;

    for (int it = 0; it < widget.cardList.length; it++) {
      if (widget.cardList.elementAt(it).nbPlayed == 0) {
        pourcentage = 0;
      } else {
        pourcentage = widget.cardList.elementAt(it).nbCheck /
          widget.cardList.elementAt(it).nbPlayed * 100;
      }
      cardListData.add(CardListData(
          pourcentage: pourcentage.round(),
          type: widget.cardList.elementAt(it).type!,
          cardName: widget.cardList.elementAt(it).cardName,
          nbPlayed: widget.cardList.elementAt(it).nbPlayed,
          nbCheck: widget.cardList.elementAt(it).nbCheck,
          difficulty: widget.cardList.elementAt(it).difficulty.name,
          desc: widget.cardList.elementAt(it).desc,
          icon: widget.cardList.elementAt(it).icon
      ));
    }
    cardListData.sort((a, b) {
      cmp = b.pourcentage.compareTo(a.pourcentage);
      if (cmp != 0) return cmp;
      return b.nbPlayed.compareTo(a.nbPlayed);
    });
  }

  @override
  Widget build(BuildContext context) {
    return PTable(
      headerText: headerText,
      cardData: cardListData,
      nbRows: widget.nbRows,
      headingRowHeight: widget.headingRowHeight,
      dataRowHeight: widget.dataRowHeight,
    );
  }
}
