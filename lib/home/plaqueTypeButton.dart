import 'package:flutter/material.dart';

enum PlaqueType {
  //placeHolder('Type de plaque'),
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
  final Function updatePlaque;
  PlaqueTypeButton(
      {Key? key, required this.selectecPlaque, required this.updatePlaque})
      : super(key: key);

  @override
  State<PlaqueTypeButton> createState() => _PlaqueTypeButtonState();
}

class _PlaqueTypeButtonState extends State<PlaqueTypeButton> {
  final TextEditingController colorController = TextEditingController();
  //final TextEditingController iconController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuEntry<PlaqueType>> plaqueEntries =
        <DropdownMenuEntry<PlaqueType>>[];
    for (final PlaqueType plaque in PlaqueType.values) {
      plaqueEntries.add(
        DropdownMenuEntry<PlaqueType>(value: plaque, label: plaque.name),
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
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownMenu<PlaqueType>(
                      initialSelection: PlaqueType.triangle,
                      controller: colorController,
                      dropdownMenuEntries: plaqueEntries,
                      onSelected: (PlaqueType? plaque) {
                        setState(() {
                          widget.selectecPlaque = plaque!;
                          widget.updatePlaque(widget.selectecPlaque);
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
