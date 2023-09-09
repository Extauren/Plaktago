import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:plaktago/game/board/bingo_card.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:plaktago/game/game_data.dart';
import 'package:plaktago/home/bingo_type_button.dart';
import 'package:plaktago/utils/bingo_params.dart';
import '../game/board/card_name.dart';

class CardList {
  String cardName;
  int nbPlayed;
  int nbCheck;

  CardList({required this.cardName, this.nbPlayed = 0, this.nbCheck = 0});

  Map<String, dynamic> toMap() => {
        'cardName': cardName,
        'nbPlayed': nbPlayed,
        'nbCheck': nbCheck,
      };

  factory CardList.fromMap(Map<String, dynamic> map) => CardList(
        cardName: map['cardName'] as String,
        nbPlayed: map['nbPlayed'] as int,
        nbCheck: map['nbCheck'] as int,
      );

  String toJson() => json.encode(toMap());

  factory CardList.fromJson(String source) {
    return CardList.fromMap(json.decode(source) as Map<String, dynamic>);
  }
}

class SaveGame {
  List<CardList> initilizeCardList() {
    List<CardList> cardList = [];

    for (int i = 0; i < cardNameListPlaque.length; i++) {
      cardList.add(CardList(cardName: cardNameListPlaque[i].name));
    }
    return cardList;
  }

  List<CardList> getCardList(
      final List<BingoCard> bingoCard, List<CardList> cardList) {
    for (int i = 0; i < bingoCard.length; i++) {
      final int index = cardList
          .indexWhere((element) => element.cardName == bingoCard[i].name);
      cardList[index].nbPlayed += 1;
      if (bingoCard[i].isSelect) {
        cardList[index].nbCheck += 1;
      }
    }

    return cardList;
  }

  Future<Map<String, dynamic>> getJson(
      final List<BingoCard> bingoCardList,
      final int points,
      final BingoParams bingoParams,
      final String time,
      final int gameNumber) async {
    Map<String, dynamic> data = await getLocalData();
    Map<String, dynamic> newGame = {};
    Map<String, dynamic> general = data["general"];
    List gamesList = data["games"];
    List<Map<String, dynamic>> jsonList = [];

    for (int it = 0; it < bingoCardList.length; it++) {
      jsonList.add(bingoCardList.elementAt(it).toMap());
    }
    if (gameNumber == -1) {
      general = changeGeneralStats(
          general, bingoParams.bingoType, points, true, bingoCardList);
      newGame = saveNewGame(general["nbGames"], points,
          bingoParams.bingoType.name, time, jsonList);
      gamesList.add(newGame);
    } else {
      general = changeGeneralStats(
          general, bingoParams.bingoType, points, false, bingoCardList);
      newGame = saveNewGame(
          gameNumber, points, bingoParams.bingoType.name, time, jsonList);
      gamesList[gameNumber - 1] = newGame;
    }
    return {"general": general, "onGoingGame": {}, "games": gamesList};
  }

  void saveOnGoingGame(final GameData gameData) async {
    final File file = await _localFile;
    Map<String, dynamic> data = await getLocalData();
    Map<String, dynamic> game = {};
    List<Map<String, dynamic>> cards = [];

    for (int it = 0; it < gameData.bingoCard.length; it++) {
      cards.add(gameData.bingoCard.elementAt(it).toMap());
    }
    game = saveNewGame(-1, gameData.points, gameData.bingoParams.bingoType.name,
        gameData.timer.getTime(), cards);
    data["onGoingGame"] = game;
    file.writeAsString(json.encode(data));
  }

