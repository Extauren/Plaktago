import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget getCardIcon(final card, final EdgeInsets padding, final BuildContext context, [final Color? color]) {
  if (card.icon != null) {
    return Padding(
      padding: padding,
      child: Icon(
        IconDataSolid(int.parse(card.icon)),
        size: MediaQuery.of(context).size.width / 25,
        color: color ?? Colors.black
      )
    );
  }
  return SizedBox();
}
