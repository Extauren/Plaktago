import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plaktago/utils/appSettings.dart';
import 'package:provider/provider.dart';
import 'home/home.dart';
import 'statistic/statistic.dart';
import '../utils/bingoParams.dart';
import 'game/gameData.dart';
import 'help.dart';
import 'test.dart';

class NavigationBarApp extends StatefulWidget {
  final Function changeTheme;
  final AppSettings appSettings;
  const NavigationBarApp(
      {Key? key, required this.changeTheme, required this.appSettings})
      : super(key: key);

  @override
  State<NavigationBarApp> createState() => _NavigationBar();
}

class _NavigationBar extends State<NavigationBarApp> {
  int _selectedIndex = 0;
  final PageStorageBucket bucket = PageStorageBucket();
  List<Widget> pages = [];
  final Key homeKey = PageStorageKey('home');
  BingoParams playingGame = BingoParams();

  @override
  void initState() {
    super.initState();
    pages = getPages();
  }

  GoRouter router() {
    return GoRouter(
      initialLocation: '/home',
      routes: [
        GoRoute(
            path: '/home',
            builder: (context, state) =>
                Consumer<GameData>(builder: (context, provider, child) {
                  GameData gameData = context.watch<GameData>();
                  return Home(
                      key: homeKey,
                      changeTheme: widget.changeTheme,
                      appSettings: widget.appSettings,
                      bingoParams: gameData,
                      playingGame: playingGame);
                })),
        GoRoute(
          path: '/statistic',
          builder: (context, state) => const Statistic(),
        ),
      ],
    );
  }

  List<Widget> getPages() {
    return [
      Consumer<GameData>(builder: (context, provider, child) {
        GameData gameData = context.watch<GameData>();
        return Home(
            key: homeKey,
            changeTheme: widget.changeTheme,
            appSettings: widget.appSettings,
            bingoParams: gameData,
            playingGame: playingGame);
      }),
      Statistic(),
      Help()
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<String> test = ["/home", "/statistic"];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GameData>(
        create: (_) => GameData(),
        builder: (context, child) {
          return Scaffold(
            body: pages[
                _selectedIndex], //PageStorage(bucket: bucket, child: pages[_selectedIndex]),
            bottomNavigationBar: BottomNavigationBar(
              //unselectedItemColor: Colors.grey[200],
              type: BottomNavigationBarType.fixed,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.graphic_eq),
                  label: 'Statistiques',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu_book),
                  label: 'Aide',
                ),
              ],
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
            ),
          );
        });
  }
}
