import 'package:flutter/material.dart';
import 'package:plaktago/home/bingo_type_button.dart';
import 'package:plaktago/home/personalize/personalize.dart';

class Perso extends StatefulWidget {
  final ScrollController parentScrollController;
  final List<PersonalizeCard> cards;
  final BingoType type;
  final int nbCards;
  final Function changeNbCardValue;

  Perso({
    Key? key,
    required this.parentScrollController,
    required this.cards,
    required this.type,
    required this.nbCards,
    required this.changeNbCardValue
  }) : super(key: key);

  @override
  State<Perso> createState() => _Perso();
}

class _Perso extends State<Perso> {
  final Key personalizeKey = PageStorageKey('personalizeKey');
  ScrollController _childScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: NotificationListener(
        onNotification: (ScrollNotification notification) {
          if (notification is ScrollUpdateNotification) {
            if (notification.metrics.pixels ==
                notification.metrics.maxScrollExtent) {
              widget.parentScrollController.animateTo(
                  widget.parentScrollController.position.maxScrollExtent,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeIn);
            } else if (notification.metrics.pixels ==
                notification.metrics.minScrollExtent) {
              widget.parentScrollController.animateTo(
                  widget.parentScrollController.position.minScrollExtent,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeIn);
            }
          }
          return true;
        },
        child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height,
        ),
        child: Personalize(
          key: personalizeKey,
          cards: widget.cards,
          type: widget.type,
          nbCardSelect: widget.nbCards,
          changeNbCardValue: widget.changeNbCardValue,
          controller: _childScrollController
        ))
      )
    );
  }

}