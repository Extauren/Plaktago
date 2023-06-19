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
  IconLabel? selectedIcon;

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuEntry<DifficultyLabel>> colorEntries =
        <DropdownMenuEntry<DifficultyLabel>>[];
    for (final DifficultyLabel color in DifficultyLabel.values) {
      colorEntries.add(
        DropdownMenuEntry<DifficultyLabel>(
            value: color, label: color.label, enabled: color.label != 'Grey'),
      );
    }

    final List<DropdownMenuEntry<IconLabel>> iconEntries =
        <DropdownMenuEntry<IconLabel>>[];
    for (final IconLabel icon in IconLabel.values) {
      iconEntries
          .add(DropdownMenuEntry<IconLabel>(value: icon, label: icon.label));
    }

    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        //colorSchemeSeed: Colors.green,
      ),
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0),
                  // child: Center(
                  //     child:
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Difficulté :"),
                      DropdownMenu<DifficultyLabel>(
                        initialSelection: DifficultyLabel.green,
                        controller: colorController,
                        //label: const Text('Color'),
                        dropdownMenuEntries: colorEntries,
                        onSelected: (DifficultyLabel? color) {
                          setState(() {
                            selectedColor = color;
                          });
                        },
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

enum DifficultyLabel {
  blue('Facile', Colors.blue),
  pink('Moyen', Colors.pink),
  green('Difficile', Colors.green),
  yellow('Soleil', Colors.yellow),
  grey('Carré', Colors.grey);

  const DifficultyLabel(this.label, this.color);
  final String label;
  final Color color;
}

enum IconLabel {
  smile('Smile', Icons.sentiment_satisfied_outlined),
  cloud(
    'Cloud',
    Icons.cloud_outlined,
  ),
  brush('Brush', Icons.brush_outlined),
  heart('Heart', Icons.favorite);

  const IconLabel(this.label, this.icon);
  final String label;
  final IconData icon;
}
