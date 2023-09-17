import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:plaktago/bug_report.dart';
import 'package:plaktago/utils/isar_service.dart';
import 'package:plaktago/utils/app_settings.dart';
import 'package:plaktago/utils/save_game.dart';

class DrawerApp extends StatefulWidget {
  final Function changeTheme;
  final AppSettings appSettings;
  final IsarService isarService;
  const DrawerApp(
      {Key? key,
      required this.changeTheme,
      required this.appSettings,
      required this.isarService});

  @override
  State<DrawerApp> createState() => _Drawer();
}

class _Drawer extends State<DrawerApp> {
  bool _darkMode = false;

  @override
  void initState() {
    super.initState();
    _darkMode = widget.appSettings.darkMode;
  }

  void resetData() {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      animType: AnimType.scale,
      dialogBackgroundColor: Colors.grey[300],
      title: 'Supprimer les données',
      titleTextStyle:
          TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      desc: 'Etes vous sur de vouloir supprimer toutes les données ?',
      descTextStyle: TextStyle(color: Colors.black),
      btnOkOnPress: widget.isarService.deleteAllData, //saveGame.resetFile,
      btnCancelText: "Annuler",
      btnCancelOnPress: () => {},
    ).show();
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
                    margin: EdgeInsets.only(top: 10),
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
