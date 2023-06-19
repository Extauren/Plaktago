import 'package:flutter/material.dart';

enum PlaqueType {
  triangle('Triangle'),
  ronde('Ronde'),
  tortue('Tortue'),
  soleil('Soleil'),
  carrer('Carré');

  const PlaqueType(this.name);
  final String name;
}

class PlaqueTypeButton extends StatefulWidget {
  PlaqueType selectecPlaque;
  PlaqueTypeButton({Key? key, required this.selectecPlaque}) : super(key: key);

  @override
  State<PlaqueTypeButton> createState() => _PlaqueTypeButtonState();
}

class _PlaqueTypeButtonState extends State<PlaqueTypeButton> {
  final TextEditingController colorController = TextEditingController();
  final TextEditingController iconController = TextEditingController();
  //PlaqueType? selectecPlaque;

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuEntry<PlaqueType>> plaqueEntries =
        <DropdownMenuEntry<PlaqueType>>[];
    for (final PlaqueType plaque in PlaqueType.values) {
      plaqueEntries.add(
        DropdownMenuEntry<PlaqueType>(value: plaque, label: plaque.name),
      );
    }

    // final List<DropdownMenuEntry<IconLabel>> iconEntries =
    //     <DropdownMenuEntry<IconLabel>>[];
    // for (final IconLabel icon in IconLabel.values) {
    //   iconEntries
    //       .add(DropdownMenuEntry<IconLabel>(value: icon, label: icon.label));
    // }

    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.orange,
      ),
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0),
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Type de plaque :"),
                    DropdownMenu<PlaqueType>(
                      initialSelection: PlaqueType.triangle,
                      controller: colorController,
                      //label: const Text('Color'),
                      dropdownMenuEntries: plaqueEntries,
                      onSelected: (PlaqueType? plaque) {
                        setState(() {
                          widget.selectecPlaque = plaque!;
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
