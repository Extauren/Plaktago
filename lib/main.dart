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
  final ColorScheme lightColor = ColorScheme(
      brightness: Brightness.light,
      primary: Color.fromRGBO(149, 169, 225, 1),
      onPrimary: Colors.black,
      secondary: Colors.black,
      onSecondary: Colors.black,
      error: Colors.red,
      onError: Colors.red,
      background: Colors.grey[100]!,
      onBackground: Colors.black,
      surface: Colors.black,
      onSurface: Colors.black);
  final ColorScheme darkColor = ColorScheme(
      brightness: Brightness.dark,
      primary: Color.fromRGBO(149, 169, 225, 1),
      onPrimary: Colors.white,
      secondary: Colors.white,
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.red,
      background: Colors.grey[900]!,
      onBackground: Colors.white,
      surface: Colors.white,
      onSurface: Colors.white);

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
            colorScheme: lightColor,
            drawerTheme: DrawerThemeData(backgroundColor: Colors.grey[100]),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: Colors.white,
                unselectedItemColor: Colors.black),
            appBarTheme: AppBarTheme(
                backgroundColor: Colors.white,
                elevation: 1,
                shadowColor: Colors.grey[50]),
            // textTheme: TextTheme(
            //     bodySmall: TextStyle(fontSize: 12),
            //     bodyLarge: TextStyle(
            //       fontWeight: FontWeight.bold,
            //       fontSize: 22,
            //     ),
            //     bodyMedium: TextStyle(
            //       fontWeight: FontWeight.bold,
            //       fontSize: 16,
            //     )),
            dropdownMenuTheme: DropdownMenuThemeData(menuStyle: MenuStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) {
              return Colors.white;
            }))),
            cardColor: Colors.blueGrey[200],
            elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) {
              return lightColor.primary;
            }))),
            useMaterial3: true),
        darkTheme: ThemeData(
            colorScheme: darkColor,
            appBarTheme: AppBarTheme(
                backgroundColor: Colors.grey[800],
                titleTextStyle: TextStyle(color: Colors.white, fontSize: 22),
                iconTheme: IconThemeData(color: Colors.white)),
            drawerTheme: DrawerThemeData(backgroundColor: Colors.grey[800]),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: Colors.grey[800],
                unselectedItemColor: Colors.white,
                selectedItemColor: darkColor.primary),
            // textTheme: TextTheme(
            //     bodySmall: TextStyle(color: Colors.white, fontSize: 12),
            //     bodyLarge: TextStyle(
            //         fontWeight: FontWeight.bold,
            //         fontSize: 22,
            //         color: Colors.white),
            //     bodyMedium: TextStyle(
            //         color: Colors.white,
            //         fontWeight: FontWeight.bold,
            //         fontSize: 16)),
            dropdownMenuTheme: DropdownMenuThemeData(menuStyle: MenuStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) {
              return Colors.grey[800];
            }))),
            cardColor: Colors.grey[300],
            elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) {
              return lightColor.primary;
            }))),
            useMaterial3: true),
        themeMode: _themeMode,
        home: NavigationBarApp(changeTheme: changeTheme, theme: _themeMode));
  }
}
