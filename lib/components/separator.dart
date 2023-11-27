import 'package:flutter/material.dart';

class PSeparator extends StatelessWidget {
  const PSeparator({Key? key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final Size txtSize = _textSize(text, TextStyle(fontSize: 22));
    final double barWidth =
        MediaQuery.of(context).size.width / 2 - txtSize.width / 2 - 40;
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
          width: barWidth,
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                      width: 1.5))),
          child: Container()),
      Container(
          width: txtSize.width * 1.1,
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Center(child: Text(text, style: TextStyle(fontSize: 22)))),
      Container(
          width: barWidth,
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                      width: 1.5))),
          child: Container()),
    ]);
  }
}

Size _textSize(String text, TextStyle style) {
  final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr)
    ..layout(minWidth: 0, maxWidth: double.infinity);
  return textPainter.size;
}
