import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:plaktago/components/border_button.dart';

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
      padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
      dialogBackgroundColor: Theme.of(context).colorScheme.surface,
      title: title,
      titleTextStyle: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.bold,
          fontSize: 20),
      desc: desc,
      descTextStyle: TextStyle(color: Colors.white, fontSize: 15),
      btnOk: PBorderButton(
        label: "Ok",
        onPressed: () {
          Navigator.of(context).pop();
          bntOkOnPress();
        },
        height: 40,
      ),
      btnCancel: PBorderButton(
        label: "Annuler",
        onPressed: Navigator.of(context).pop,
        height: 40,
      )).show();
}
