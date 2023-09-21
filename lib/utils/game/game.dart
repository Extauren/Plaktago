import 'package:isar/isar.dart';
import 'package:plaktago/game/board/bingo_card.dart';
import 'package:plaktago/home/bingo_type_button.dart';

part 'game.g.dart';

@collection
class Game {
  Id id;
  int gameNumber;
  int points;
  @enumerated
  BingoType bingoType;
  String date;
  String hour;
  String time;
  bool isAlcool;
  int nbShot;
  List<BingoCard> bingoCardList;

  Game(
      {this.id = Isar.autoIncrement,
      required this.gameNumber,
      required this.points,
      required this.bingoType,
      required this.date,
      required this.hour,
      required this.time,
      required this.isAlcool,
      required this.nbShot,
      required this.bingoCardList});
}
