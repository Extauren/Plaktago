import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:plaktago/statistic/game_list/game_tile_card.dart';
import 'package:plaktago/utils/isar_service.dart';
import 'package:plaktago/data_class/game.dart';

class GameList extends StatefulWidget {
  final IsarService isarService;
  const GameList({Key? key, required this.isarService}) : super(key: key);

  @override
  State<GameList> createState() => _GameList();
}

class _GameList extends State<GameList> {
  late Isar isar;
  late Future<List<Game>> gameList;
  List<GlobalKey<ExpansionTileCardState>> cardList = [];
  int expandedIndex = -1;

  @override
  void initState() {
    super.initState();
    getGames();
  }

  void getGames() {
    setState(() {
      gameList = widget.isarService.getAllGames();
    });
  }

  void createGlobalKeys(final List<Game?>? gameList) {
    if (gameList != null) {
      for (int it = 0; it < gameList.length; it++) {
        cardList.add(GlobalKey());
      }
    }
  }

  void updateState(final int index, final bool status) {
    setState(() {
      if (status) {
        if (expandedIndex != -1) {
          cardList[expandedIndex].currentState?.collapse();
        }
        cardList[index].currentState?.expand();
        expandedIndex = index;
      } else {
        cardList[index].currentState?.collapse();
        expandedIndex = -1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Game?>>(
        future: gameList,
        builder: (BuildContext context, AsyncSnapshot<List<Game?>> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            createGlobalKeys(snapshot.data);
            snapshot.data?.sort(
              (a, b) => b!.gameNumber.compareTo(a!.gameNumber),
            );
            int screenHeight = 140 * snapshot.data!.length;
            children = <Widget>[
              if (snapshot.data!.isNotEmpty)
                SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: ListView(children: [
                      Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          height: screenHeight.toDouble(),
                          child: ListView.builder(
                              controller:
                                  ScrollController(keepScrollOffset: false),
                              itemCount: snapshot.data?.length,
                              itemBuilder: (context, index) {
                                final Game game = snapshot.data![index]!;
                                return GameTileCard(
                                  game: game,
                                  index: index,
                                  getStat: getGames,
                                  updateState: updateState,
                                  cardKey: cardList[index],
                                  isarService: widget.isarService,
                                  getGames: getGames,
                                );
                              }))
                    ]))
              else
                Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 4),
                    child: Text("Pas de parties enrengistrées",
                        style: TextStyle(fontSize: 20)))
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
            children = const <Widget>[];
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          );
        });
  }
}
