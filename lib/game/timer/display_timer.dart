import 'package:flutter/material.dart';
import 'package:plaktago/game/timer/timer.dart';


class DisplayTimer extends StatelessWidget {
  final double borderHeight;
  final BingoTimer timer;

  DisplayTimer({required this.borderHeight, required this.timer});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2.5,
      height: borderHeight,
      child: Container(
        padding: EdgeInsets.only(
            top:
                MediaQuery.of(context).size.width / 40),
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