import 'package:isar/isar.dart';
import 'package:plaktago/game/board/cardName/card_name.dart';
import 'package:plaktago/data_class/save_game.dart';

part 'general.g.dart';

@collection
class General {
  Id id = 0;
  int nbGames = 0;
  int bingoPlaque = 0;
  int bingoKta = 0;
  int bingoExplo = 0;
  int bingoWin = 0;
  int bingoChantier = 0;
  int nbLines = 0;
  int nbPoints = 0;
  List<CardList> cardList =
      cardNameListPlaque.map((item) => CardList(cardName: item.name, difficulty: item.difficulty, desc: item.description, type: item.type)).toList();
}
