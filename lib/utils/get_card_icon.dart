import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget getCardIcon(final String? cardIcon, final EdgeInsets padding, final BuildContext context, [final Color? color]) {
  if (cardIcon != null) {
    return Padding(
      padding: padding,
      child: Icon(
        IconDataSolid(int.parse(cardIcon)),
        size: MediaQuery.of(context).size.width / 25,
        color: color ?? Colors.black
      )
    );
  }
  return SizedBox();
}
