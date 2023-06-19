import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    this.color,
    this.elevation,
    this.side = BorderSide.none,
    this.onTap,
    required this.icon,
    super.key,
  });

  final IconData icon;
  final Color? color;
  final double? elevation;
  final BorderSide side;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        iconSize: 24,
        icon: Icon(
          icon,
          color: color,
        ),
        onPressed: onTap);
  }
}
