import 'package:isar/isar.dart';
import 'package:plaktago/game/board/cardName/card_name.dart';

part 'bingo_card.g.dart';

@embedded
class BingoCard {
  final String name;
  final String? icon;
  bool isSelect;
  int nbLineComplete;
  int order;
  final String desc;
  @enumerated
  final Difficulty difficulty;

  BingoCard({
    this.name = "",
    this.icon,
    this.isSelect = false,
    this.nbLineComplete = 0,
    this.order = -1,
    this.desc = "",
    this.difficulty = Difficulty.unknow
  });
}
