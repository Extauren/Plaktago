import 'package:flutter/material.dart';
import 'navigation_bar.dart';

void main() {
  runApp(const Plaktago());
}

class Plaktago extends StatefulWidget {
  const Plaktago({Key? key});

  @override
  State<Plaktago> createState() => _Plaktago();
}

class _Plaktago extends State<Plaktago> {
  ThemeMode _themeMode = ThemeMode.light;

  void changeTheme() {
    setState(() {
      if (_themeMode == ThemeMode.light) {
        _themeMode = ThemeMode.dark;
      } else {
        _themeMode = ThemeMode.light;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Plaktago',
        theme: ThemeData(
            primaryColor: Color.fromRGBO(129, 153, 219, 1),
            secondaryHeaderColor: Color.fromRGBO(129, 153, 219, 1),
            scaffoldBackgroundColor: Colors.grey[100],
            drawerTheme: DrawerThemeData(backgroundColor: Colors.grey[100]),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: Colors.grey[100],
                unselectedItemColor: Colors.black,
                selectedItemColor: Color.fromRGBO(129, 153, 219, 1)),
            appBarTheme: AppBarTheme(
                backgroundColor: Colors.white,
                elevation: 1,
                shadowColor: Colors.grey[50]),
            textTheme: TextTheme(
                bodySmall: TextStyle(fontSize: 12),
                bodyLarge: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
                bodyMedium: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                )),
            dropdownMenuTheme: DropdownMenuThemeData(menuStyle: MenuStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) {
              return Colors.white;
            }))),
            useMaterial3: true),
        darkTheme: ThemeData(
            primaryColor: Colors.grey[800], //Color.fromRGBO(129, 153, 219, 1),
            secondaryHeaderColor: Color.fromRGBO(129, 153, 219, 1),
            scaffoldBackgroundColor: Colors.grey[900],
            appBarTheme: AppBarTheme(backgroundColor: Colors.grey[800]),
            drawerTheme: DrawerThemeData(backgroundColor: Colors.grey[800]),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: Colors.grey[800],
                unselectedItemColor: Colors.white,
                selectedItemColor: Color.fromRGBO(129, 153, 219, 1)),
            textTheme: TextTheme(
                bodySmall: TextStyle(color: Colors.white, fontSize: 12),
                bodyLarge: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.white),
                bodyMedium: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
            dropdownMenuTheme: DropdownMenuThemeData(menuStyle: MenuStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) {
              return Colors.white;
            }))),
            useMaterial3: true),
        themeMode: _themeMode,
        home: NavigationBarApp(changeTheme: changeTheme));
  }
}
