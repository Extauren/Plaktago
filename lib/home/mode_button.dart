import 'package:flutter/material.dart';

enum Mode { random, personalize }

class ModeButton extends StatefulWidget {
  final Mode mode;
  final Function updateBingoMode;

  ModeButton({
    super.key,
    required this.mode,
    required this.updateBingoMode,
  });

  @override
  State<ModeButton> createState() => _ModeButton();
}

class _ModeButton extends State<ModeButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SegmentedButton<Mode>(
      segments: const <ButtonSegment<Mode>>[
        ButtonSegment<Mode>(
            value: Mode.random,
            label: Text('Aléatoire'),
            icon: Icon(Icons.casino)),
        ButtonSegment<Mode>(
            value: Mode.personalize,
            label: Text('Personalisé'),
            icon: Icon(Icons.settings)),
      ],
      selected: <Mode>{widget.mode},
      showSelectedIcon: false,
      style: ButtonStyle(
          backgroundColor:
              MaterialStatePropertyAll(Theme.of(context).colorScheme.surface),
          foregroundColor: MaterialStateColor.resolveWith((states) {
            return states.contains(MaterialState.selected)
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.onSurface;
          }),
          shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))),
      onSelectionChanged: (Set<Mode> newSelection) {
        setState(() {
          widget.updateBingoMode(newSelection.first);
        });
      },
    ));
  }
}
