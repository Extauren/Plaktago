import 'package:flutter/material.dart';
import 'package:plaktago/data_class/app_settings.dart';
import 'package:plaktago/utils/hex_color.dart';
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
  late AppSettings appSettings;
  bool isActive = false;
  ThemeMode _themeMode = ThemeMode.dark;
  bool display = false;
  ColorScheme darkColor = ColorScheme(
      brightness: Brightness.dark,
      primary: Color.fromRGBO(242, 217, 141, 1),
      onPrimary: Colors.black,
      secondary: Color.fromRGBO(149, 169, 225, 1),
      onSecondary: Colors.black,
      error: Colors.red,
      onError: Colors.red,
      background: Color.fromRGBO(25, 28, 37, 1),
      onBackground: Color.fromRGBO(25, 28, 37, 1),
      surface: Color.fromRGBO(44, 50, 66, 1),
      onSurface: Colors.white);

  @override
  void initState() {
    getAppSettings();
    super.initState();
  }

  Future<ColorScheme> getAppSettings() async {
    appSettings = await widget.isarService.getAppSettings();
    setState(() {
      // if (appSettings.darkMode) {
      //   _themeMode = ThemeMode.dark;
      // } else {
      //   _themeMode = ThemeMode.light;
      // }
      darkColor = ColorScheme(
          brightness: Brightness.dark,
          primary: appSettings.primaryColor != ""
              ? HexColor.fromHex(appSettings.primaryColor)
              : Color.fromRGBO(242, 217, 141, 1),
          onPrimary: Colors.black,
          secondary: appSettings.secondaryColor != ""
              ? HexColor.fromHex(appSettings.secondaryColor)
              : Color.fromRGBO(149, 169, 225, 1),
          onSecondary: Colors.black,
          error: Colors.red,
          onError: Colors.red,
          background: Color.fromRGBO(25, 28, 37, 1),
          onBackground: Color.fromRGBO(25, 28, 37, 1),
          surface: Color.fromRGBO(44, 50, 66, 1),
          onSurface: Colors.white);
    });
    isActive = true;
    return darkColor;
  }

  // void changeTheme() {
  //   setState(() {
  //     appSettings.darkMode = !appSettings.darkMode;
  //     if (_themeMode == ThemeMode.light) {
  //       _themeMode = ThemeMode.dark;
  //     } else {
  //       _themeMode = ThemeMode.light;
  //     }
  //   });
  //   widget.isarService.saveAppSettings(appSettings);
  // }

  @override
  Widget build(BuildContext context) {
    return
        // FutureBuilder(
        //     future: getAppSettings(),
        //     builder: (BuildContext context, AsyncSnapshot<ColorScheme> snapshot) =>
        //         snapshot.hasData
        //             ?
        MaterialApp(
            title: 'Plaktago',
            theme: ThemeData(
                fontFamily: GoogleFonts.novaRound().fontFamily,
                colorScheme: darkColor,
                appBarTheme: AppBarTheme(
                    backgroundColor: darkColor.background,
                    iconTheme: IconThemeData(color: Colors.white),
                    scrolledUnderElevation: 0.0,
                    titleTextStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.white,
                      fontFamily: GoogleFonts.novaRound().fontFamily,
                    )),
                drawerTheme:
                    DrawerThemeData(backgroundColor: darkColor.background),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    backgroundColor: darkColor.background,
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
                    backgroundColor:
                        MaterialStateProperty.resolveWith((states) {
                  return darkColor.primary;
                }))),
                useMaterial3: true),
            themeMode: _themeMode,
            home: 
            isActive ?
            NavigationBarApp(
                changeTheme: () {},
                appSettings: appSettings,
                isarService: widget.isarService)
            : CircularProgressIndicator()
      );
  }
}
