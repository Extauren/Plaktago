import 'package:flutter/material.dart';
import 'package:plaktago/data_class/app_settings.dart';
import 'package:plaktago/utils/isar_service.dart';
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
      secondary: Color.fromRGBO(224, 194, 148, 1),
      onSecondary: Colors.black,
      error: Colors.red,
      onError: Colors.red,
      background: Colors.grey[50]!,
      onBackground: Colors.black,
      surface: Colors.white,
      onSurface: Colors.black);
  final ColorScheme darkColor = ColorScheme(
      brightness: Brightness.dark,
      primary: Color.fromRGBO(242, 217, 141, 1),
      //Color.fromRGBO(217, 187, 143, 1),
      onPrimary: Colors.black,
      secondary:
          Color.fromRGBO(149, 169, 225, 1), //Color.fromRGBO(224, 194, 148, 1),
      onSecondary: Colors.black,
      error: Colors.red,
      onError: Colors.red,
      background: Color.fromRGBO(25, 28, 37, 1), //Colors.grey[900]!,
      onBackground:
          Color.fromRGBO(25, 28, 37, 1), //Color.fromRGBO(217, 187, 143, 1),
      surface: Color.fromRGBO(44, 50, 66, 1),
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
            fontFamily: GoogleFonts.robotoCondensed().fontFamily,
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
            cardColor: Colors.grey[200],
            elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) {
              return lightColor.primary;
            }))),
            useMaterial3: true),
        darkTheme: ThemeData(
            fontFamily: GoogleFonts.robotoCondensed().fontFamily,
            colorScheme: darkColor,
            appBarTheme: AppBarTheme(
                backgroundColor: Color.fromRGBO(
                    44, 50, 66, 1), //Color.fromRGBO(25, 28, 37, 1), //Color.fromRGBO(17, 26, 51, 1), //Colors.grey[800],
                iconTheme: IconThemeData(color: Colors.white),
                titleTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.white)),
            drawerTheme: DrawerThemeData(backgroundColor: darkColor.background),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: Color.fromRGBO(44, 50, 66,
                    1), //Color.fromRGBO(25, 28, 37, 1), //Color.fromRGBO(17, 26, 51, 1), //Color.fromRGBO(27, 41, 80, 1), //Colors.grey[800],
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
            cardColor: Colors.grey[100],
            elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) {
              return lightColor.primary;
            }))),
            useMaterial3: true),
        themeMode: _themeMode,
        home: display
            ? NavigationBarApp(changeTheme: changeTheme, appSettings: appSettings, isarService: widget.isarService)
            : CircularProgressIndicator());
  }
}
