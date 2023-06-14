import 'package:flutter/material.dart';
import 'bingo.dart';

class Game extends StatelessWidget {
  const Game({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Expanded(child: Bingo()),
    ]));
  }
}
