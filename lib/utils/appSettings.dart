import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';

class AppSettings {
  bool darkMode;

  AppSettings({this.darkMode = false});

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/appSettings.json');
  }

  Future<String> readFile() async {
    try {
      final file = await _localFile;
      final contents = await file.readAsString();

      return contents;
    } catch (e) {
      return "{}";
    }
  }

  Future<bool> getSeetingsFromFile() async {
    Map<String, dynamic> data = {};
    final contents = await readFile();
    try {
      data = jsonDecode(contents);
    } catch (e) {
      data = {"darkMode": false};
    }
    darkMode = data["darkMode"];
    return true;
  }

  void saveAppSettings() async {
    Map<String, dynamic> appSettings = {"darkMode": darkMode};
    final file = await _localFile;
    file.writeAsString(json.encode(appSettings));
  }
}
