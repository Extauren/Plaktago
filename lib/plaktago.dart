import 'package:flutter/material.dart';
import 'package:plaktago/utils/isar_service.dart';
import 'package:plaktago/utils/app_settings.dart';
import 'navigation_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class Plaktago extends StatefulWidget {
  final IsarService isarService;
  const Plaktago({Key? key, required this.isarService});

  @override
  State<Plaktago> createState() => _Plaktago();
}

class _Plaktago extends State<Plaktago> {
  AppSettings appSettings = AppSettings();
  ThemeMode _themeMode = ThemeMode.dark;
  bool display = false;
  final ColorScheme lightColor = ColorScheme(
      brightness: Brightness.light,
      primary: Color.fromRGBO(149, 169, 225, 1),
      onPrimary: Colors.black,
      secondary: Color.fromRGBO(225, 167, 149, 1),
      onSecondary: Colors.black,
      error: Colors.red,
      onError: Colors.red,
      background: Colors.grey[50]!,
      onBackground: Colors.black,
      surface: Colors.white,
      onSurface: Colors.black);
  final ColorScheme darkColor = ColorScheme(
      brightness: Brightness.dark,
      primary: Color.fromRGBO(149, 169, 225, 1),
      onPrimary: Colors.black,
      secondary: Color.fromRGBO(225, 167, 149, 1),
      onSecondary: Colors.black,
      error: Colors.red,
      onError: Colors.red,
      background: Colors.grey[900]!,
      onBackground: Colors.white,
      surface: Colors.grey[900]!,
      onSurface: Colors.white);

  @override
  void initState() {
    getAppSettings();
    super.initState();
  }

  void getAppSettings() async {
    appSettings = await widget.isarService.getAppSettings();
    setState(() {
      if (appSettings.darkMode) {
        _themeMode = ThemeMode.dark;
      } else {
        _themeMode = ThemeMode.light;
      }
      display = true;
    });
  }

  void changeTheme() {
    setState(() {
      appSettings.darkMode = !appSettings.darkMode;
      if (_themeMode == ThemeMode.light) {
        _themeMode = ThemeMode.dark;
      } else {
        _themeMode = ThemeMode.light;
      }
    });
    widget.isarService.saveAppSettings(appSettings);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Plaktago',
        theme: ThemeData(
            fontFamily: 'RobotCondensed',
            colorScheme: lightColor,
            drawerTheme: DrawerThemeData(backgroundColor: Colors.grey[100]),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: Colors.white,
                unselectedItemColor: Colors.black),
            appBarTheme: AppBarTheme(
                backgroundColor: Colors.white,
                elevation: 1,
                shadowColor: Colors.grey[50],
                titleTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.black)),
            textTheme: TextTheme(
                titleLarge: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
                titleMedium: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                )),
            switchTheme: SwitchThemeData(
                trackColor: MaterialStateProperty.resolveWith((states) {
              return lightColor.primary;
            }), thumbColor: MaterialStateProperty.resolveWith((states) {
              return Colors.black;
            }), overlayColor: MaterialStateProperty.resolveWith((states) {
              return lightColor.primary;
            })),
            dropdownMenuTheme: DropdownMenuThemeData(menuStyle: MenuStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) {
              return Colors.white;
            }))),
            cardColor: Colors.grey[400],
            elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) {
              return lightColor.primary;
            }))),
            useMaterial3: true),
        darkTheme: ThemeData(
            fontFamily: GoogleFonts.robotoCondensed().fontFamily,
            colorScheme: darkColor,
            appBarTheme: AppBarTheme(
                backgroundColor: Colors.grey[800],
                iconTheme: IconThemeData(color: Colors.white),
                titleTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.white)),
            drawerTheme: DrawerThemeData(backgroundColor: Colors.grey[800]),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: Colors.grey[800],
                unselectedItemColor: Colors.white,
                selectedItemColor: darkColor.primary),
            textTheme: TextTheme(
                titleLarge: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
                titleMedium: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                )),
            dropdownMenuTheme: DropdownMenuThemeData(menuStyle:
                MenuStyle(backgroundColor: MaterialStateProperty.resolveWith((states) {
              return Colors.grey[800];
            }))),
            cardColor: Colors.grey[100],
            elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states) {
              return lightColor.primary;
            }))),
            useMaterial3: true),
        themeMode: _themeMode,
        home: display ? NavigationBarApp(changeTheme: changeTheme, appSettings: appSettings, isarService: widget.isarService) : CircularProgressIndicator());
  }
}
