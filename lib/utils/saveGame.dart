import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:plaktago/game/board/bingoCard.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:plaktago/game/gameData.dart';
import 'package:plaktago/home/bingoTypeButton.dart';
import 'package:plaktago/utils/bingoParams.dart';
import '../game/board/cardName.dart';

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
      final String time) async {
    Map<String, dynamic> data = await getLocalData();
    Map<String, dynamic> newGame = {};
    Map<String, dynamic> general = data["general"];
    List gamesList = data["games"];
    List<Map<String, dynamic>> jsonList = [];

    for (int it = 0; it < bingoCardList.length; it++) {
      jsonList.add(bingoCardList.elementAt(it).toMap());
    }
    general = changeGeneralStats(
        general, bingoParams.bingoType, points, true, bingoCardList);
    newGame = saveNewGame(
        general["nbGames"], points, bingoParams.bingoType.name, time, jsonList);
    gamesList.add(newGame);
    return {"general": general, "games": gamesList};
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
        "bingoRat": 0,
        "bingoWin": 0,
        "cardList": initilizeCardList()
      },
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
      if (bingoType == BingoType.sousterrain) {
        generalStat["bingoRat"] += 1;
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
          "bingoRat": 0,
          "bingoWin": 0,
          "cardList": initilizeCardList()
        },
        "games": []
      };
    }
    return data;
  }

  void writeGame1(final GameData gameData) async {
    final file = await _localFile;
    final Map<String, dynamic> data = {};

    file.writeAsString(json.encode(data));
  }

  Future<File> writeGame(final List<BingoCard> bingoCardList, final int points,
      final BingoParams bingoParams, final String time) async {
    final File file = await _localFile;
    final Map<String, dynamic> newJson =
        await getJson(bingoCardList, points, bingoParams, time);
    return file.writeAsString(json.encode(newJson));
  }
}
