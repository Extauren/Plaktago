import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plaktago/home/bingo_type_button.dart';

Widget getIcon(final BingoType bingoType) {
  late Widget icon;
  if (bingoType == BingoType.kta) {
    icon = Icon(FontAwesomeIcons.dungeon, color: Colors.white);
  }
  if (bingoType == BingoType.exploration) {
    icon = Icon(FontAwesomeIcons.personWalking, color: Colors.white);
  }
  if (bingoType == BingoType.plaque) {
    icon = ImageIcon(
        AssetImage(
          'assets/manhole_cover.png',
        ),
        size: 27,
        color: Colors.white);
  }
  return Container(margin: EdgeInsets.only(right: 15), child: icon);
}
