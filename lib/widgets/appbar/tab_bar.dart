import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'widgets/custom_tab.dart';

class TabInfo {
  final int index;
  final String label;
  final IconData icon;
  final bool showInDebugOnly;

  const TabInfo({
    required this.index,
    required this.label,
    required this.icon,
    this.showInDebugOnly = false,
  });
}

class AppBarTabBar extends StatelessWidget {
  const AppBarTabBar({
    super.key,
    required this.tabs, // Accept a list of TabInfo objects
    required this.routes,
    required this.tabIconSize,
    required this.tabTextSize,
  });

  final List<TabInfo> tabs; // Store the list of tabs
  final List<String> routes; // Store the list of routes
  final double tabIconSize;
  final double tabTextSize;

  static const double tabBarWidth = 118.0;

  @override
  Widget build(BuildContext context) {
    // Filter tabs based on debug mode if necessary
    final List<TabInfo> visibleTabs =
        tabs.where((tab) {
          return !tab.showInDebugOnly || kDebugMode;
        }).toList();

    return Center(
      child: SizedBox(
        // Calculate width based on the number of visible tabs
        width: visibleTabs.length * tabBarWidth,
        child: Row(
          // Generate CustomTab widgets dynamically
          children:
              visibleTabs.map((tabInfo) {
                return CustomTab(
                  index: tabInfo.index,
                  label: tabInfo.label,
                  icon: tabInfo.icon,
                  tabIconSize: tabIconSize,
                  tabTextSize: tabTextSize,
                  tabBarWidth: tabBarWidth,
                  route: routes[tabInfo.index],
                );
              }).toList(),
        ),
      ),
    );
  }
}
