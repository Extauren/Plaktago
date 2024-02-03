import 'package:isar/isar.dart';

part 'app_settings.g.dart';

@collection
class AppSettings {
  final Id id = 0;
  bool darkMode;
  int? patch = 0;
  String version = "";
  bool displayTimer;

  AppSettings({this.darkMode = true, this.displayTimer = true});
}
