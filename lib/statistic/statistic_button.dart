import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:plaktago/utils/app_settings.dart';

enum StatType {
  general("Général"),
  list("Liste");

  const StatType(this.name);
  final String name;
}

class StatTypeButton extends StatefulWidget {
  final Function updateStatType;
  final AppSettings appSettings;
  StatTypeButton(
      {super.key, required this.updateStatType, required this.appSettings});

  @override
  State<StatTypeButton> createState() => _StatTypeButton();
}

class _StatTypeButton extends State<StatTypeButton> {
  bool positive = false;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Align(
            child: SizedBox(
      child: AnimatedToggleSwitch<bool>.size(
          current: positive,
          values: const [false, true],
          iconOpacity: 0.9,
          indicatorSize: const Size.fromWidth(110),
          customIconBuilder: (context, local, global) => Text(
              local.value ? 'Liste' : 'Général',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.lerp(Theme.of(context).colorScheme.onBackground,
                      Colors.black, local.animationValue))),
          borderWidth: 0.0,
          iconAnimationType: AnimationType.onHover,
          style: ToggleStyle(
            backgroundColor: widget.appSettings.darkMode
                ? Colors.grey[850]
                : Colors.grey[50],
            indicatorColor: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 1.5),
              ),
            ],
          ),
          selectedIconScale: 1.0,
          onChanged: (b) => setState(() {
                positive = b;
                widget.updateStatType();
              })),
    )));
  }
}
