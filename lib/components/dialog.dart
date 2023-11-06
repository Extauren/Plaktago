import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class PDialog {
  PDialog(
      {required this.context,
      required this.title,
      required this.desc,
      required this.bntOkOnPress});

  final BuildContext context;
  final String title;
  final String desc;
  final VoidCallback bntOkOnPress;

  void show() => AwesomeDialog(
          context: context,
          animType: AnimType.bottomSlide,
          dialogType: DialogType.noHeader,
          headerAnimationLoop: false,
          padding: EdgeInsets.only(top: 20, left: 10, right: 10),
          dialogBackgroundColor: Theme.of(context).colorScheme.background,
          title: title,
          titleTextStyle:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          desc: desc,
          descTextStyle: TextStyle(color: Colors.white),
          buttonsTextStyle:
              TextStyle(color: Theme.of(context).colorScheme.primary),
          btnOkOnPress: bntOkOnPress,
          btnOkColor: Theme.of(context).colorScheme.surface,
          btnCancelText: "Annuler",
          btnCancelOnPress: () {},
          btnCancelColor: Theme.of(context).colorScheme.surface)
      .show();
}
