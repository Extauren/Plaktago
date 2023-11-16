import 'package:flutter/material.dart';

class PSeparator extends StatelessWidget {
  const PSeparator({Key? key, required this.text, required this.barWidth});

  final String text;
  final double barWidth;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
          margin: EdgeInsets.only(left: 10),
          width: barWidth,
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(
                      color: Theme.of(context).colorScheme.secondary,
                      width: 1.5))),
          child: Container()),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(text, style: TextStyle(fontSize: 22))),
      Container(
          margin: EdgeInsets.only(right: 10),
          width: barWidth,
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(
                      color: Theme.of(context).colorScheme.secondary,
                      width: 1.5))),
          child: Container()),
    ]);
  }
}
