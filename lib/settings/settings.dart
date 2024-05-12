import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plaktago/components/app_bar.dart';
import 'package:plaktago/components/color_picker.dart';
import 'package:plaktago/data_class/app_settings.dart';
import 'package:plaktago/game/board/cardName/card_name.dart';
import 'package:plaktago/settings/github_page.dart';
import 'package:plaktago/home/bingo_type_button.dart';
import 'package:plaktago/settings/update_button.dart';
import 'package:plaktago/utils/hex_color.dart';
import 'package:plaktago/utils/isar_service.dart';

class Settings extends StatefulWidget {
  final AppSettings appSettings;
  final IsarService isarService;

  const Settings(
      {Key? key, required this.appSettings, required this.isarService})
      : super(key: key);

  @override
  State<Settings> createState() => _Settings();
}

class _Settings extends State<Settings> {
  List<CardName> cardsName = cardNameListPlaque;
  bool test = true;

  @override
  void initState() {
    super.initState();
    cardsName.sort((a, b) {
      return a.name.toLowerCase().compareTo(b.name.toLowerCase());
    });
  }

  // void changeDisplayTimer() {
  //   setState(() {
  //     widget.appSettings.displayTimer = !widget.appSettings.displayTimer;
  //   });
  //   widget.isarService.saveAppSettings(widget.appSettings);
  // }

  void goToGithubPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => GithubPage()));
  }

  String getType(List<BingoType> types) {
    var test = types.asNameMap();
    List<String> i = [];
    test.forEach((key, value) {
      i.add(value.name);
    });
    return i.join(', ');
  }

  void changePrimaryColor(final Color color) {
    widget.appSettings.primaryColor = '#${color.value.toRadixString(16)}';
    //widget.appSettings.secondaryColor = '#${color.value.toRadixString(16)}';
    widget.isarService.saveAppSettings(widget.appSettings);
    print(widget.appSettings);
  }

  void changeSecondaryColor(final Color color) {
    widget.appSettings.secondaryColor = '#${color.value.toRadixString(16)}';
    widget.isarService.saveAppSettings(widget.appSettings);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PAppBar(
          title: Text("Paramètres"),
          actions: [
            Padding(
                padding: EdgeInsetsDirectional.only(end: 10),
                child: Text(
                    'v${widget.appSettings.version}${widget.appSettings.patch}'))
          ],
        ),
        body: Container(
            margin: EdgeInsets.only(top: 20),
            child: ListView(children: [
              Column(children: [
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                  UpdateButton(isarService: widget.isarService, settings: widget.appSettings),
                  SizedBox(height: 40),
                  Text("Afficher le temps"),
                  SizedBox(height: 15),
                  DefaultTextStyle.merge(
                      child: IconTheme.merge(
                          data: IconThemeData(color: Colors.white),
                          child: AnimatedToggleSwitch<bool>.dual(
                            current: widget.appSettings.displayTimer,
                            first: false,
                            second: true,
                            spacing: 0.0,
                            animationCurve: Curves.easeInOut,
                            animationDuration:
                                const Duration(milliseconds: 600),
                            style: ToggleStyle(
                              borderColor: Colors.transparent,
                              indicatorColor:
                                  Theme.of(context).colorScheme.primary,
                              backgroundColor: Colors.black,
                            ),
                            styleBuilder: (value) => ToggleStyle(
                                backgroundColor: value
                                    ? Theme.of(context).colorScheme.surface
                                    : Theme.of(context).colorScheme.surface),
                            borderWidth: 3.0,
                            height: 40.0,
                            onChanged: (b) => setState(() {
                                  widget.appSettings.displayTimer =
                                      !widget.appSettings.displayTimer;
                                  widget.isarService
                                      .saveAppSettings(widget.appSettings);
                                }),
                            iconBuilder: (value) => value
                                ? Icon(FontAwesomeIcons.check,
                                    size: 18.0,
                                    color:
                                        Theme.of(context).colorScheme.surface)
                                : Icon(FontAwesomeIcons.x,
                                    size: 18.0, color: Colors.black),
                          ))),
                ]),
              ]),
              Padding(
                padding: EdgeInsets.only(top: 40),
                child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PColorPicker(
                      title: "Couleur primaire",
                      color: widget.appSettings.primaryColor != ""
                        ? HexColor.fromHex(widget.appSettings.primaryColor)
                        : Color.fromRGBO(242, 217, 141, 1),
                      changeColor: changePrimaryColor
                    ),
                    SizedBox(height: 20),
                    PColorPicker(
                      title: "Couleur secondaire",
                      color: widget.appSettings.secondaryColor != ""
                        ? HexColor.fromHex(widget.appSettings.secondaryColor)
                        : Color.fromRGBO(149, 169, 225, 1),
                      changeColor: changeSecondaryColor,
                    )
                  ]
                )
              )
            ])));
  }
}
