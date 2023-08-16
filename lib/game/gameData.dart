import 'package:flutter/material.dart';
import 'package:plaktago/game/board/bingoCard.dart';
import 'package:plaktago/game/timer/timer.dart';
import 'package:plaktago/utils/bingoParams.dart';
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

  BingoParams get bingoParams => _bingoParams;

  List<BingoCard> get bingoCard => _bingoCards;

  List<PersonalizeCard> get personalizeCard => _personalizeCards;

  int get points => _points;

  bool get isPlaying => _isPlaying;

  Timer get timer => _timer;

  int get gameNumber => _gameNumber;

  int get nbLines => _nbLines;

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

  void changePoints(int newPoint) {
    _points += newPoint;
  }
}
