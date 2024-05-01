
import 'package:plaktago/data_class/bingo_card.dart';
import 'dart:math';

import 'package:plaktago/data_class/game.dart';
import 'package:plaktago/game/board/card_name.dart';
import 'package:plaktago/game/board/cardName/chantier.dart';
import 'package:plaktago/game/board/cardName/explo.dart';

List<BingoCard> createCardGame(Game game, final bool newGame, final int boardSize) {
  List<BingoCard> bingoCard = <BingoCard>[];
  CardName card = CardName(name: "", type: []);
  List<CardName> allCard = cardNameListPlaque + exploCard + chantierCard;
  List<CardName> cardList = allCard.where((element) => element.type.contains(game.bingoType)).toList();

  for (int it = 0; it < boardSize; it++) {
    card = cardList.elementAt(Random().nextInt(cardList.length));
    cardList.remove(card);
    bingoCard.add(BingoCard(name: card.name, icon: card.icon, desc: card.description));
  }
  bingoCard.shuffle();

  return bingoCard;
}