  Future<Map<String, dynamic>> getOnGoingGame() async {
    final Map<String, dynamic> data = await getLocalData();

    return data["onGoingGame"];
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
      "general": {
        "nbGames": 0,
        "bingoPlaque": 0,
        "bingoKta": 0,
        "bingoWin": 0,
        "bingoExplo": 0,
        "cardList": initilizeCardList()
      },
      "onGoingGame": {},
      "games": []
    }));
  }

  Map<String, dynamic> saveNewGame(
      int nbGames,
      final int points,
      final String bingoType,
      final String time,
      List<Map<String, dynamic>> bingoCards) {
    initializeDateFormatting();
    return {
      "gameNumber": nbGames,
      "points": points,
      "gameType": bingoType,
      "date": DateFormat("dd MMMM yyyy", 'fr').format(DateTime.now()),
      "hour": DateFormat("HH:mm").format(DateTime.now()),
      "time": time,
      "bingoCardList": bingoCards,
    };
  }

  Map<String, dynamic> changeGeneralStats(
      Map<String, dynamic> generalStat,
      final BingoType bingoType,
      final int points,
      final bool newGame,
      List<BingoCard> bingoCardList) {
    List<CardList> cardList = [];

    if (newGame) {
      generalStat["nbGames"] += 1;

      if (bingoType == BingoType.plaque) {
        generalStat["bingoPlaque"] += 1;
      }
      if (bingoType == BingoType.kta) {
        generalStat["bingoKta"] += 1;
      }
      if (bingoType == BingoType.exploration) {
        generalStat["bingoExplo"] += 1;
      }
    }
    if (points == 56) {
      generalStat["bingoWin"] += 1;
    }
    List tmp = generalStat["cardList"];
    for (int it = 0; it < tmp.length; it++) {
      cardList.add(CardList.fromJson(tmp.elementAt(it)));
    }
    generalStat["cardList"] = getCardList(bingoCardList, cardList);
    return generalStat;
  }

  Future<Map<String, dynamic>> getLocalData() async {
    Map<String, dynamic> data = {};
    final String localData = await readGames();

    data = jsonDecode(localData);
    if (data == {}) {
      data = {
        "general": {
          "nbGames": 0,
          "bingoPlaque": 0,
          "bingoKta": 0,
          "bingoWin": 0,
          "cardList": initilizeCardList()
        },
        "onGoingGame": {},
        "games": []
      };
    }
    return data;
  }

  void deleteGame(final int gameNumber) async {
    final file = await _localFile;
    Map<String, dynamic> data = await getLocalData();
    List gameList = data["games"];
    final int index =
        gameList.indexWhere((element) => element["gameNumber"] == gameNumber);
    final List bingoCardJson = gameList.elementAt(index)["bingoCardList"];
    final List<BingoCard> bingoCard =
        bingoCardJson.map((e) => BingoCard.fromMap(e)).toList();
    final List cardListJson = data["general"]["cardList"];
    List<CardList> cardList =
        cardListJson.map((e) => CardList.fromJson(e)).toList();

    if (gameList.elementAt(index)["gameType"] == "Plaque") {
      data["general"]["bingoPlaque"] -= 1;
    }
    if (gameList.elementAt(index)["gameType"] == "KTA") {
      data["general"]["bingoKta"] -= 1;
    }
    if (gameList.elementAt(index)["gameType"] == "Exploration") {
      data["general"]["bingoExplo"] -= 1;
    }
    if (gameList.elementAt(index)["points"] == 56) {
      data["general"]["bingoWin"] -= 1;
    }
    for (int it = 0; it < bingoCard.length; it++) {
      final int inde = cardList
          .indexWhere((element) => element.cardName == bingoCard[it].name);
      cardList[inde].nbPlayed -= 1;
      if (bingoCard.elementAt(it).isSelect == true) {
        cardList[inde].nbCheck -= 1;
      }
    }
    data["general"]["cardList"] = cardList.map((e) => e.toJson()).toList();
    gameList.removeAt(index);
    for (int it = index; it < gameList.length; it++) {
      gameList.elementAt(it)["gameNumber"] -= 1;
    }
    data["games"] = gameList;
    data["general"]["nbGames"] -= 1;
    file.writeAsString(json.encode(data));
  }

  void writeGame1(final GameData gameData) async {
    final file = await _localFile;
    final Map<String, dynamic> data = {};

    file.writeAsString(json.encode(data));
  }

  Future<File> writeGame(
      final List<BingoCard> bingoCardList,
      final int points,
      final BingoParams bingoParams,
      final String time,
      final int gameNumber) async {
    final File file = await _localFile;
    final Map<String, dynamic> newJson =
        await getJson(bingoCardList, points, bingoParams, time, gameNumber);
    return file.writeAsString(json.encode(newJson));
  }
}
