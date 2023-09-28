import 'package:isar/isar.dart';
import 'package:plaktago/game/board/bingo_card.dart';
import 'package:plaktago/game/timer/timer.dart';
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
  bool isAlcool;
  int nbShot;
  bool favorite;
  List<BingoCard> bingoCards;
  @enumerated
  Mode mode;
  bool isPlaying;
  @ignore
  Timer timer = Timer();

  Game({
    this.id = Isar.autoIncrement,
    this.gameNumber = -1,
    this.points = 0,
    this.bingoType = BingoType.plaque,
    this.date = "",
    this.hour = "",
    this.time = "",
    this.isAlcool = false,
    this.nbShot = -1,
    this.favorite = false,
    this.bingoCards = const [],
    this.mode = Mode.random,
    this.isPlaying = false,
  });

  void resetGameData() {
    bingoType = BingoType.plaque;
    mode = Mode.random;
    bingoCards = <BingoCard>[];
    //personalizeCards = <PersonalizeCard>[];
    points = 0;
    isPlaying = false;
    gameNumber = -1;
    isAlcool = false;
    nbShot = 0;
    time = "";
    timer = Timer();
  }
}
