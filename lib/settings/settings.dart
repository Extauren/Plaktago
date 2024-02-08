import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plaktago/components/app_bar.dart';
import 'package:plaktago/data_class/app_settings.dart';
import 'package:plaktago/game/board/card_name.dart';
import 'package:plaktago/settings/github_page.dart';
import 'package:plaktago/home/bingo_type_button.dart';
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

  void changeSecondaryColor(final Color color) {
    widget.appSettings.secondaryColor = '#${color.value.toRadixString(16)}';
    widget.isarService.saveAppSettings(widget.appSettings);
  }

  void changePrimaryColor(final Color color) {
    widget.appSettings.primaryColor = '#${color.value.toRadixString(16)}';
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
                            onChanged: (b) => setState(() => {
                                  widget.appSettings.displayTimer =
                                      !widget.appSettings.displayTimer,
                                  widget.isarService
                                      .saveAppSettings(widget.appSettings)
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
              ListTile(
                title: const Text('Click this color to modify it in a dialog. '
                    'The color is modified while dialog is open, but returns '
                    'to previous value if dialog is cancelled'),
                subtitle: Text(
                  // ignore: lines_longer_than_80_chars
                  '${ColorTools.materialNameAndCode(Colors.red)} '
                  'aka ${ColorTools.nameThatColor(Colors.red)}',
                ),
                trailing: ColorIndicator(
                  width: 44,
                  height: 44,
                  borderRadius: 4,
                  color: Colors.red,
                  onSelectFocus: true,
                  onSelect: () async {
                    // Store current color before we open the dialog.
                    //final Color colorBeforeDialog = dialogPickerColor;
                    // Wait for the picker to close, if dialog was dismissed,
                    // then restore the color we had before it was opened.
                    if (!(await colorPickerDialog())) {
                      setState(() {
                        //dialogPickerColor = colorBeforeDialog;
                      });
                    }
                  },
                ),
              ),
              // Container(
              //     margin: EdgeInsets.only(top: 0),
              //     height: 100,
              //     width: 100,
              //     child: PColorPicker(
              //         color: widget.appSettings.primaryColor != ""
              //             ? HexColor.fromHex(widget.appSettings.primaryColor)
              //             : Color.fromRGBO(242, 217, 141, 1),
              //         changeColor: changePrimaryColor,
              //         title: "Changer la couleurs primaire")),
              // Container(
              //     margin: EdgeInsets.only(top: 0),
              //     height: 100,
              //     width: 100,
              //     child: PColorPicker(
              //         color: widget.appSettings.secondaryColor != ""
              //             ? HexColor.fromHex(widget.appSettings.secondaryColor)
              //             : Color.fromRGBO(149, 169, 225, 1),
              //         changeColor: changeSecondaryColor,
              //         title: "Changer la couleurs secondaire"))
            ])));
  }

  Future<bool> colorPickerDialog() async {
    return ColorPicker(
      //color: Color.red,
      onColorChanged: (Color color) => setState(() => color = color),
      width: 40,
      height: 40,
      borderRadius: 4,
      spacing: 5,
      runSpacing: 5,
      wheelDiameter: 155,
      heading: Text(
        'Select color',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subheading: Text(
        'Select color shade',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      wheelSubheading: Text(
        'Selected color and its shades',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      showMaterialName: true,
      showColorName: true,
      showColorCode: true,
      copyPasteBehavior: const ColorPickerCopyPasteBehavior(
        longPressMenu: true,
      ),
      materialNameTextStyle: Theme.of(context).textTheme.bodySmall,
      colorNameTextStyle: Theme.of(context).textTheme.bodySmall,
      colorCodeTextStyle: Theme.of(context).textTheme.bodyMedium,
      colorCodePrefixStyle: Theme.of(context).textTheme.bodySmall,
      selectedPickerTypeColor: Theme.of(context).colorScheme.primary,
      pickersEnabled: const <ColorPickerType, bool>{
        ColorPickerType.both: false,
        ColorPickerType.primary: true,
        ColorPickerType.accent: true,
        ColorPickerType.bw: false,
        ColorPickerType.custom: true,
        ColorPickerType.wheel: true,
      },
      //customColorSwatchesAndNames: colorsNameMap,
    ).showPickerDialog(
      context,
      actionsPadding: const EdgeInsets.all(16),
      constraints:
          const BoxConstraints(minHeight: 480, minWidth: 300, maxWidth: 320),
    );
  }
}
