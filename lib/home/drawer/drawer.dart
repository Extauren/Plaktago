import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plaktago/components/dialog.dart';
import 'package:plaktago/components/outlined_button.dart';
import 'package:plaktago/home/drawer/bug_report.dart';
import 'package:plaktago/utils/isar_service.dart';
import 'package:plaktago/data_class/app_settings.dart';

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
    PDialog(
            context: context,
            title: "Supprimer les données",
            desc: "Etes vous sur de vouloir supprimer toutes les données ?",
            bntOkOnPress: widget.isarService.deleteAllData)
        .show();
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
                  color: Theme.of(context).colorScheme.surface,
                ),
                child: Text('Paramètres',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Column(children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  DefaultTextStyle.merge(
                      child: IconTheme.merge(
                          data: IconThemeData(color: Colors.white),
                          child: AnimatedToggleSwitch<bool>.dual(
                            current: _darkMode,
                            first: false,
                            second: true,
                            spacing: 0.0,
                            animationCurve: Curves.easeInOut,
                            animationDuration:
                                const Duration(milliseconds: 600),
                            style: ToggleStyle(
                              borderColor: Colors.transparent,
                              indicatorColor: //Colors.grey[100],
                                  Theme.of(context).colorScheme.primary,
                              backgroundColor: Colors.black,
                            ),
                            styleBuilder: (value) => ToggleStyle(
                                backgroundColor: value
                                    ? Theme.of(context)
                                        .colorScheme
                                        .surface //Colors.grey[700]
                                    : Colors.grey[350]),
                            borderWidth: 3.0,
                            height: 40.0,
                            onChanged: (b) => setState(() => {
                                  //_darkMode = b, widget.changeTheme()
                                }),
                            iconBuilder: (value) => value
                                ? Icon(FontAwesomeIcons.solidMoon,
                                    size: 18.0,
                                    color:
                                        Theme.of(context).colorScheme.surface)
                                : Icon(FontAwesomeIcons.solidSun,
                                    size: 18.0, color: Colors.black),
                          ))),
                ]),
                POutlinedButton(
                  label: "Signaler un bug",
                  onPressed: reportBug,
                  height: 40,
                  width: 130,
                  margin: EdgeInsets.symmetric(vertical: 20),
                  labelFontSize: 15,
                ),
              ])
            ],
          ),
          Positioned(
              bottom: 0,
              child: Column(children: [
                POutlinedButton(
                  label: "Supprimer les données",
                  onPressed: resetData,
                  height: 38,
                  width: 180,
                  margin: EdgeInsets.symmetric(vertical: 20),
                  labelFontSize: 15,
                ),
                Container(
                    margin: EdgeInsets.only(bottom: 15),
                    child: Text("Version ${widget.appSettings.version}"))
              ]))
        ]));
  }
}
