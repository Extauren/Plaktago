import 'package:flutter/material.dart';
import 'package:plaktago/Game/plakChoiceButton.dart';
import 'bingo.dart';

class Game extends StatefulWidget {
  final void Function() onItemTapped;
  const Game({Key? key, required this.onItemTapped}) : super(key: key);

  @override
  State<Game> createState() => _Game();
}

class _Game extends State<Game> {
  _Game();

  void test() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(children: [
      Text("Bingo Kta"),
      OutlinedButton(
          onPressed: widget.onItemTapped, child: const Text('Outlined')),
      Expanded(child: DropdownMenuExample()),
      //Expanded(child: Bingo()),
    ])));
  }
}
