import 'package:burakbasci_widgets/widgets/appbar/widgets/appbar_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Define a class to hold action button data
class ActionInfo {
  final IconData icon;
  final String route;
  final double iconSize;

  const ActionInfo({
    required this.icon,
    required this.route,
    this.iconSize = 32.0,
  });
}

class AppBarActions extends StatelessWidget {
  const AppBarActions({
    super.key,
    required this.appBarHeight,
    required this.appBarIconWidth,
    required this.actions,
  });

  final double appBarHeight;
  final double appBarIconWidth;
  final List<ActionInfo>? actions;

  @override
  Widget build(BuildContext context) {
    if (actions == null || actions!.isEmpty) {
      return const SizedBox.shrink();
    } else {
      return Row(
        // Generate AppBarIconButton widgets dynamically
        children:
            actions!.map((actionInfo) {
              return AppBarIconButton(
                appBarHeight: appBarHeight,
                appBarIconWidth: appBarIconWidth,
                icon: actionInfo.icon,
                iconSize: actionInfo.iconSize,
                isSelected:
                    Get.currentRoute == actionInfo.route,
                onTap: () => Get.toNamed(actionInfo.route),
              );
            }).toList(),
      );
    }
  }
}
