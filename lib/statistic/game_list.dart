import 'package:flutter/material.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';

import 'gameStats.dart';

class GameList extends StatefulWidget {
  final String points;
  final String gameType;
  final String date;
  final String hour;
  final String time;
  final String gameNumber;
  final int index;
  final Map<String, dynamic> board;
  const GameList(
      {Key? key,
      required this.points,
      required this.gameType,
      required this.date,
      required this.hour,
      required this.time,
      required this.gameNumber,
      required this.index,
      required this.board})
      : super(key: key);

  @override
  State<GameList> createState() => _GameList();
}

class _GameList extends State<GameList> {
  bool isExpanded = false;

  void goToGameStats() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => GameStats(
                  bingoStat: widget.board,
                )));
  }

  Icon getTraillingIcon() {
    if (isExpanded) {
      return Icon(
        Icons.keyboard_arrow_up,
        color: Colors.black,
      );
    }
    return Icon(
      Icons.keyboard_arrow_down,
      color: Colors.black,
    );
  }

  Color getCardColor(final String points) {
    if (points == "16") {
      return Colors.amber[300]!;
    }
    return Colors.indigo[200]!;
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTileCard(
      onExpansionChanged: (status) => {
        setState(() {
          isExpanded = status;
        })
      },
      title: DefaultTextStyle(
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(widget.gameNumber),
            Text(widget.gameType),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text(widget.date)])
          ])),
      trailing: getTraillingIcon(),
      baseColor:
          getCardColor(widget.points), //Theme.of(context).colorScheme.primary,
      expandedColor: getCardColor(widget.points),
      expandedTextColor: Colors.black,
      initialPadding: EdgeInsets.only(bottom: 10, left: 20, right: 20),
      finalPadding: EdgeInsets.only(bottom: 10, left: 20, right: 20),
      children: [
        DefaultTextStyle(
            style: TextStyle(fontSize: 16, color: Colors.black),
            child: Column(children: [
              Text("Points : ${widget.points}"),
              SizedBox(height: 5),
              Text("Heure : ${widget.hour}"),
              SizedBox(height: 5),
              Text("Durée : ${widget.time}"),
            ])),
        Container(
            //minWidth: 150.0,
            height: 30.0,
            margin: EdgeInsets.symmetric(vertical: 10),
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      Theme.of(context).colorScheme.secondary),
                ),
                //    fixedSize: MaterialStatePropertyAll(Size(150, 0))),
                onPressed: goToGameStats,
                child: Text(
                    style: TextStyle(fontSize: 12, color: Colors.black),
                    "Revoir la partie")))
      ],
    );
  }
}
