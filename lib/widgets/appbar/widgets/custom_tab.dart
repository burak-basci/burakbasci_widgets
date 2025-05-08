import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTab extends StatelessWidget {
  const CustomTab({
    super.key,
    required this.label,
    required this.icon,
    required this.route,
    required this.tabBarWidth,
    required this.tabIconSize,
    required this.tabTextSize,
  });

  final double tabBarWidth;
  final String label;
  final IconData icon;
  final String route;
  final double tabIconSize;
  final double tabTextSize;

  @override
  Widget build(BuildContext context) {
    late final bool isSelected;

    if (Get.currentRoute == route) {
      isSelected = true;
    } else {
      isSelected = false;
    }

    return InkWell(
      onTap: () {
        Get.toNamed(route);
      },
      child: SizedBox(
        width: tabBarWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 8.0),
            Icon(
              icon,
              size: tabIconSize,
              color:
                  isSelected
                      ? Get.theme.primaryColor
                      : Get
                          .theme
                          .appBarTheme
                          .titleTextStyle
                          ?.color,
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: tabTextSize,
                color:
                    isSelected
                        ? Get.theme.primaryColor
                        : Get
                            .theme
                            .appBarTheme
                            .titleTextStyle
                            ?.color,
              ),
            ),
            const SizedBox(height: 4),
            if (isSelected)
              Container(
                height: 2,
                width: tabBarWidth - 20.0,
                color: Get.theme.primaryColor,
              ),
          ],
        ),
      ),
    );
  }
}
