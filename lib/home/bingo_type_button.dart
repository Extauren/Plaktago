import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:plaktago/utils/get_icon.dart';

enum BingoType {
  plaque("Plaque"),
  kta("KTA"),
  exploration("Explo"),
  chantier("Chantier");

  const BingoType(this.name);
  final String name;
}

class BingoTypeButton extends StatefulWidget {
  final BingoType bingoType;
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
  final List<BingoType> bingoTypeList = [
    BingoType.plaque,
    BingoType.kta,
    BingoType.exploration,
    BingoType.chantier,
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child:
      Column(children: [
      GroupButton<BingoType>(
        onSelected: (string, index, isSelected) => {widget.updateBingoType(bingoTypeList[index])},
        buttons: bingoTypeList,
        buttonBuilder: (selected, type, context) {
          return SizedBox(
            height: 60,
            width: 120,
            child: Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: selected ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.surface,
                ),
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: Theme.of(context).colorScheme.surface,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  getIcon(
                    type,
                    selected ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.onSurface,
                  ),
                  SizedBox(width: 10),
                  Text(
                    type.name,
                    style: TextStyle(color: selected ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.onSurface),  
                  )
                ])));
        },
        maxSelected: 1,
        options: GroupButtonOptions(
          spacing: 0,
          runSpacing: 0,
        ),
      ),
  ])
    );
  }
}
