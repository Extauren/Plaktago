import 'package:another_flushbar/flushbar.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:restart_app/restart_app.dart';

class PColorPicker extends StatefulWidget {
  final String title;
  final Color color;
  final Function changeColor;

  const PColorPicker(
      {Key? key,
      required this.title,
      required this.color,
      required this.changeColor})
      : super(key: key);

  @override
  State<PColorPicker> createState() => _PColorPicker();
}

class _PColorPicker extends State<PColorPicker> {
  late Color screenPickerColor; // Color for picker shown in Card on the screen.
  late Color dialogPickerColor; // Color for picker in dialog using onChanged
  late Color dialogSelectColor; // Color for picker using color select dialog.

  static const Color guidePrimary = Color.fromRGBO(242, 217, 141, 1);
  static const Color guideSecondary = Color.fromRGBO(149, 169, 225, 1);

  final Map<ColorSwatch<Object>, String> colorsNameMap =
      <ColorSwatch<Object>, String>{
    ColorTools.createPrimarySwatch(guidePrimary): 'Guide Purple',
    ColorTools.createAccentSwatch(guideSecondary): 'Guide Teal',
  };

  @override
  void initState() {
    screenPickerColor = Colors.red;
    dialogPickerColor = widget.color;
    dialogSelectColor = dialogPickerColor;
    super.initState();
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
    return SizedBox(
        width: 220,
        child: Row(
            children: <Widget>[
              ColorIndicator(
                borderRadius: 8.0,
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
                      widget.changeColor(dialogPickerColor);
                      _showRestartBanner();
                    });
                  }
                },
              ),
              SizedBox(width: 40),
              Text(widget.title),
        ]));
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
          padding: EdgeInsets.only(bottom: 10),
          child: Text(
            'Choississez une couleur',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
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
        ColorPickerType.custom: true,
      },
      customColorSwatchesAndNames: colorsNameMap,
      pickerTypeLabels: <ColorPickerType, String>{
        ColorPickerType.custom : "Défault",
        ColorPickerType.wheel: "Roue"
      }
    ).showPickerDialog(
      context,
      actionsPadding: const EdgeInsets.all(16),
      constraints:
          const BoxConstraints(minHeight: 350, minWidth: 300, maxWidth: 320),
    );
  }
}
