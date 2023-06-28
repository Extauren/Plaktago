import 'package:flutter/material.dart';
import 'package:plaktago/utils/appSettings.dart';
import 'main.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _App();
}

class _App extends State<App> {
  AppSettings appSettings = AppSettings();
  bool settings = false;
  final Color primaryColor = Color.fromRGBO(149, 169, 225, 1);

  @override
  void initState() {
    super.initState();
    getSettings();
  }

  void getSettings() async {
    settings = await appSettings.getSeetingsFromFile();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      settings
          ? ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width,
                maxHeight: MediaQuery.of(context).size.height,
              ),
              child: Plaktago(appSettings: appSettings))
          : CircularProgressIndicator(
              color: primaryColor,
            )
    ]));
  }
}
