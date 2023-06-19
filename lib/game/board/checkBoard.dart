import 'bingoCard.dart';

class CheckBoard {
  final int nbLines;

  CheckBoard({required this.nbLines});

  void checkColumn(List<BingoCard> bingoCard, int index, bool newState) {
    int counter = 0;
    double buffer = index - ((index / nbLines) * nbLines) + index % nbLines;
    int cardPos = buffer.round();
    for (int it = 0; it < nbLines; it++) {
      if (bingoCard.elementAt(cardPos + (it * nbLines)).isSelect == true) {
        counter += 1;
      }
    }
    if (counter == nbLines) {
      for (int it = 0; it < nbLines; it++) {
        bingoCard.elementAt(cardPos + (it * nbLines)).nbLineComplete += 1;
      }
    } else if (counter == nbLines - 1 && !newState) {
      for (int it = 0; it < nbLines; it++) {
        bingoCard.elementAt(cardPos + (it * nbLines)).nbLineComplete -= 1;
      }
    }
  }

  void checkLine(List<BingoCard> bingoCard, int index, bool newState) {
    int cardPos = index - (index % nbLines);
    int counter = 0;
    for (int it = 0; it < nbLines; it++) {
      if (bingoCard.elementAt(cardPos + it).isSelect == true) {
        counter += 1;
      }
    }
    if (counter == nbLines) {
      for (int it = 0; it < nbLines; it++) {
        bingoCard.elementAt(cardPos + it).nbLineComplete += 1;
      }
    } else if (counter == nbLines - 1 && !newState) {
      for (int it = 0; it < nbLines; it++) {
        bingoCard.elementAt(cardPos + it).nbLineComplete -= 1;
      }
    }
  }

  void checkDiagonal(
      List<BingoCard> bingoCard, int index, bool newState, int incrementValue) {
    int counter = 0;
    int buffer = 0;

    buffer = index;
    for (int it = 0; it < nbLines; it++) {
      if (bingoCard.elementAt(buffer).isSelect) {
        counter += 1;
      }
      buffer += incrementValue;
    }
    buffer = index;
    if (counter == nbLines) {
      for (int it = 0; it < nbLines; it++) {
        bingoCard.elementAt(buffer).nbLineComplete += 1;
        buffer += incrementValue;
      }
    } else if (counter == nbLines - 1 && !newState) {
      for (int it = 0; it < nbLines; it++) {
        bingoCard.elementAt(buffer).nbLineComplete -= 1;
        buffer += incrementValue;
      }
    }
  }

  // void checkAllBoard(
  //     final int index,
  //     List<BingoCard> bingoCard,
  //     final List<int> firstDiagonalValues,
  //     final List<int> secondDiagonalValues) {
  //   bool newState = !bingoCard.elementAt(index).isSelect;

  //   checkColumn(bingoCard, index, newState);
  //   checkLine(bingoCard, index, newState);
  //   if (firstDiagonalValues.contains(index)) {
  //     checkDiagonal(bingoCard, 0, newState, nbLines + 1);
  //   } else if (secondDiagonalValues.contains(index)) {
  //     checkDiagonal(bingoCard, nbLines - 1, newState, nbLines - 1);
  //   }
  // }
}
