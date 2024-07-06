import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:plaktago/components/dialog.dart';
import 'package:plaktago/data_class/game.dart';
import 'package:plaktago/utils/isar_service.dart';

class GameAction {
  final IsarService isarService;

  GameAction({required this.isarService});

  void saveGame(final BuildContext context, Game game) {
      isarService.saveGame(game);
      Navigator.pop(context, true);
  }

  void askSaveGame(BuildContext context, final Game game) {
    PDialog(
      context: context,
      title: "Sauvegarder la partie",
      desc: "Voulez vous vraiment sauvegarder cette partie ?",
      bntOkOnPress: () => saveGame(context, game)
    ).show();
  }

  void deleteGame(BuildContext context, final Id gameId) {
    isarService.deleteOnGoingGame(gameId);
  }

  // void deleteOnGoingGame(BuildContext context, OnGoingGame game) {
  //   isarService.deleteOnGoingGame();
  //   game.resetGameData();
  //   Navigator.pop(context, true);
  // }

  bool askDeleteGame(BuildContext context, final Id gameId) {
    PDialog(
      context: context,
      title: "Supprimer la partie",
      desc: "Voulez vous vraiment supprimer cette partie ?",
      bntOkOnPress: () => deleteGame(context, gameId)
    ).show();
    return true;
  }
}