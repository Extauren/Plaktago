import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class SaveGame {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/games.txt');
  }

  Future<int> readGames() async {
    try {
      final file = await _localFile;
      final contents = await file.readAsString();

      return int.parse(contents);
    } catch (e) {
      return 0;
    }
  }

  Future<File> writeGame() async {
    final file = await _localFile;
    final int gamesNumber = await readGames() + 1;

    return file.writeAsString('$gamesNumber');
  }
}
