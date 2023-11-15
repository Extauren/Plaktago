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

  PAppBar({
    super.key,
    this.title,
    this.actions,
    this.toolbarHeight,
    this.bottom,
  }) : preferredSize =
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
        //backgroundColor: Theme.of(context).colorScheme.surface,
        shape: Border(
            bottom: BorderSide(
                color: Theme.of(context).colorScheme.surface, width: 1.0)));
  }
}
