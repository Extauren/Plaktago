import 'package:isar/isar.dart';

part 'app_settings.g.dart';

@collection
class AppSettings {
  int id = 0;
  bool darkMode;

  AppSettings({this.darkMode = true});
}
