import 'package:flutter/material.dart';

class DisplayScore extends StatelessWidget {
  final int score;
  final double borderHeight;
  final double width;

  DisplayScore({
    required this.score,
    required this.borderHeight,
    required this.width
  });

  @override
  Widget build(BuildContext context) {
    final double fontSize = MediaQuery.of(context).size.width * 0.048;
    return SizedBox(
      height: borderHeight,
      width: width,
      child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.all(Radius.circular(15)),
              border: Border.all(
                  width: 1.5,
                  color: Theme.of(context)
                      .colorScheme
                      .secondary)),
          child: Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width /
                      150),
              child: Column(children: [
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: [
                    Text("Points : ",
                        style: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.w500)),
                    Padding(
                        padding: const EdgeInsets.only(
                            left: 5),
                        child: Text(
                          score
                              .toString(),
                          style: TextStyle(
                              fontSize: fontSize * 1.2,
                              fontWeight:
                                  FontWeight.w400),
                        ))
                  ],
                ),
              ]))));
  }

}