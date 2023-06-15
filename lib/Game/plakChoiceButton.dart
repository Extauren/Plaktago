import 'package:flutter/material.dart';

class DropdownMenuExample extends StatefulWidget {
  const DropdownMenuExample({super.key});

  @override
  State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
}

class _DropdownMenuExampleState extends State<DropdownMenuExample> {
  final TextEditingController colorController = TextEditingController();
  final TextEditingController iconController = TextEditingController();
  PlaqueLabel? selectedColor;
  IconLabel? selectedIcon;

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuEntry<PlaqueLabel>> colorEntries =
        <DropdownMenuEntry<PlaqueLabel>>[];
    for (final PlaqueLabel color in PlaqueLabel.values) {
      colorEntries.add(
        DropdownMenuEntry<PlaqueLabel>(
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
        colorSchemeSeed: Colors.green,
      ),
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Type de plaque :"),
                    DropdownMenu<PlaqueLabel>(
                      initialSelection: PlaqueLabel.green,
                      controller: colorController,
                      //label: const Text('Color'),
                      dropdownMenuEntries: colorEntries,
                      onSelected: (PlaqueLabel? color) {
                        setState(() {
                          selectedColor = color;
                        });
                      },
                    ),
                  ],
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum PlaqueLabel {
  blue('Triangle', Colors.blue),
  pink('Ronde', Colors.pink),
  green('Tortue', Colors.green),
  yellow('Soleil', Colors.yellow),
  grey('Carré', Colors.grey);

  const PlaqueLabel(this.label, this.color);
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
