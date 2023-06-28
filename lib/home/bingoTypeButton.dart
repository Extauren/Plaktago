import 'package:flutter/material.dart';

enum BingoType {
  plaque("Plaque"),
  sousterrain("Sous terrain");

  const BingoType(this.name);
  final String name;
}

class BingoTypeButton extends StatefulWidget {
  BingoType bingoType;
  final Function updateBingoType;
  final Function updateParentState;
  BingoTypeButton(
      {super.key,
      required this.bingoType,
      required this.updateBingoType,
      required this.updateParentState});

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
            icon: Icon(Icons.adjust_rounded)),
        ButtonSegment<BingoType>(
            value: BingoType.sousterrain,
            label: Text(BingoType.sousterrain.name),
            icon: Icon(Icons.adjust_rounded))
      ],
      selected: <BingoType>{widget.bingoType},
      onSelectionChanged: (Set<BingoType> newSelection) {
        setState(() {
          widget.bingoType = newSelection.first;
          widget.updateBingoType(widget.bingoType);
          widget.updateParentState();
        });
      },
    ));
  }
}
