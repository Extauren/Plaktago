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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Text("Type de plaque :")),
                    Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(129, 153, 219, 1),
                          borderRadius: BorderRadius.circular(3)),
                      child: DropdownMenu<PlaqueType>(
                        initialSelection: PlaqueType.triangle,
                        controller: colorController,
                        dropdownMenuEntries: plaqueEntries,
                        onSelected: (PlaqueType? plaque) {
                          setState(() {
                            widget.selectecPlaque = plaque!;
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
