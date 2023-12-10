import 'package:flutter/material.dart';

class PBorderButton extends StatelessWidget {
  const PBorderButton(
      {Key? key,
      this.heroTag = "",
      required this.label,
      required this.onPressed,
      this.iconData,
      this.height = 40.0,
      this.width = 110.0,
      this.margin,
      this.elevation = 2,
      this.labelStyle,
      this.backgroundColor});

  final String heroTag;
  final String label;
  final VoidCallback onPressed;
  final IconData? iconData;
  final double height;
  final double width;
  final EdgeInsetsGeometry? margin;
  final double? elevation;
  final TextStyle? labelStyle;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final TextStyle style = labelStyle != null
        ? labelStyle!
        : TextStyle(
            fontSize: 14.0, color: Theme.of(context).colorScheme.primary);
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
              heroTag: heroTag,
              onPressed: onPressed,
              elevation: elevation,
              backgroundColor: bckColor,
              splashColor: Theme.of(context).colorScheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                side: BorderSide(
                    width: 1, color: Theme.of(context).colorScheme.primary),
              ),
              icon: icon,
              label: Text(label, style: style),
            )));
  }
}
