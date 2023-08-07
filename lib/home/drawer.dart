import 'package:flutter/material.dart';
import 'package:plaktago/utils/appSettings.dart';
import 'package:plaktago/utils/saveGame.dart';

class DrawerApp extends StatefulWidget {
  final Function changeTheme;
  final AppSettings appSettings;
  const DrawerApp(
      {Key? key, required this.changeTheme, required this.appSettings});

  @override
  State<DrawerApp> createState() => _Drawer();
}

class _Drawer extends State<DrawerApp> {
  bool _darkMode = false;
  final saveGame = SaveGame();

  @override
  void initState() {
    super.initState();
    _darkMode = widget.appSettings.darkMode;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width / 2,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Text('Paramètres',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
                margin: EdgeInsets.only(right: 10), child: Text("mode sombre")),
            Switch(
                value: _darkMode,
                onChanged: (bool value) {
                  setState(() {
                    _darkMode = value;
                    widget.changeTheme();
                  });
                }),
          ]),
          TextButton(
              onPressed: saveGame.resetFile,
              child: Text("Supprimer les données"))
        ],
      ),
    );
  }
}