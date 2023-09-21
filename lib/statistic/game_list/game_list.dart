import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:plaktago/game/game_data.dart';
import 'package:plaktago/statistic/game_list/game_stat.dart';
import 'package:plaktago/utils/isar_service.dart';
import 'package:plaktago/utils/game/game.dart';
import 'package:provider/provider.dart';

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
    gameList = widget.isarService.getAllGames();
    super.initState();
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
            children = <Widget>[
              SingleChildScrollView(
                  child: Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                          controller: ScrollController(keepScrollOffset: false),
                          itemCount: snapshot.data?.length,
                          itemBuilder: (context, index) {
                            final Game game = snapshot.data![index]!;
                            return Consumer<GameData>(
                                builder: (context, provider, child) {
                              GameData gameData = context.watch<GameData>();
                              return GameStat(
                                game: game,
                                index: index,
                                gameData: gameData,
                                getStat: () {},
                                updateState: updateState,
                                cardKey: cardList[index],
                                isarService: widget.isarService,
                              );
                            });
                          })))
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
        });
  }
}
