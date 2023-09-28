import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum BingoType {
  plaque("Plaque"),
  kta("KTA"),
  exploration("Exploration");

  const BingoType(this.name);
  final String name;
}

class BingoTypeButton extends StatefulWidget {
  BingoType bingoType;
  final Function updateBingoType;
  BingoTypeButton({
    super.key,
    required this.bingoType,
    required this.updateBingoType,
  });

  @override
  State<BingoTypeButton> createState() => _BingoTypeButton();
}

class _BingoTypeButton extends State<BingoTypeButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SegmentedButton<BingoType>(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {
              return Theme.of(context).colorScheme.primary;
            }
            return Theme.of(context).colorScheme.surface;
          },
        ),
      ),
      segments: <ButtonSegment<BingoType>>[
        ButtonSegment<BingoType>(
            value: BingoType.plaque,
            label: Text(BingoType.plaque.name),
            // style: TextStyle(fontFamily: 'RobotCondensed')),
            icon: Icon(Icons.aspect_ratio)),
        ButtonSegment<BingoType>(
            value: BingoType.kta,
            label: Text(BingoType.kta.name),
            icon: Icon(FontAwesomeIcons.dungeon)),
        ButtonSegment<BingoType>(
            value: BingoType.exploration,
            label: Text(BingoType.exploration.name),
            icon: Icon(FontAwesomeIcons.personWalking)),
      ],
      selected: <BingoType>{widget.bingoType},
      onSelectionChanged: (Set<BingoType> newSelection) {
        setState(() {
          widget.updateBingoType(newSelection.first);
        });
      },
    ));
  }
}
