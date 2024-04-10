import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plaktago/home/bingo_type_button.dart';

Widget getIcon(final BingoType bingoType, [final Color? color]) {
  late IconData icon;

  if (bingoType == BingoType.plaque) {
    return ImageIcon(
        AssetImage(
          'assets/manhole_cover.png',
        ),
        size: 27,
        color: color ?? Colors.white);
  }
  if (bingoType == BingoType.kta) {
    icon = FontAwesomeIcons.dungeon;
  }
  if (bingoType == BingoType.exploration) {
    icon = FontAwesomeIcons.personWalking;
  }
  if (bingoType == BingoType.chantier) {
    icon = FontAwesomeIcons.personDigging;
  }
  return Icon(icon, color: color ?? Colors.white);
}