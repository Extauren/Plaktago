import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:plaktago/home/modeButton.dart';

class LaunchGame extends StatefulWidget {
  final VoidCallback launchGame;
  final VoidCallback btek;
  final int nbCards;
  final Mode mode;
  const LaunchGame(
      {Key? key,
      required this.launchGame,
      required this.btek,
      required this.nbCards,
      required this.mode})
      : super(key: key);

  @override
  State<LaunchGame> createState() => _LaunchGame();
}

class _LaunchGame extends State<LaunchGame> {
  MaterialStateProperty<Color> getButtonColor() {
    if (widget.nbCards < 16 && widget.mode == Mode.personalize) {
      return MaterialStateProperty.all(Colors.grey);
    }
    return MaterialStateProperty.all(Theme.of(context).colorScheme.primary);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 140),
        child: ExtraLongDetector(
            duration: Duration(seconds: 10),
            onLongPress: widget.btek,
            child: ElevatedButton(
              onPressed: widget.launchGame,
              style: ButtonStyle(backgroundColor: getButtonColor()),
              child: Text(
                'Jouer',
                style: TextStyle(color: Colors.black),
              ),
            )));
  }
}

class ExtraLongDetector extends StatelessWidget {
  final Widget? child;
  final Duration duration;
  final VoidCallback onLongPress;

  const ExtraLongDetector({
    super.key,
    this.child,
    required this.duration,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return RawGestureDetector(
      gestures: <Type, GestureRecognizerFactory>{
        LongPressGestureRecognizer:
            GestureRecognizerFactoryWithHandlers<LongPressGestureRecognizer>(
          () => LongPressGestureRecognizer(duration: duration),
          (instance) => instance.onLongPress = onLongPress,
        ),
      },
      child: child,
    );
  }
}
