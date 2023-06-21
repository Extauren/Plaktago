import 'package:flutter/material.dart';
import '../utils/saveGame.dart';

class Statistic extends StatefulWidget {
  final SaveGame readGame;
  const Statistic({Key? key, required this.readGame}) : super(key: key);

  @override
  State<Statistic> createState() => _Statistic();
}

class _Statistic extends State<Statistic> {
  static Future<int> _gamesNumber = Future.value(0);

  @override
  void initState() {
    super.initState();
    _getGamesNumber();
  }

  void _getGamesNumber() async {
    _gamesNumber = widget.readGame.readGames();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<int>(
      future: _gamesNumber,
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        List<Widget> children;
        if (snapshot.hasData) {
          children = <Widget>[
            Text('Nombre de parties: ${snapshot.data}',
                style: Theme.of(context).textTheme.bodySmall),
          ];
        } else if (snapshot.hasError) {
          children = <Widget>[
            const Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text('Error: ${snapshot.error}'),
            ),
          ];
        } else {
          children = const <Widget>[
            SizedBox(
              width: 60,
              height: 60,
              child: CircularProgressIndicator(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text('Awaiting result...'),
            ),
          ];
        }
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: children,
          ),
        );
      },
    ));
  }
}
