import 'package:flutter/material.dart';

enum Mode { random, personalize }

class ModeButton extends StatefulWidget {
  Mode modeView;
  ModeButton({super.key, required this.modeView});

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
      selected: <Mode>{widget.modeView},
      onSelectionChanged: (Set<Mode> newSelection) {
        setState(() {
          // By default there is only a single segment that can be
          // selected at one time, so its value is always the first
          // item in the selected set.
          widget.modeView = newSelection.first;
        });
      },
    ));
  }
}
