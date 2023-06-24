import 'package:flutter/material.dart';

class DifficultyButton extends StatefulWidget {
  const DifficultyButton({super.key});

  @override
  State<DifficultyButton> createState() => _DifficultyButtonState();
}

class _DifficultyButtonState extends State<DifficultyButton> {
  final TextEditingController colorController = TextEditingController();
  final TextEditingController iconController = TextEditingController();
  DifficultyLabel? selectedColor;
  //IconLabel? selectedIcon;

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuEntry<DifficultyLabel>> difficultyEntry =
        <DropdownMenuEntry<DifficultyLabel>>[];
    for (final DifficultyLabel difficulty in DifficultyLabel.values) {
      difficultyEntry.add(
        DropdownMenuEntry<DifficultyLabel>(
            value: difficulty, label: difficulty.name),
      );
    }

    // final List<DropdownMenuEntry<IconLabel>> iconEntries =
    //     <DropdownMenuEntry<IconLabel>>[];
    // for (final IconLabel icon in IconLabel.values) {
    //   iconEntries
    //       .add(DropdownMenuEntry<IconLabel>(value: icon, label: icon.label));
    // }

    return Scaffold(
      body: SafeArea(
          child: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 0),
                child: Column(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Text("Difficulté :",
                            style: Theme.of(context).textTheme.bodyMedium)),
                    Container(
                      decoration: BoxDecoration(
                          //color: Color.fromRGBO(129, 153, 219, 1),
                          borderRadius: BorderRadius.circular(3)),
                      child: DropdownMenu<DifficultyLabel>(
                        initialSelection: DifficultyLabel.green,
                        controller: colorController,
                        dropdownMenuEntries: difficultyEntry,
                        onSelected: (DifficultyLabel? color) {
                          setState(() {
                            selectedColor = color;
                          });
                        },
                      ),
                    )
                  ],
                )),
          ],
        ),
      )),
    );
  }
}

enum DifficultyLabel {
  blue('Facile'),
  pink('Moyen'),
  green('Difficile');

  const DifficultyLabel(this.name);
  final String name;
}

// enum IconLabel {
//   smile('Smile', Icons.sentiment_satisfied_outlined),
//   cloud(
//     'Cloud',
//     Icons.cloud_outlined,
//   ),
//   brush('Brush', Icons.brush_outlined),
//   heart('Heart', Icons.favorite);

//   const IconLabel(this.label, this.icon);
//   final String label;
//   final IconData icon;
// }
