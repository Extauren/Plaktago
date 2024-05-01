import 'package:flutter/material.dart';
import 'package:plaktago/components/dialog.dart';
import 'package:plaktago/data_class/game.dart';
import 'package:plaktago/utils/isar_service.dart';

class GameAction {
  final IsarService isarService;

  GameAction({required this.isarService});
  
  void saveGame(BuildContext context, final bool newGame, final bool newGameBis, final int id, final Game game) {
    int id = 0;

    if (newGame) {
      if (newGameBis) {
        id = id;
      } else {
        id = game.gameNumber;
      }
      isarService.saveGame(game, id, newGame);
      Navigator.pop(context, true);
      } else {
      isarService.saveGame(game, -1, newGame);
    }
  }

  void askSaveGame(BuildContext context, final bool newGameBis, final int id, final Game game) {
    PDialog(
            context: context,
            title: "Sauvegarder la partie",
            desc: "Voulez vous vraiment sauvegarder cette partie ?",
            bntOkOnPress: () => saveGame(context, true, newGameBis, id, game))
        .show();
  }

  void deleteGame(BuildContext context, Game game) {
    isarService.deleteOnGoingGame();
    game.resetGameData();
    Navigator.pop(context, true);
  }

  void askDeleteGame(BuildContext context, Game game) {
    PDialog(
            context: context,
            title: "Supprimer la partie",
            desc: "Voulez vous vraiment supprimer cette partie ?",
            bntOkOnPress: () => deleteGame(context, game))
        .show();
  }
}