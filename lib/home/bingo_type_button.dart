import 'dart:math';

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum BingoType {
  plaque("Plaque"),
  kta("KTA"),
  exploration("Explo");

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
    BingoType.exploration
  ];
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedToggleSwitch<int>.size(
          current: min(value, 2),
          style: ToggleStyle(
            backgroundColor: Theme.of(context).colorScheme.surface,
            indicatorColor: Theme.of(context).colorScheme.surface,
            indicatorBorder: Border.all(
                width: 1.0, color: Theme.of(context).colorScheme.primary),
            borderRadius: BorderRadius.circular(15),
            indicatorBorderRadius: BorderRadius.all(Radius.circular(15)),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 1.5),
              ),
            ],
          ),
          values: const [0, 1, 2],
          iconOpacity: 1.0,
          selectedIconScale: 1.0,
          indicatorSize: const Size.fromWidth(100),
          spacing: 7.0,
          customSeparatorBuilder: (context, local, global) {
            final opacity = ((global.position - local.position).abs() - 0.5)
                .clamp(0.0, 1.0);
            return VerticalDivider(
                indent: 10.0,
                endIndent: 10.0,
                color: Theme.of(context)
                    .colorScheme
                    .onSurface
                    .withOpacity(opacity));
          },
          customIconBuilder: (context, local, global) {
            final text = bingoTypeList[local.index].name;
            final icon = [
              ImageIcon(
                  AssetImage(
                    'assets/manhole_cover.png',
                  ),
                  size: 25,
                  color: Color.lerp(
                      Colors.grey[100],
                      Theme.of(context).colorScheme.primary,
                      local.animationValue)),
              Icon(FontAwesomeIcons.dungeon,
                  color: Color.lerp(
                      Colors.grey[100],
                      Theme.of(context).colorScheme.primary,
                      local.animationValue)),
              Icon(FontAwesomeIcons.personWalking,
                  color: Color.lerp(
                      Colors.grey[100],
                      Theme.of(context).colorScheme.primary,
                      local.animationValue))
            ][local.index];
            return Center(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(margin: EdgeInsets.only(right: 8), child: icon),
              Text(text,
                  style: TextStyle(
                      color: Color.lerp(
                          Colors.grey[100],
                          Theme.of(context).colorScheme.primary,
                          local.animationValue)))
            ]));
          },
          borderWidth: 0.0,
          onChanged: (i) {
            setState(() {
              value = i;
              widget.updateBingoType(bingoTypeList[i]);
            });
          }),
    );
  }
}
