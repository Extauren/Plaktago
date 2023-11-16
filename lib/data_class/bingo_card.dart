import 'package:isar/isar.dart';

part 'bingo_card.g.dart';

@embedded
class BingoCard {
  final String name;
  final String? icon;
  bool isSelect;
  int nbLineComplete;
  int order;
  final String alcoolRule;
  final int nbShot;

  BingoCard(
      {this.name = "",
      this.icon,
      this.isSelect = false,
      this.nbLineComplete = 0,
      this.order = -1,
      this.alcoolRule = "",
      this.nbShot = 0});
}
