import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'timerButton.dart';

class Timer extends StatefulWidget {
  const Timer({Key? key}) : super(key: key);

  @override
  State<Timer> createState() => _Timer();
}

class _Timer extends State<Timer> {
  final _isHours = true;

  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countUp,
    onStopped: () {},
    onEnded: () {},
  );

  @override
  void initState() {
    super.initState();
    _stopWatchTimer.onStartTimer();
  }

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 40, right: 30),
        child: Column(
          children: <Widget>[
            StreamBuilder<int>(
              stream: _stopWatchTimer.rawTime,
              initialData: _stopWatchTimer.rawTime.value,
              builder: (context, snap) {
                final value = snap.data!;
                final displayTime =
                    StopWatchTimer.getDisplayTime(value, hours: _isHours);
                return Text(
                  displayTime,
                  style: const TextStyle(
                      fontSize: 28, fontWeight: FontWeight.bold),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: RoundedButton(
                    icon: Icons.play_arrow,
                    color: Theme.of(context).secondaryHeaderColor,
                    onTap: _stopWatchTimer.onStartTimer,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: RoundedButton(
                    icon: Icons.stop,
                    color: Theme.of(context).secondaryHeaderColor,
                    onTap: _stopWatchTimer.onStopTimer,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: RoundedButton(
                    icon: Icons.restart_alt,
                    color: Theme.of(context).secondaryHeaderColor,
                    onTap: _stopWatchTimer.onResetTimer,
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
