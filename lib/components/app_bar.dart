import 'package:flutter/material.dart';

class _PreferredAppBarSize extends Size {
  _PreferredAppBarSize(this.toolbarHeight, this.bottomHeight)
      : super.fromHeight(
            (toolbarHeight ?? kToolbarHeight) + (bottomHeight ?? 0));

  final double? toolbarHeight;
  final double? bottomHeight;
}

class PAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Widget? title;
  final List<Widget>? actions;
  final double? toolbarHeight;
  final PreferredSizeWidget? bottom;
  @override
  final Size preferredSize;
  final Color? borderColor;

  PAppBar(
      {super.key,
      this.title,
      this.actions,
      this.toolbarHeight,
      this.bottom,
      this.borderColor})
      : preferredSize =
            _PreferredAppBarSize(toolbarHeight, bottom?.preferredSize.height);

  @override
  State<PAppBar> createState() => _PAppBar();
}

class _PAppBar extends State<PAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: widget.title,
        actions: widget.actions,
        shape: Border(
            bottom: BorderSide(
                color: widget.borderColor == null
                    ? Theme.of(context).colorScheme.surface
                    : widget.borderColor!,
                width: 1.0)));
  }
}
