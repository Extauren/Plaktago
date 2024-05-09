import 'package:flutter/material.dart';
import 'package:plaktago/data_class/save_game.dart';
import 'package:plaktago/statistic/general/best_cards_list.dart';

class CardListStat extends StatefulWidget {
  final List<CardList> cardList;
  CardListStat({Key? key, required this.cardList}) : super(key: key);

  @override
  State<CardListStat> createState() => _CardList();
}

class _CardList extends State<CardListStat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: BestCardsList(
              cardList: widget.cardList,
              nbRows: widget.cardList.length,
            )));
  }
}
