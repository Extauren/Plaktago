import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:plaktago/game/board/bingo_card.dart';
import 'package:plaktago/home/bingo_type_button.dart';
import 'package:plaktago/utils/game/game.dart';
import 'package:plaktago/utils/general.dart';

class IsarService extends ChangeNotifier {
  late Future<Isar> db;

  IsarService() {
    db = openDB();
  }

  Future<void> saveGeneral(General general) async {
    final isar = await db;
    isar.writeTxnSync(() => isar.generals.putSync(general));
  }

  Future<General> getGeneral() async {
    final isar = await db;
    late General? general;
    general = await isar.generals.get(0);
    if (general == null) {
      return General();
    }
    return general;
  }

  void updateGeneralStats(final BingoType bingoType, final int points,
      final bool newGame, List<BingoCard> bingoCardList) async {
    General general = await getGeneral();
    if (newGame) {
      general.nbGames += 1;
    }
    if (bingoType == BingoType.plaque) {
      general.bingoPlaque += 1;
    }
    if (bingoType == BingoType.kta) {
      general.bingoKta += 1;
    }
    if (bingoType == BingoType.exploration) {
      general.bingoExplo += 1;
    }
    if (points == 56) {
      general.bingoWin += 1;
    }
    for (int i = 0; i < bingoCardList.length; i++) {
      final int index = general.cardList
          .indexWhere((element) => element.cardName == bingoCardList[i].name);
      general.cardList[index].nbPlayed += 1;
      if (bingoCardList[i].isSelect) {
        general.cardList[index].nbCheck += 1;
      }
    }
    saveGeneral(general);
  }

  Future<void> saveGame(Game game) async {
    final isar = await db;
    final General? general = await isar.generals.get(0);
    if (general == null) {
      game.gameNumber = 1;
    } else {
      game.gameNumber = general.nbGames + 1;
    }
    isar.writeTxnSync(() => isar.games.putSync(game));
    if (game.id != -1) {
      isar.writeTxnSync(() => isar.games.deleteSync(-1));
      updateGeneralStats(game.bingoType, game.points, true, game.bingoCardList);
    }
  }

  Future<Game?> getOnGoingGame() async {
    final isar = await db;
    return isar.games.get(-1);
  }

  Future<List<Game>> getAllGames() async {
    final isar = await db;
    List<Game> games = await isar.games.where().findAll();
    return games.where((element) => element.id != -1).toList();
  }

  Stream<List<Game>> listenToGame() async* {
    final isar = await db;
    yield* isar.games.where().watch(fireImmediately: true);
  }

  Future<void> deleteAllData() async {
    final isar = await db;
    await isar.writeTxn(() => isar.clear());
  }

  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();

    if (Isar.instanceNames.isEmpty) {
      return await Isar.open([GeneralSchema, GameSchema],
          directory: dir.path, inspector: true);
    }
    return Future.value(Isar.getInstance());
  }
}
