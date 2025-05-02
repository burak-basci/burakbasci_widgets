import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarIconButton extends StatelessWidget {
  const AppBarIconButton({
    super.key,
    required this.appBarHeight,
    required this.appBarIconWidth,
    required this.icon,
    this.iconSize = 36.0,
    required this.onTap,
    this.isSelected = false,
  });

  final double appBarHeight;
  final double appBarIconWidth;
  final IconData icon;
  final double iconSize;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: appBarHeight,
        width: appBarIconWidth,
        child: Icon(
          icon,
          size: iconSize,
          color:
              isSelected
                  ? Get.theme.primaryColor
                  : Get.theme.appBarTheme.titleTextStyle?.color,
        ),
      ),
    );
  }
}
