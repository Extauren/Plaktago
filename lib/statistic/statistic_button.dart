import 'package:flutter/material.dart';

enum StatType {
  general("Général"),
  list("Liste");

  const StatType(this.name);
  final String name;
}

class StatTypeButton extends StatefulWidget {
  StatType statType;
  Function updateStatType;
  //final Function updateBingoType;
  //final Function updateParentState;
  StatTypeButton({
    super.key,
    required this.statType,
    required this.updateStatType,
    //required this.updateBingoType,
    //required this.updateParentState
  });

  @override
  State<StatTypeButton> createState() => _StatTypeButton();
}

class _StatTypeButton extends State<StatTypeButton> {
  //StatType statType = StatType.general;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SegmentedButton<StatType>(
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
      segments: <ButtonSegment<StatType>>[
        ButtonSegment<StatType>(
            value: StatType.general,
            label: Text(StatType.general.name),
            icon: Icon(Icons.adjust_rounded)),
        ButtonSegment<StatType>(
            value: StatType.list,
            label: Text(StatType.list.name),
            icon: Icon(Icons.adjust_rounded))
      ],
      selected: <StatType>{widget.statType},
      onSelectionChanged: (Set<StatType> newSelection) {
        setState(() {
          widget.statType = StatType.list;
          // widget.bingoType = newSelection.first;
          widget.updateStatType();
          // widget.updateParentState();
        });
      },
    ));
  }
}
