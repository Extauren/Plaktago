import 'package:flutter/material.dart';
import '../game/board/cardName.dart';
import 'bingoTypeButton.dart';

class PersonalizeCard {
  String name;
  bool isSelect;

  PersonalizeCard({required this.name, this.isSelect = false});
}

class Personalize extends StatefulWidget {
  List<PersonalizeCard> cards;
  final BingoType type;
  int nbCardSelect;
  Function changeNbCardValue;
  Personalize(
      {Key? key,
      required this.cards,
      required this.type,
      required this.nbCardSelect,
      required this.changeNbCardValue})
      : super(key: key);

  @override
  State<Personalize> createState() => _Personalize();
}

class _Personalize extends State<Personalize> {
  List<CardName> cardList = [];

  @override
  void initState() {
    List<CardName> cardList = [];
    super.initState();
    for (int it = 0; it < cardNameListPlaque.length; it++) {
      if (cardNameListPlaque.elementAt(it).type.contains(widget.type)) {
        cardList.add(cardNameListPlaque.elementAt(it));
      }
    }
    for (int it = 0; it < cardList.length; it++) {
      widget.cards.add(PersonalizeCard(name: cardList.elementAt(it).name));
    }
  }

  Color getCardColor(final int index) {
    if (widget.cards.elementAt(index).isSelect) {
      return Color.fromRGBO(153, 219, 129, 1);
    }
    return Colors.grey[300]!;
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

  // Display difficulty in card
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 550,
        child: ListView.builder(
            itemCount: widget.cards.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () => _selectCard(index),
                  child: Container(
                      height: 60,
                      margin: EdgeInsets.symmetric(horizontal: 30),
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
