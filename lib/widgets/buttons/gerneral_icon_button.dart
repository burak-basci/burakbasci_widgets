import 'package:flutter/material.dart';

class GeneralIconButton extends StatelessWidget {
  const GeneralIconButton({
    super.key,
    this.height,
    this.width,
    required this.icon,
    required this.iconSize,
    required this.onTap,
    this.onHover,
  });

  final double? height;
  final double? width;
  final IconData icon;
  final double iconSize;
  final void Function()? onTap;
  final void Function(bool)? onHover;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onHover: onHover,
      child: SizedBox(
        height: height,
        width: width,
        child: Icon(icon, size: iconSize),
      ),
    );
  }
}
