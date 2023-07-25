import 'package:flutter/material.dart';
import 'package:plaktago/utils/appSettings.dart';
import 'home/home.dart';
import 'statistic/statistic.dart';
import 'settings.dart';

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
  List<Widget> _widgetOptions() => [
        Home(changeTheme: widget.changeTheme, appSettings: widget.appSettings),
        Statistic(),
        Settings(),
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
