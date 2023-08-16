import 'package:flutter/material.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:plaktago/game/board/bingoCard.dart';
import 'package:plaktago/game/gameData.dart';
import 'gameStats.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GameList extends StatefulWidget {
  final String points;
  final String gameType;
  final String date;
  final String hour;
  final String time;
  final String gameNumber;
  final int index;
  final Map<String, dynamic> board;
  GameData gameData;
  GameList({
    Key? key,
    required this.points,
    required this.gameType,
    required this.date,
    required this.hour,
    required this.time,
    required this.gameNumber,
    required this.index,
    required this.board,
    required this.gameData,
  }) : super(key: key);

  @override
  State<GameList> createState() => _GameList();
}

class _GameList extends State<GameList> {
  bool isExpanded = false;
  int sizeRatio = 1;

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

  Color getCardColor(final String points, final String gameType) {
    if (points == "56") {
      return Colors.amber[300]!;
    } else if (gameType == "Plaque") {
      return Colors.indigo[200]!;
    }
    return Theme.of(context).colorScheme.secondary;
  }

  void setGame() {
    List<BingoCard> cards = List<BingoCard>.from(
        widget.board["bingoCardList"].map((model) => BingoCard.fromMap(model)));
    widget.gameData.setBingoCards(cards);
    widget.gameData.setIsPlaying(true);
    widget.gameData.setPoints(int.parse(widget.points));
  }

  void comeBackToGame() {
    BuildContext dialogContext;

    if (widget.gameData.isPlaying) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            dialogContext = context;
            return AlertDialog(
                title: Text(
                    "Vous avez déja une partie en cours, êtes vous sur de vouloir la supprimer ?",
                    style: TextStyle(color: Colors.black, fontSize: 18)),
                content:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                      margin: EdgeInsets.only(right: 20),
                      child: ElevatedButton(
                          onPressed: () =>
                              {Navigator.pop(dialogContext), setGame()},
                          child: Text("Oui",
                              style: TextStyle(color: Colors.black)))),
                  Container(
                      margin: EdgeInsets.only(left: 20),
                      child: ElevatedButton(
                          onPressed: () => {Navigator.pop(dialogContext)},
                          child: Text("Non",
                              style: TextStyle(color: Colors.black))))
                ]),
                backgroundColor: Colors.grey[300]);
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width > 700) {
      sizeRatio = 2;
    }
    return Align(
        child: SizedBox(
            width: MediaQuery.of(context).size.width / sizeRatio,
            child: ExpansionTileCard(
              onExpansionChanged: (status) => {
                setState(() {
                  isExpanded = status;
                })
              },
              title: DefaultTextStyle(
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Text(widget.gameNumber),
                          widget.points == "56"
                              ? Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Icon(
                                    FontAwesomeIcons.crown,
                                    color: Colors.yellow,
                                    size: 20.0,
                                  ))
                              : Container(margin: EdgeInsets.only(left: 20)),
                        ]),
                        Text(widget.gameType),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [Text(widget.date)])
                      ])),
              trailing: getTraillingIcon(),
              baseColor: Colors.grey[400],
              expandedTextColor: Colors.black,
              initialPadding: EdgeInsets.only(bottom: 10, left: 20, right: 20),
              finalPadding: EdgeInsets.only(bottom: 10, left: 20, right: 20),
              initialElevation: 2.0,
              elevation: 4.0,
              children: [
                SizedBox(height: 10),
                DefaultTextStyle(
                    style: TextStyle(fontSize: 16, color: Colors.black),
                    child: Column(children: [
                      Text("Points : ${widget.points}"),
                      SizedBox(height: 5),
                      Text("Heure : ${widget.hour}"),
                      SizedBox(height: 5),
                      Text("Durée : ${widget.time}"),
                    ])),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                      height: 30.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.grey[50]!),
                          ),
                          onPressed: goToGameStats,
                          child: Text(
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                              "Revoir la partie"))),
                  Container(
                      height: 30.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.grey[50]!),
                          ),
                          onPressed: comeBackToGame,
                          child: Text(
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                              "Reprendre la partie")))
                ])
              ],
            )));
  }
}
