import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:plaktago/data_class/bingo_card.dart';
import 'package:plaktago/home/bingo_type_button.dart';
import 'package:plaktago/data_class/app_settings.dart';
import 'package:plaktago/data_class/game.dart';
import 'package:plaktago/data_class/general.dart';

class IsarService extends ChangeNotifier {
  late Future<Isar> db;

  IsarService() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();

    if (Isar.instanceNames.isEmpty) {
      return await Isar.open([GeneralSchema, GameSchema, AppSettingsSchema],
          directory: dir.path, inspector: true);
    }
    return Future.value(Isar.getInstance());
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
    return setGeneralNewValues(general);
  }

  General setGeneralNewValues(General general) {
    if (general.nbLines < 0) {
      general.nbLines = 0;
    }
    if (general.nbPoints < 0) {
      general.nbPoints = 0;
    }
    return general;
  }

  void updateGeneralStats(
      final BingoType bingoType,
      final int points,
      final bool newGame,
      List<BingoCard> bingoCardList,
      int saveGame,
      int nbLines) async {
    General general = await getGeneral();
    if (newGame) {
      general.nbGames += saveGame;

      if (bingoType == BingoType.plaque) {
        general.bingoPlaque += saveGame;
      }
      if (bingoType == BingoType.kta) {
        general.bingoKta += saveGame;
      }
      if (bingoType == BingoType.exploration) {
        general.bingoExplo += saveGame;
      }
      general.nbLines += nbLines;
      general.nbPoints += points;
    }
    if (points == 56) {
      general.bingoWin += saveGame;
    }
    if (saveGame == 1) {
      for (int i = 0; i < bingoCardList.length; i++) {
        final int index = general.cardList
            .indexWhere((element) => element.cardName == bingoCardList[i].name);
        general.cardList[index].nbPlayed += 1;
        if (bingoCardList[i].isSelect) {
          general.cardList[index].nbCheck += 1;
        }
      }
    }
    saveGeneral(general);
  }

  Future<void> saveGame(Game game, bool newGame) async {
    final isar = await db;
    final General? general = await isar.generals.get(0);
    final Id lastId = game.id;
    if (newGame) {
      if (general == null) {
        game.gameNumber = 1;
        game.id = 1;
      } else if (game.id == -1) {
        game.gameNumber = general.nbGames + 1;
        game.id = game.gameNumber;
      }
    }
    isar.writeTxnSync(() => isar.games.putSync(game));
    if (game.gameNumber != -1 && lastId == -1) {
      isar.writeTxnSync(() => isar.games.deleteSync(-1));
      if (!game.updateGame) {
        updateGeneralStats(game.bingoType, game.points, newGame,
            game.bingoCards, 1, game.nbLines);
      }
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

  Future<bool> deleteGame(final int id, final BingoType bingoType,
      final int points, final int nbLines) async {
    final isar = await db;
    bool isDelete = isar.writeTxnSync(() => isar.games.deleteSync(id));
    if (isDelete) {
      updateGeneralStats(bingoType, -points, true, [], -1, -nbLines);
    }
    return isDelete;
  }

  Future<bool> deleteOnGoingGame() async {
    final isar = await db;
    bool isDelete = isar.writeTxnSync(() => isar.games.deleteSync(-1));
    return isDelete;
  }

  Future<void> updateGame(Game game) async {
    final isar = await db;
    isar.writeTxnSync(() => isar.games.putSync(game));
  }

  Future<AppSettings> getAppSettings() async {
    final isar = await db;
    AppSettings? appSettings = await isar.appSettings.get(0);

    if (appSettings == null) {
      isar.writeTxnSync(() => isar.appSettings.putSync(AppSettings()));
      return Future.value(AppSettings());
    }
    return appSettings;
  }

  Future<void> saveAppSettings(final AppSettings appSettings) async {
    final isar = await db;
    print(appSettings.secondaryColor);
    isar.writeTxnSync(() => isar.appSettings.putSync(appSettings));
  }
}
