import 'package:flutter/material.dart';
import 'package:plaktago/bugReport.dart';
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

  void resetData() {
    BuildContext dialogContext;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          dialogContext = context;
          return AlertDialog(
              title: Text(
                  "Etes vous sur de vouloir supprimer toutes les données ?",
                  style: TextStyle(color: Colors.black, fontSize: 18)),
              content:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                    margin: EdgeInsets.only(right: 20),
                    child: ElevatedButton(
                        onPressed: () => {
                              Navigator.pop(dialogContext),
                              saveGame.resetFile()
                            },
                        child: Text("Oui",
                            style: TextStyle(color: Colors.black)))),
                Container(
                    margin: EdgeInsets.only(left: 20),
                    child: ElevatedButton(
                        onPressed: () => {Navigator.pop(dialogContext)},
                        child:
                            Text("Non", style: TextStyle(color: Colors.black))))
              ]),
              backgroundColor: Colors.grey[300]);
        });
  }

  void reportBug() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => BugReport()));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        width: MediaQuery.of(context).size.width / 2,
        child: Stack(alignment: Alignment.center, children: [
          ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: Text('Paramètres',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
              Column(children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Text("mode sombre",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16))),
                  Switch(
                      value: _darkMode,
                      onChanged: (bool value) {
                        setState(() {
                          _darkMode = value;
                          widget.changeTheme();
                        });
                      }),
                ]),
                Container(
                    constraints: BoxConstraints(maxWidth: 180),
                    margin: EdgeInsets.only(top: 15),
                    height: 30,
                    child: ElevatedButton(
                        onPressed: reportBug,
                        child: Text(
                          "Signaler un bug",
                          style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context).colorScheme.onSecondary),
                        )))
              ])
            ],
          ),
          Positioned(
              bottom: 0,
              child: Container(
                  constraints: BoxConstraints(maxWidth: 180),
                  margin: EdgeInsets.symmetric(vertical: 15),
                  height: 30,
                  width: MediaQuery.of(context).size.width / 2 - 27,
                  child: ElevatedButton(
                      onPressed: resetData,
                      child: Text(
                        "Supprimer les données",
                        style: TextStyle(
                            fontSize: 12,
                            color: Theme.of(context).colorScheme.onSecondary),
                      ))))
        ]));
  }
}
