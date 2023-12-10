import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget getCardIcon(final card, [final Color? color]) {
  if (card.icon != null) {
    return Padding(
        padding: EdgeInsets.only(right: 10),
        child: Icon(IconDataSolid(int.parse(card.icon!)),
            size: 17, color: color ?? Colors.black));
  }
  return SizedBox();
}
