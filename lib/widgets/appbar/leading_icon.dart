import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/appbar_icon_button.dart';

class AppBarLeadingIcon extends StatelessWidget {
  const AppBarLeadingIcon({
    required this.appBarHeight,
    required this.appBarIconWidth,
    required this.appBarLeadingIcon,
    required this.routesToShowLeadingIcon,
    required this.routeToGetTo,
    required this.iconSize,
    super.key,
  });

  final double appBarHeight;
  final double appBarIconWidth;
  final IconData appBarLeadingIcon;
  final List<String> routesToShowLeadingIcon;
  final String routeToGetTo; // Default route to navigate to
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    final String currentRoute = Get.currentRoute;

    // Check if the current route is in the provided list
    if (routesToShowLeadingIcon.contains(currentRoute)) {
      return AppBarIconButton(
        iconSize: iconSize,
        appBarHeight: appBarHeight,
        appBarIconWidth: appBarIconWidth,
        icon: appBarLeadingIcon,
        onTap: () {
          // Consider if this navigation logic should also be configurable
          Get.offAllNamed(routeToGetTo);
        },
      );
    } else {
      return AppBarIconButton(
        appBarHeight: appBarHeight,
        appBarIconWidth: appBarIconWidth,
        iconSize: iconSize,
        icon: Icons.arrow_back_rounded,
        onTap: () {
          String previousRoute = Get.currentRoute;
          Get.back();
          // Fallback navigation if Get.back() doesn't change the route
          if (previousRoute == Get.currentRoute) {
            Get.toNamed(routeToGetTo);
          }
        },
      );
    }
  }
}
