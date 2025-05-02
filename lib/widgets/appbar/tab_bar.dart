import 'package:burakbasci_widgets/widgets/appbar/widgets/custom_tab.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TabInfo {
  final int index;
  final String label;
  final IconData icon;
  final String route;
  final bool showInDebugOnly;

  const TabInfo({
    required this.index,
    required this.label,
    required this.icon,
    required this.route,
    this.showInDebugOnly = false,
  });
}

class AppBarTabBar extends StatelessWidget {
  const AppBarTabBar({
    super.key,
    required this.tabs, // Accept a list of TabInfo objects
  });

  final List<TabInfo> tabs; // Store the list of tabs

  static const double tabBarWidth = 118.0;

  @override
  Widget build(BuildContext context) {
    Theme.of(context);

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
                  tabBarWidth: tabBarWidth,
                  route: tabInfo.route,
                );
              }).toList(),
        ),
      ),
    );
  }
}
