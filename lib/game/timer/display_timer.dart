import 'package:flutter/material.dart';
import 'package:plaktago/game/timer/timer.dart';


class DisplayTimer extends StatelessWidget {
  final double borderHeight;
  final double width;
  final BingoTimer timer;

  DisplayTimer({
    required this.borderHeight,
    required this.timer, 
    required this.width
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: borderHeight,
      child: Container(
        padding: EdgeInsets.only(
            top:
                MediaQuery.of(context).size.width / 50),
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.all(Radius.circular(15)),
            border: Border.all(
                width: 1.5,
                color: Theme.of(context)
                    .colorScheme
                    .secondary)),
        child: timer,
      ));
  }
}