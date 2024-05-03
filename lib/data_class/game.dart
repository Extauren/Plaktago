import 'package:isar/isar.dart';
import 'package:plaktago/data_class/bingo_card.dart';
import 'package:plaktago/home/bingo_type_button.dart';
import 'package:plaktago/home/mode_button.dart';

part 'game.g.dart';

@collection
class Game {
  Id id = Isar.autoIncrement;
  int gameNumber;
  int points;
  @enumerated
  BingoType bingoType;
  String date;
  String hour;
  String time;
  bool favorite;
  List<BingoCard> bingoCards;
  @enumerated
  Mode mode;
  bool isPlaying;
  int nbLines;
  @ignore
  bool updateGame;
  Game(
      {this.id = Isar.autoIncrement,
      this.gameNumber = -1,
      this.points = 0,
      this.bingoType = BingoType.kta,
      this.date = "",
      this.hour = "",
      this.time = "",
      this.favorite = false,
      this.bingoCards = const <BingoCard>[],
      this.mode = Mode.random,
      this.isPlaying = false,
      this.updateGame = false,
      this.nbLines = 0});

  void resetGameData() {
    gameNumber = -1;
    bingoType = BingoType.plaque;
    mode = Mode.random;
    bingoCards = <BingoCard>[];
    points = 0;
    isPlaying = false;
    gameNumber = -1;
    favorite = false;
    time = "";
    date = "";
    hour = "";
    time = "";
    updateGame = false;
    nbLines = 0;
  }
}
