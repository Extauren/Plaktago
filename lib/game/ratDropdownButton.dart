import 'package:flutter/material.dart';

enum RatType {
  salle('Salle'),
  balade('Balade');

  const RatType(this.name);
  final String name;
}

class RatDropdownButton extends StatefulWidget {
  RatType type;

  RatDropdownButton({Key? key, required this.type}) : super(key: key);

  @override
  State<RatDropdownButton> createState() => _RatDropdownButton();
}

class _RatDropdownButton extends State<RatDropdownButton> {
  final TextEditingController colorController = TextEditingController();
  //final TextEditingController iconController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuEntry<RatType>> plaqueEntries =
        <DropdownMenuEntry<RatType>>[];
    for (final RatType plaque in RatType.values) {
      plaqueEntries.add(
        DropdownMenuEntry<RatType>(value: plaque, label: plaque.name),
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
                        child: Text("Type de soirée :")),
                    Container(
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(3)),
                      child: DropdownMenu<RatType>(
                        initialSelection: RatType.salle,
                        controller: colorController,
                        dropdownMenuEntries: plaqueEntries,
                        onSelected: (RatType? plaque) {
                          setState(() {
                            widget.type = plaque!;
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
