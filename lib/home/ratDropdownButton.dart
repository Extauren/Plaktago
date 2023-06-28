import 'package:flutter/material.dart';

enum RatType {
  salle('Salle'),
  balade('Balade');

  const RatType(this.name);
  final String name;
}

class RatDropdownButton extends StatefulWidget {
  RatType type;
  final Function update;
  RatDropdownButton({Key? key, required this.type, required this.update})
      : super(key: key);

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
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: DropdownMenu<RatType>(
                      initialSelection: RatType.salle,
                      controller: colorController,
                      dropdownMenuEntries: plaqueEntries,
                      onSelected: (RatType? plaque) {
                        setState(() {
                          widget.type = plaque!;
                          widget.update(widget.type);
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
