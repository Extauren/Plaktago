import 'package:isar/isar.dart';

part 'app_settings.g.dart';

@collection
class AppSettings {
  final Id id = 0;
  bool darkMode;

  AppSettings({this.darkMode = true});
}
