import 'package:flutter/material.dart';
import 'package:plaktago/game/board/bingo_card.dart';
import 'package:plaktago/game/timer/timer.dart';
import 'package:plaktago/utils/bingo_params.dart';
import 'package:plaktago/utils/game/game.dart';
import '../home/personalize.dart';

class GameData extends ChangeNotifier {
  BingoParams _bingoParams = BingoParams();
  List<BingoCard> _bingoCards = <BingoCard>[];
  List<PersonalizeCard> _personalizeCards = <PersonalizeCard>[];
  int _points = 0;
  bool _isPlaying = false;
  Timer _timer = Timer();
  int _gameNumber = -1;
  final int _nbLines = 4;
  bool _isAlcool = false;
  int _nbShot = -1;
  String _time = "";

  BingoParams get bingoParams => _bingoParams;

  List<BingoCard> get bingoCard => _bingoCards;

  List<PersonalizeCard> get personalizeCard => _personalizeCards;

  int get points => _points;

  bool get isPlaying => _isPlaying;

  Timer get timer => _timer;

  int get gameNumber => _gameNumber;

  int get nbLines => _nbLines;

  bool get isAlcool => _isAlcool;

  int get nbShot => _nbShot;

  String get time => _time;

  void setIsAlcool() {
    _isAlcool = !_isAlcool;
    if (_isAlcool) {
      _nbShot = 0;
    } else {
      _nbShot = -1;
    }
  }

  void setBingoCards(List<BingoCard> newCards) {
    _bingoCards = newCards;
  }

  void setBingoParams(BingoParams newParams) {
    _bingoParams = newParams;
  }

  void setPersonalizeCards(List<PersonalizeCard> personalizeCards) {
    _personalizeCards = personalizeCards;
  }

  void setPoints(int points) {
    _points = points;
  }

  void setGameNumber(int gameNumber) {
    _gameNumber = gameNumber;
  }

  void setIsPlaying(bool newValue) {
    _isPlaying = newValue;
  }

  void setTimer(Timer timer) {
    _timer = timer;
  }

  void setTime(String time) {
    _time = time;
  }

  void changePoints(int newPoint) {
    _points += newPoint;
  }

  void addShot(final int nbShot) {
    _nbShot += nbShot;
  }

  void removeShot(final int nbShot) {
    _nbShot -= 1;
  }

  void setGameDataFromGame(final Game game) {
    _bingoCards = game.bingoCardList;
    _points = game.points;
    _isPlaying = true;
    _gameNumber = game.gameNumber;
    _isAlcool = game.isAlcool;
    _nbShot = game.nbShot;
    _bingoParams.bingoType = game.bingoType;
  }

  void resetGameData() {
    _bingoParams = BingoParams();
    _bingoCards = <BingoCard>[];
    _personalizeCards = <PersonalizeCard>[];
    _points = 0;
    _isPlaying = false;
    _timer = Timer();
    _gameNumber = -1;
    _isAlcool = false;
    _nbShot = 0;
    _time = "";
  }
}
