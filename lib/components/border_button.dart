import 'package:flutter/material.dart';

class PBorderButton extends StatelessWidget {
  const PBorderButton(
      {Key? key,
      required this.label,
      required this.onPressed,
      this.iconData,
      this.height = 40.0,
      this.width = 110.0,
      this.margin,
      this.elevation = 2,
      this.labelFontSize = 14.0,
      this.backgroundColor});
  final String label;
  final VoidCallback onPressed;
  final IconData? iconData;
  final double height;
  final double width;
  final EdgeInsetsGeometry? margin;
  final double? elevation;
  final double labelFontSize;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final Color bckColor = backgroundColor != null
        ? backgroundColor!
        : Theme.of(context).colorScheme.surface;
    final Widget? icon = iconData != null
        ? Padding(
            padding: EdgeInsets.only(right: 5),
            child: Icon(
              iconData,
              color: Theme.of(context).colorScheme.primary,
            ))
        : null;
    return Align(
        child: Container(
            height: height,
            width: width,
            margin: margin,
            child: FloatingActionButton.extended(
              onPressed: onPressed,
              elevation: elevation,
              backgroundColor: bckColor,
              splashColor: bckColor,
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                      width: 1, color: Theme.of(context).colorScheme.primary),
                  borderRadius: BorderRadius.circular(15)),
              icon: icon,
              label: Text(label,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: labelFontSize)),
            )));
  }
}
