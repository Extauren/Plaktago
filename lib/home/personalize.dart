import 'package:flutter/material.dart';
import 'package:plaktago/utils/get_card_icon.dart';
import '../game/board/cardName/card_name.dart';
import 'bingo_type_button.dart';

class PersonalizeCard {
  final String name;
  bool isSelect;
  final String? icon;
  Color textColor;

  PersonalizeCard(
      {required this.name,
      this.isSelect = false,
      this.icon,
      this.textColor = Colors.white});
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

    widget.cards.clear();
    cardList = cardNameListPlaque
        .where((element) => element.type.contains(widget.type))
        .toList();
    if (widget.type == BingoType.exploration) {
      cardList.addAll(cardNameListPlaque
          .where((element) => element.type.contains(BingoType.kta))
          .toList());
    }
    cardList.sort((a, b) {
      return a.name.toLowerCase().compareTo(b.name.toLowerCase());
    });

    for (int it = 0; it < cardList.length; it++) {
      widget.cards.add(PersonalizeCard(
          name: cardList.elementAt(it).name,
          icon: cardList.elementAt(it).icon));
    }
  }

  Color getCardColor(final int index) {
    if (widget.cards.elementAt(index).isSelect) {
      return Theme.of(context).colorScheme.secondary;
    }
    return Theme.of(context).colorScheme.surface;
  }

  void _selectCard(final int index) {
    setState(() {
      if (widget.cards.elementAt(index).isSelect == false &&
          widget.nbCardSelect < 16) {
        widget.cards.elementAt(index).isSelect = true;
        widget.changeNbCardValue(widget.nbCardSelect + 1);
        widget.cards.elementAt(index).textColor = Colors.black;
      } else if (widget.cards.elementAt(index).isSelect == true) {
        widget.cards.elementAt(index).isSelect = false;
        widget.changeNbCardValue(widget.nbCardSelect - 1);
        widget.cards.elementAt(index).textColor = Colors.white;
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
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                getCardIcon(
                                    widget.cards.elementAt(index),
                                    EdgeInsets.only(right: 10),
                                    widget.cards.elementAt(index).textColor),
                                Text(widget.cards.elementAt(index).name,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: widget.cards
                                            .elementAt(index)
                                            .textColor))
                              ])))));
            }));
  }
}
