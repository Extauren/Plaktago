import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plaktago/components/border_button.dart';

class PDialog {
  PDialog(
      {required this.context,
      required this.title,
      required this.desc,
      required this.bntOkOnPress,
      this.footer = "",
      this.btnOkLabel = "Ok",
      this.displayBtn = true});

  final BuildContext context;
  final String title;
  final String desc;
  final VoidCallback bntOkOnPress;
  final String btnOkLabel;
  final bool displayBtn;
  final String footer;

  void show() => AwesomeDialog(
          context: context,
          animType: AnimType.bottomSlide,
          dialogType: DialogType.noHeader,
          headerAnimationLoop: false,
          padding: EdgeInsets.only(top: 20, left: 25, right: 25, bottom: 10),
          dialogBackgroundColor: Theme.of(context).colorScheme.surface,
          title: title,
          titleTextStyle: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
              fontSize: 20),
          desc: desc,
          descTextStyle: TextStyle(color: Colors.white, fontSize: 15),
          btnOk: displayBtn
              ? PBorderButton(
                  label: btnOkLabel,
                  onPressed: () {
                    Navigator.of(context).pop();
                    bntOkOnPress();
                  },
                  height: 40,
                )
              : footer != "" ? Row(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(IconDataSolid(int.parse("0xf624"))), SizedBox(width: 8), Text(footer)]) : null,
          borderSide: BorderSide(
              width: 0.5, color: Theme.of(context).colorScheme.secondary),
          btnCancel: 
          displayBtn
              ? PBorderButton(
                  label: "Annuler",
                  onPressed: Navigator.of(context).pop,
                  height: 40,
                )
              : null
      )
      .show();
}
