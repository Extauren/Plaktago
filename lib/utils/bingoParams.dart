import 'package:plaktago/home/difficultyButton.dart';
import 'package:plaktago/home/plaqueTypeButton.dart';
import 'package:plaktago/home/ratDropdownButton.dart';
import 'package:plaktago/home/bingoTypeButton.dart';
import 'package:plaktago/home/modeButton.dart';

class BingoParams {
  BingoType bingoType = BingoType.plaque;
  Mode mode = Mode.random;
  PlaqueType plaque = PlaqueType.triangle;
  RatType ratType = RatType.salle;
  Difficulty difficulty = Difficulty.easy;

  void updateBingoType(BingoType newValue) {
    bingoType = newValue;
  }

  void updateMode(Mode newValue) {
    mode = newValue;
  }

  void updatePlaque(PlaqueType newValue) {
    plaque = newValue;
  }

  void updateRat(RatType newValue) {
    ratType = newValue;
  }

  void updateDifficulty(Difficulty newValue) {
    difficulty = newValue;
  }

  void resetParams() {
    bingoType = BingoType.plaque;
    plaque = PlaqueType.triangle;
    ratType = RatType.salle;
    mode = Mode.random;
    difficulty = Difficulty.easy;
  }

  static BingoParams newBingoParams() {
    return BingoParams();
  }
}
