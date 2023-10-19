import 'package:flutter/material.dart';
import '../game/board/card_name.dart';
import 'bingo_type_button.dart';

class PersonalizeCard {
  String name;
  bool isSelect;

  PersonalizeCard({required this.name, this.isSelect = false});
}

class Personalize extends StatefulWidget {
  final List<PersonalizeCard> cards;
  final BingoType type;
  final int nbCardSelect;
  final Function changeNbCardValue;
  final ScrollController controller;
  Personalize(
      {Key? key,
      required this.cards,
      required this.type,
      required this.nbCardSelect,
      required this.changeNbCardValue,
      required this.controller})
      : super(key: key);

  @override
  State<Personalize> createState() => _Personalize();
}

class _Personalize extends State<Personalize> {
  List<CardName> cardList = [];

  @override
  void initState() {
    super.initState();
    List<CardName> cardList = [];
    cardList = cardNameListPlaque
        .where((element) => element.type.contains(widget.type))
        .toList();
    if (widget.type == BingoType.exploration) {
      cardList.addAll(cardNameListPlaque
          .where((element) => element.type.contains(BingoType.kta))
          .toList());
    }

    for (int it = 0; it < cardList.length; it++) {
      widget.cards.add(PersonalizeCard(name: cardList.elementAt(it).name));
    }
    widget.cards.shuffle();
  }

  Color getCardColor(final int index) {
    if (widget.cards.elementAt(index).isSelect) {
      return Color.fromRGBO(153, 219, 129, 1);
    }
    return Colors.grey[50]!;
  }

  void _selectCard(final int index) {
    setState(() {
      if (widget.cards.elementAt(index).isSelect == false &&
          widget.nbCardSelect < 16) {
        widget.cards.elementAt(index).isSelect = true;
        widget.changeNbCardValue(1);
      } else if (widget.cards.elementAt(index).isSelect == true) {
        widget.cards.elementAt(index).isSelect = false;
        widget.changeNbCardValue(-1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 500,
        child: ListView.builder(
            controller: widget.controller,
            itemCount: widget.cards.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () => _selectCard(index),
                  child: Container(
                      height: 60,
                      margin: EdgeInsets.symmetric(horizontal: 50),
                      child: Card(
                          color: getCardColor(index),
                          child: Center(
                              child: Text(widget.cards[index].name,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black))))));
            }));
  }
}
