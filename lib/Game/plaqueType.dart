import 'package:flutter/material.dart';

class PlaqueType extends StatefulWidget {
  const PlaqueType({Key? key}) : super(key: key);

  @override
  State<PlaqueType> createState() => _PlaqueType();
}

enum PlaqueTypeList { triangle, ronde, tortue, soleil, carrer }

class _PlaqueType extends State<PlaqueType> {
  _PlaqueType();
  PlaqueTypeList? _plaque = PlaqueTypeList.triangle;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 200),
        child: Row(children: [
          Expanded(
              child: ListTile(
            title: const Text('Triangle'),
            leading: Radio<PlaqueTypeList>(
              value: PlaqueTypeList.triangle,
              groupValue: _plaque,
              onChanged: (PlaqueTypeList? value) {
                setState(() {
                  _plaque = value;
                });
              },
            ),
          )),
        ]));
  }
}
