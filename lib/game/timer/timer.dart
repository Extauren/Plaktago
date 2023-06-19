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
        margin: const EdgeInsets.only(left: 40, top: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
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
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: RoundedButton(
                    icon: Icons.play_arrow,
                    color: Colors.orange,
                    onTap: _stopWatchTimer.onStartTimer,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: RoundedButton(
                    icon: Icons.stop,
                    color: Colors.orange,
                    onTap: _stopWatchTimer.onStopTimer,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: RoundedButton(
                    icon: Icons.restart_alt,
                    color: Colors.orange,
                    onTap: _stopWatchTimer.onResetTimer,
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
