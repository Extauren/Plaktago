import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:plaktago/game/board/bingoCard.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class SaveGame {
  //final List<BingoCard> bingoCardList;
  //final int points;

  //const SaveGame(this.bingoCardList, this.points);

  Future<Map<String, dynamic>> getJson(final List<BingoCard> bingoCardList,
      final int points, final String gameType) async {
    List<Map<String, dynamic>> jsonList = [];
    Map<String, dynamic> oldJson = {};
    Map<String, dynamic> newJson = {};

    try {
      final data = await readGames();
      oldJson = jsonDecode(data);
    } catch (e) {
      oldJson = {
        "general": {"nbGames": 0},
        "games": []
      };
    }
    for (int it = 0; it < 12; it++) {
      jsonList.add(bingoCardList.elementAt(it).toMap());
    }
    initializeDateFormatting();
    //print(DateFormat("dd MMMM yyyy", 'fr').format((DateTime.now())));
    Map<String, dynamic> general = oldJson["general"];
    general["nbGames"] += 1;
    newJson = {
      "gameNumber": general["nbGames"],
      "points": points,
      "gameType": gameType,
      "date": DateFormat("dd MMMM yyyy", 'fr').format(DateTime.now()),
      "hour": DateFormat("HH:mm").format(DateTime.now()),
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
      "general": {"nbGames": 0},
      "games": []
    }));
  }

  Future<File> writeGame(final List<BingoCard> bingoCardList, final int points,
      final String gameType) async {
    final file = await _localFile;
    final Map<String, dynamic> jsont =
        await getJson(bingoCardList, points, gameType);

    return file.writeAsString(json.encode(jsont));
  }
}
