import 'package:flutter_test/flutter_test.dart';
import 'package:plaktago/game/board/check_board.dart';
import 'package:plaktago/data_class/bingo_card.dart';

List<BingoCard> createBingoCardList(final int nbLines) {
  List<BingoCard> bingoCard = <BingoCard>[];

  for (int it = 0; it < nbLines * nbLines; it++) {
    bingoCard.add(BingoCard(name: "cardName"));
  }
  return bingoCard;
}

void main() {
  const nbLines = 4;

  group('Board', () {
    test('Zero cards select', () {
      CheckBoard checkBoard = CheckBoard(nbLines: nbLines);
      List<BingoCard> bingoCard = createBingoCardList(nbLines);
      List<BingoCard> result = List.from(bingoCard);

      checkBoard.checkLine(bingoCard, 0, true);
      expect(bingoCard, result);
    });

    test('First line complete', () {
      CheckBoard checkBoard = CheckBoard(nbLines: nbLines);
      List<BingoCard> bingoCard = createBingoCardList(nbLines);
      List<BingoCard> result = List.from(bingoCard);

      for (int it = 0; it < nbLines; it++) {
        bingoCard.elementAt(it).isSelect = true;
        result.elementAt(it).isSelect = true;
        result.elementAt(it).nbLineComplete = 1;
      }
      checkBoard.checkLine(bingoCard, 0, true);
      expect(bingoCard, result);
    });

    test('First column complete', () {
      CheckBoard checkBoard = CheckBoard(nbLines: nbLines);
      List<BingoCard> bingoCard = createBingoCardList(nbLines);
      List<BingoCard> result = List.from(bingoCard);

      for (int it = 0; it < nbLines; it++) {
        bingoCard.elementAt(it * 4).isSelect = true;
        result.elementAt(it * 4).isSelect = true;
        result.elementAt(it * 4).nbLineComplete = 1;
      }
      checkBoard.checkColumn(bingoCard, 0, true);
      expect(bingoCard, result);
    });

    test('First column and fist line complete', () {
      CheckBoard checkBoard = CheckBoard(nbLines: nbLines);
      List<BingoCard> bingoCard = createBingoCardList(nbLines);
      List<BingoCard> result = List.from(bingoCard);

      for (int it = 0; it < nbLines; it++) {
        bingoCard.elementAt(it * 4).isSelect = true;
        result.elementAt(it * 4).isSelect = true;
        result.elementAt(it * 4).nbLineComplete = 1;
      }
      for (int it = 0; it < nbLines; it++) {
        bingoCard.elementAt(it * 4).isSelect = true;
        result.elementAt(it * 4).isSelect = true;
        result.elementAt(it * 4).nbLineComplete = 2;
      }
      checkBoard.checkColumn(bingoCard, 0, true);
      checkBoard.checkLine(bingoCard, 0, true);
      expect(bingoCard, result);
    });

    test('First diagonal complete', () {
      CheckBoard checkBoard = CheckBoard(nbLines: nbLines);
      List<BingoCard> bingoCard = createBingoCardList(nbLines);
      List<BingoCard> result = List.from(bingoCard);
      int buffer = 0;
      const int incrementValue = nbLines + 1;

      for (int it = 0; it < nbLines; it++) {
        bingoCard.elementAt(buffer).isSelect = true;
        result.elementAt(buffer).isSelect = true;
        result.elementAt(buffer).nbLineComplete = 1;
        buffer += incrementValue;
      }
      checkBoard.checkDiagonal(bingoCard, 0, true, incrementValue);
      expect(bingoCard, result);
    });

    test('Second diagonal complete', () {
      CheckBoard checkBoard = CheckBoard(nbLines: nbLines);
      List<BingoCard> bingoCard = createBingoCardList(nbLines);
      List<BingoCard> result = createBingoCardList(nbLines);
      int buffer = nbLines - 1;
      const int incrementValue = nbLines - 1;

      for (int it = 0; it < nbLines; it++) {
        bingoCard.elementAt(buffer).isSelect = true;
        result.elementAt(buffer).isSelect = true;
        result.elementAt(buffer).nbLineComplete = 1;
        buffer += incrementValue;
      }
      buffer = nbLines - 1;
      for (int it = 0; it < nbLines; it++) {
        buffer += incrementValue;
      }
      checkBoard.checkDiagonal(bingoCard, nbLines - 1, true, incrementValue);
      buffer = nbLines - 1;
      for (int it = 0; it < nbLines; it++) {
        expect(bingoCard.elementAt(buffer).nbLineComplete,
            result.elementAt(buffer).nbLineComplete);
        buffer += incrementValue;
      }
    });
  });
}
