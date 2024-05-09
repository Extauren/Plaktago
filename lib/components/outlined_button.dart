import 'package:flutter/material.dart';

class POutlinedButton extends StatelessWidget {
  const POutlinedButton(
      {Key? key,
      this.heroTag = "heroTag",
      required this.label,
      required this.onPressed,
      this.iconData,
      this.height = 50.0,
      this.width = 230.0,
      this.margin,
      this.elevation,
      this.labelFontSize = 17.0});
  final String heroTag;
  final String label;
  final VoidCallback onPressed;
  final IconData? iconData;
  final double height;
  final double width;
  final EdgeInsetsGeometry? margin;
  final double? elevation;
  final double labelFontSize;

  @override
  Widget build(BuildContext context) {
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
              backgroundColor: Theme.of(context).colorScheme.surface,
              splashColor: Theme.of(context).colorScheme.background,
              // shape: RoundedRectangleBorder(
              //     side: BorderSide(
              //         width: 0,
              //         color: Theme.of(context).colorScheme.background),
              //     borderRadius: BorderRadius.circular(15)),
              icon: icon,
              label: Text(label,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: labelFontSize)),
            )));
  }
}
