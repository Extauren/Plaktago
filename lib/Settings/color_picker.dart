import 'package:another_flushbar/flushbar.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:plaktago/data_class/app_settings.dart';
import 'package:plaktago/utils/hex_color.dart';
import 'package:plaktago/utils/isar_service.dart';
import 'package:restart_app/restart_app.dart';

class PColorPicker extends StatefulWidget {
  final AppSettings appSettings;
  final IsarService isarService;

  const PColorPicker(
      {Key? key, required this.appSettings, required this.isarService})
      : super(key: key);

  @override
  State<PColorPicker> createState() => _PColorPicker();
}

class _PColorPicker extends State<PColorPicker> {
  late Color screenPickerColor; // Color for picker shown in Card on the screen.
  late Color dialogPickerColor; // Color for picker in dialog using onChanged
  late Color dialogSelectColor; // Color for picker using color select dialog.
  late bool isDark;

  // Define some custom colors for the custom picker segment.
  // The 'guide' color values are from
  // https://material.io/design/color/the-color-system.html#color-theme-creation
  static const Color guidePrimary = Color(0xFF6200EE);
  static const Color guidePrimaryVariant = Color(0xFF3700B3);
  static const Color guideSecondary = Color(0xFF03DAC6);
  static const Color guideSecondaryVariant = Color(0xFF018786);
  static const Color guideError = Color(0xFFB00020);
  static const Color guideErrorDark = Color(0xFFCF6679);
  static const Color blueBlues = Color(0xFF174378);

  // Make a custom ColorSwatch to name map from the above custom colors.
  final Map<ColorSwatch<Object>, String> colorsNameMap =
      <ColorSwatch<Object>, String>{
    ColorTools.createPrimarySwatch(guidePrimary): 'Guide Purple',
    ColorTools.createPrimarySwatch(guidePrimaryVariant): 'Guide Purple Variant',
    ColorTools.createAccentSwatch(guideSecondary): 'Guide Teal',
    ColorTools.createAccentSwatch(guideSecondaryVariant): 'Guide Teal Variant',
    ColorTools.createPrimarySwatch(guideError): 'Guide Error',
    ColorTools.createPrimarySwatch(guideErrorDark): 'Guide Error Dark',
    ColorTools.createPrimarySwatch(blueBlues): 'Blue blues',
  };

  @override
  void initState() {
    screenPickerColor = Colors.blue;
    dialogPickerColor = widget.appSettings.secondaryColor != ""
        ? HexColor.fromHex(widget.appSettings.secondaryColor)
        : Color.fromRGBO(149, 169, 225, 1);
    dialogSelectColor = const Color(0xFFA239CA);
    isDark = false;
    super.initState();
  }

  void _changeSecondaryColor(final Color color) {
    widget.appSettings.secondaryColor = '#${color.value.toRadixString(16)}';
    widget.isarService.saveAppSettings(widget.appSettings);
  }

  void _showRestartBanner() {
    Flushbar(
      message: "Redémarrage nécéssaire pour mettre à jours la nouvelle couleur",
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      mainButton: TextButton(
        onPressed: Restart.restartApp,
        child: Text("Redémarrer"),
      ),
      duration: Duration(seconds: 10),
      borderRadius: BorderRadius.circular(15),
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: Theme.of(context).colorScheme.surface,
    ).show(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 10, right: 20, top: 10),
        child: ListTile(
          title: const Text('Changer la couleurs secondaire'),
          trailing: ColorIndicator(
            width: 44,
            height: 44,
            borderRadius: 4,
            color: dialogPickerColor,
            onSelectFocus: false,
            onSelect: () async {
              final Color colorBeforeDialog = dialogPickerColor;
              if (!(await colorPickerDialog())) {
                setState(() {
                  dialogPickerColor = colorBeforeDialog;
                });
              } else {
                setState(() {
                  _changeSecondaryColor(dialogPickerColor);
                  print(dialogPickerColor);
                  _showRestartBanner();
                });
              }
            },
          ),
        ));
  }

  Future<bool> colorPickerDialog() async {
    return ColorPicker(
      color: dialogPickerColor,
      onColorChanged: (Color color) =>
          setState(() => dialogPickerColor = color),
      width: 40,
      height: 40,
      borderRadius: 4,
      spacing: 5,
      runSpacing: 5,
      wheelDiameter: 155,
      heading: Padding(
          padding: EdgeInsets.only(bottom: 15),
          child: Text(
            'Choississez une couleur',
            style: Theme.of(context).textTheme.titleMedium,
          )),
      copyPasteBehavior: const ColorPickerCopyPasteBehavior(
        longPressMenu: true,
      ),
      materialNameTextStyle: Theme.of(context).textTheme.bodySmall,
      colorNameTextStyle: Theme.of(context).textTheme.bodySmall,
      colorCodeTextStyle: Theme.of(context).textTheme.bodyMedium,
      colorCodePrefixStyle: Theme.of(context).textTheme.bodySmall,
      selectedPickerTypeColor: Theme.of(context).colorScheme.primary,
      pickersEnabled: const <ColorPickerType, bool>{
        ColorPickerType.primary: false,
        ColorPickerType.accent: false,
        ColorPickerType.wheel: true,
      },
      customColorSwatchesAndNames: colorsNameMap,
    ).showPickerDialog(
      context,
      actionsPadding: const EdgeInsets.all(16),
      constraints:
          const BoxConstraints(minHeight: 350, minWidth: 300, maxWidth: 320),
    );
  }
}
