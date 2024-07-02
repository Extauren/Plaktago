import 'package:isar/isar.dart';
import 'package:plaktago/game/board/cardName/card_name.dart';

part 'save_game.g.dart';

@embedded
class CardList {
  String cardName;
  int nbPlayed;
  int nbCheck;
  @enumerated
  Difficulty difficulty;

  CardList({this.cardName = "", this.nbPlayed = 0, this.nbCheck = 0, this.difficulty = Difficulty.unknow});
}
