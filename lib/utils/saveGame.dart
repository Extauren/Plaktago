import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:plaktago/game/board/bingoCard.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:plaktago/home/bingoTypeButton.dart';
import 'package:plaktago/utils/bingoParams.dart';

class SaveGame {
  Future<Map<String, dynamic>> getJson(
      final List<BingoCard> bingoCardList,
      final int points,
      final BingoParams bingoParams,
      final String time) async {
    List<Map<String, dynamic>> jsonList = [];
    Map<String, dynamic> oldJson = {};
    Map<String, dynamic> newJson = {};
    try {
      final data = await readGames();
      oldJson = jsonDecode(data);
    } catch (e) {
      oldJson = {
        "general": {
          "nbGames": 0,
          "bingoPlaque": 0,
          "bingoRat": 0,
          "bingoWin": 0
        },
        "games": []
      };
    }
    for (int it = 0; it < bingoCardList.length; it++) {
      jsonList.add(bingoCardList.elementAt(it).toMap());
    }
    initializeDateFormatting();
    //print(DateFormat("dd MMMM yyyy", 'fr').format((DateTime.now())));
    Map<String, dynamic> general = oldJson["general"];
    general["nbGames"] += 1;
    if (bingoParams.bingoType == BingoType.plaque) {
      general["bingoPlaque"] += 1;
    }
    if (bingoParams.bingoType == BingoType.sousterrain) {
      general["bingoRat"] += 1;
    }
    if (points == 16) {
      general["bingoWin"] += 1;
    }
    newJson = {
      "gameNumber": general["nbGames"],
      "points": points,
      "gameType": bingoParams.bingoType.name,
      "date": DateFormat("dd MMMM yyyy", 'fr').format(DateTime.now()),
      "hour": DateFormat("HH:mm").format(DateTime.now()),
      "time": time,
      "bingoCardList": jsonList
    };

    var test = oldJson["games"];
    test.add(newJson);
    return {"general": general, "games": test};
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/gamesSave.json');
  }

  Future<String> readGames() async {
    try {
      final file = await _localFile;
      final contents = await file.readAsString();
      return contents;
    } catch (e) {
      return "";
    }
  }

  Future<void> resetFile() async {
    final file = await _localFile;
    file.writeAsString(json.encode({
      "general": {"nbGames": 0, "bingoPlaque": 0, "bingoRat": 0, "bingoWin": 0},
      "games": []
    }));
  }

  Future<File> writeGame(final List<BingoCard> bingoCardList, final int points,
      final BingoParams bingoParams, final String time) async {
    final file = await _localFile;
    final Map<String, dynamic> newJson =
        await getJson(bingoCardList, points, bingoParams, time);

    return file.writeAsString(json.encode(newJson));
  }
}
