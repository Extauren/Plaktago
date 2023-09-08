import 'dart:io';
import 'package:path_provider/path_provider.dart';

class ReadFile {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> _localFile(final String file) async {
    final path = await _localPath;
    return File('$path/$file');
  }

  Future<String> readStats() async {
    try {
      final file = await _localFile('/gamesSave.json');
      final contents = await file.readAsString();
      return contents;
    } catch (e) {
      return "";
    }
  }
}
