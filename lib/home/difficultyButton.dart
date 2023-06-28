import 'package:flutter/material.dart';

enum Difficulty {
  easy('Facile', 1),
  medium('Moyen', 2),
  difficult('Difficile', 3);

  const Difficulty(this.name, this.value);
  final String name;
  final int value;
}

class DifficultyButton extends StatefulWidget {
  Difficulty difficulty;
  final Function update;
  DifficultyButton({Key? key, required this.difficulty, required this.update})
      : super(key: key);

  @override
  State<DifficultyButton> createState() => _DifficultyButtonState();
}

class _DifficultyButtonState extends State<DifficultyButton> {
  final TextEditingController colorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuEntry<Difficulty>> difficultyEntries =
        <DropdownMenuEntry<Difficulty>>[];
    for (final Difficulty plaque in Difficulty.values) {
      difficultyEntries.add(
        DropdownMenuEntry<Difficulty>(value: plaque, label: plaque.name),
      );
    }

    return Scaffold(
      body: SafeArea(
          child: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Container(
                  //     margin: EdgeInsets.only(bottom: 10),
                  //     child: Text("Difficultée :")),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownMenu<Difficulty>(
                      initialSelection: widget.difficulty,
                      controller: colorController,
                      dropdownMenuEntries: difficultyEntries,
                      onSelected: (Difficulty? difficulty) {
                        setState(() {
                          widget.difficulty = difficulty!;
                          widget.update(widget.difficulty);
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
