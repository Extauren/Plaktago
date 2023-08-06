import 'package:flutter/material.dart';
import 'package:plaktago/game/timer/timer.dart';
import 'package:plaktago/utils/appSettings.dart';
import 'home/home.dart';
import 'statistic/statistic.dart';
import '../utils/bingoParams.dart';

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
  BingoParams bingoParams = BingoParams();
  bool isPlaying = false;
  final PageStorageBucket bucket = PageStorageBucket();
  List<Widget> pages = [];
  final Key homeKey = PageStorageKey('home');
  Timer timer = Timer(
    timer: 0,
  );

  @override
  void initState() {
    super.initState();
    pages = getPages();
  }

  List<Widget> getPages() {
    return [
      Home(
          key: homeKey,
          changeTheme: widget.changeTheme,
          appSettings: widget.appSettings,
          bingoParams: bingoParams,
          isPlaying: isPlaying,
          timer: timer),
      Statistic(
          //key: PageStorageKey('stats'),
          ),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
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
            label: 'Statistics',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.menu_book),
          //   label: 'Aide',
          // ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
