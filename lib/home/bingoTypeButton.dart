import 'package:flutter/material.dart';

enum BingoType {
  plaque("Plaque"),
  sousterrain("Sous terrain");

  const BingoType(this.name);
  final String name;
}

class BingoTypeButton extends StatefulWidget {
  BingoType bingoTypeView;
  final Function updateBingoType;
  BingoTypeButton(
      {super.key, required this.bingoTypeView, required this.updateBingoType});

  @override
  State<BingoTypeButton> createState() => _BingoTypeButton();
}

class _BingoTypeButton extends State<BingoTypeButton> {
  //BingoType bingoTypeView = BingoType.plaque;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SegmentedButton<BingoType>(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {
              return Theme.of(context).primaryColor;
            }
            return Colors.white;
          },
        ),
        // surfaceTintColor:
        //     MaterialStateProperty.all(Theme.of(context).primaryColor),
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
      selected: <BingoType>{widget.bingoTypeView},
      onSelectionChanged: (Set<BingoType> newSelection) {
        setState(() {
          // By default there is only a single segment that can be
          // selected at one time, so its value is always the first
          // item in the selected set.
          widget.bingoTypeView = newSelection.first;
          widget.updateBingoType(newSelection.first);
        });
      },
    ));
  }
}
