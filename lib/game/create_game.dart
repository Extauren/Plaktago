
import 'dart:math';
import 'package:plaktago/data_class/bingo_card.dart';
import 'package:plaktago/data_class/game.dart';
import 'package:plaktago/game/board/cardName/card_name.dart';
import 'package:plaktago/utils/get_all_cards.dart';

List<BingoCard> createCardGame(Game game, final bool newGame, final int boardSize) {
  List<BingoCard> bingoCard = <BingoCard>[];
  CardName card = CardName(name: "", type: []);
  List<CardName> cardList = getAllCards().where((element) => element.type.contains(game.bingoType)).toList();
  Difficulty difficulty = Difficulty.hard;
  final int nbMedCard = getNbMedCard(cardList);
  final int nbHardCard = getNbHardCard(cardList);
  int nbRandomCard = 0;

  for (int it = 0; it < boardSize; it++) {
    if (it == nbHardCard) difficulty = Difficulty.medium;
    if (it == nbMedCard + nbHardCard) difficulty = Difficulty.easy;
    nbRandomCard = cardList.where((e) => e.difficulty == difficulty).toList().length;
    if (nbRandomCard <= 0) {
      card = cardList.elementAt(Random().nextInt(cardList.length));
    }
    else {
    card = cardList.where((element) =>
      element.difficulty == difficulty).elementAt(Random().nextInt(nbRandomCard));
    }
    if (card.excludes != null) {
      for (int it = 0; it < card.excludes!.length; it++) {
        cardList.remove(cardList.where((e) => e.name == card.excludes![it]).first);
      }
    }
    cardList.remove(card);
    bingoCard.add(BingoCard(name: card.name, icon: card.icon, desc: card.description, difficulty: card.difficulty));
  }
  bingoCard.shuffle();
  return bingoCard;
}

int getNbMedCard(final List<CardName> cardList) {
  final int maxMedCard = cardList.where((element) => element.difficulty == Difficulty.medium).toList().length < 7 ?
  cardList.where((element) => element.difficulty == Difficulty.medium).toList().length : 7;

  return doubleInRange(5, maxMedCard).toInt();
}

int getNbHardCard(final List<CardName> cardList) {
  final int maxHardCard = cardList.where((element) => element.difficulty == Difficulty.hard).toList().length < 5 ?
  cardList.where((element) => element.difficulty == Difficulty.hard).toList().length : 5;

  return doubleInRange(2, maxHardCard).toInt();
}

double doubleInRange(num start, num end) =>
    Random().nextDouble() * (end - start) + start;