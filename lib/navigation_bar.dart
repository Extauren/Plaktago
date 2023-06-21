import 'package:flutter/material.dart';
import 'home.dart';
import 'statistic/statistic.dart';
import 'settings.dart';
import 'utils/saveGame.dart';

class NavigationBarApp extends StatefulWidget {
  final Function changeTheme;
  const NavigationBarApp({Key? key, required this.changeTheme})
      : super(key: key);

  @override
  State<NavigationBarApp> createState() => _NavigationBar();
  // Widget build(BuildContext context) {
  //   return const MaterialApp(
  //     home: NavigationBar(),
  //   );
  // }
}

class _NavigationBar extends State<NavigationBarApp> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions() => [
        Home(
          changeTheme: widget.changeTheme,
        ),
        Statistic(readGame: SaveGame()),
        Settings(changeTheme: widget.changeTheme),
      ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetList = _widgetOptions();
    return Scaffold(
      body: widgetList[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
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
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
