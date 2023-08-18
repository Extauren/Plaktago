import 'package:plaktago/home/bingoTypeButton.dart';
import 'package:plaktago/home/modeButton.dart';

class BingoParams {
  BingoType bingoType;
  Mode mode;

  BingoParams({
    this.bingoType = BingoType.plaque,
    this.mode = Mode.random,
  });

  clone() => BingoParams(bingoType: bingoType, mode: mode);

  void updateBingoType(BingoType newValue) {
    bingoType = newValue;
  }

  void updateMode(Mode newValue) {
    mode = newValue;
  }

  void resetParams() {
    bingoType = BingoType.plaque;
    mode = Mode.random;
  }
}
