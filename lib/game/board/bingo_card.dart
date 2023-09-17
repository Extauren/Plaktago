import 'dart:convert';
import 'package:isar/isar.dart';

part 'bingo_card.g.dart';

@embedded
class BingoCard {
  final String name;
  bool isSelect;
  int nbLineComplete;
  int order;
  final String alcoolRule;
  final int nbShot;

  BingoCard(
      {this.name = "",
      this.isSelect = false,
      this.nbLineComplete = 0,
      this.order = -1,
      this.alcoolRule = "",
      this.nbShot = 0});

  // Map<String, dynamic> toMap() => {
  //       'name': name,
  //       'isSelect': isSelect,
  //       'nbLineComplete': nbLineComplete,
  //       'order': order,
  //     };

  // factory BingoCard.fromMap(Map<String, dynamic> map) => BingoCard(
  //     name: map['name'] as String,
  //     isSelect: map['isSelect'] as bool,
  //     nbLineComplete: map['nbLineComplete'] as int,
  //     order: map['order'] as int,
  //     alcoolRule: map["alcoolRule"] as String,
  //     nbShot: map["nbShot"] as int);

  //String toJson() => json.encode(toMap());

  // factory BingoCard.fromJson(String source) {
  //   return BingoCard.fromMap(json.decode(source) as Map<String, dynamic>);
  //}
}
