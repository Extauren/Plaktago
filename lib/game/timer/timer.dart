import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'timer_button.dart';

// ignore: must_be_immutable
class Timer extends StatefulWidget {
  String time;
  int timer;
  Timer({Key? key, this.time = "", this.timer = 0}) : super(key: key);

  @override
  State<Timer> createState() => _Timer();

  String getTime() {
    return time;
  }
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
    if (widget.time != "") {
      final List<String> time = widget.time.split(':');
      _stopWatchTimer.setPresetHoursTime(int.parse(time[0]));
      _stopWatchTimer.setPresetMinuteTime(int.parse(time[1]));
      _stopWatchTimer.setPresetSecondTime(int.parse(time[2]));
    }
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
    return Column(
      children: <Widget>[
        StreamBuilder<int>(
          stream: _stopWatchTimer.rawTime,
          initialData: _stopWatchTimer.rawTime.value,
          builder: (context, snap) {
            final value = snap.data!;
            widget.timer = value;
            widget.time = StopWatchTimer.getDisplayTime(value,
                hours: _isHours, milliSecond: false);
            return Text(
              widget.time,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
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
                color: Theme.of(context).colorScheme.primary,
                onTap: _stopWatchTimer.onStartTimer,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: RoundedButton(
                icon: Icons.stop,
                color: Theme.of(context).colorScheme.primary,
                onTap: _stopWatchTimer.onStopTimer,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: RoundedButton(
                icon: Icons.restart_alt,
                color: Theme.of(context).colorScheme.primary,
                onTap: _stopWatchTimer.onResetTimer,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
