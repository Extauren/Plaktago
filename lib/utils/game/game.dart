import 'package:isar/isar.dart';
import 'package:plaktago/game/board/bingo_card.dart';
import 'package:plaktago/home/bingo_type_button.dart';
import 'package:plaktago/home/mode_button.dart';

part 'game.g.dart';

@collection
class Game {
  int id;
  int gameNumber;
  int points;
  @enumValue
  BingoType bingoType;
  String date;
  String hour;
  String time;
  bool isAlcool;
  int nbShot;
  bool favorite;
  List<BingoCard> bingoCards;
  @enumValue
  Mode mode;
  bool isPlaying;
  Game({
    this.id = 0,
    this.gameNumber = -1,
    this.points = 0,
    this.bingoType = BingoType.plaque,
    this.date = "",
    this.hour = "",
    this.time = "",
    this.isAlcool = false,
    this.nbShot = -1,
    this.favorite = false,
    this.bingoCards = const <BingoCard>[],
    this.mode = Mode.random,
    this.isPlaying = false,
  });

  void resetGameData() {
    gameNumber = -1;
    bingoType = BingoType.plaque;
    mode = Mode.random;
    bingoCards = <BingoCard>[];
    points = 0;
    isPlaying = false;
    gameNumber = -1;
    isAlcool = false;
    favorite = false;
    nbShot = 0;
    time = "";
    date = "";
    hour = "";
    time = "";
  }
}
