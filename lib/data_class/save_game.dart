import 'package:isar/isar.dart';
import 'package:plaktago/game/board/cardName/card_name.dart';
import 'package:plaktago/home/bingo_type_button.dart';

part 'save_game.g.dart';

@embedded
class CardList {
  String cardName;
  int nbPlayed;
  int nbCheck;
  String desc;
  @enumerated
  List<BingoType> type;
  @enumerated
  Difficulty difficulty;

  CardList({this.cardName = "", this.nbPlayed = 0, this.nbCheck = 0, this.difficulty = Difficulty.unknow, this.desc = "", this.type = const []});
}
