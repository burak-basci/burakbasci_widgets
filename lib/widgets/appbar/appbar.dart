import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'actions.dart';
import 'leading_icon.dart';
import 'leading_title.dart';
import 'tab_bar.dart';

class CustomAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBar({
    required this.tabBarRoutes,
    required this.tabs,
    required this.homeRoute,
    required this.appBarTitle,
    required this.iconSize,
    this.actions,
    this.appBarIconWidth = 56.0,
    this.tabIconSize = 26.0,
    this.tabTextSize = 14.0,
    super.key,
  });

  final List<String> tabBarRoutes;
  final List<TabInfo> tabs;
  final String homeRoute;
  final String appBarTitle;
  final double iconSize;
  final List<ActionInfo>? actions;
  final double appBarIconWidth;
  final double tabIconSize;
  final double tabTextSize;

  static const double appBarHeight = 60.0;

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (kDebugMode) {
          print(constraints.maxWidth);
        }
        return Stack(
          children: <Widget>[
            Row(
              children: <Widget>[
                AppBarLeadingIcon(
                  appBarHeight: appBarHeight,
                  appBarIconWidth: appBarIconWidth,
                  appBarLeadingIcon:
                      Icons.lightbulb_outline_rounded,
                  iconSize: iconSize,
                  routeToGetTo: homeRoute,
                  routesToShowLeadingIcon: tabBarRoutes,
                ),
                if (constraints.maxWidth > 840)
                  AppBarLeadingTitle(
                    appBarHeight: appBarHeight,
                    title: appBarTitle,
                    routeToGetTo: homeRoute,
                  ),
              ],
            ),
            AppBarTabBar(
              tabs: tabs,
              routes: tabBarRoutes,
              tabIconSize: tabIconSize,
              tabTextSize: tabTextSize,
            ),
            Positioned(
              right: 0.0,
              child: AppBarActions(
                appBarHeight: appBarHeight,
                appBarIconWidth: appBarIconWidth,
                actions: actions,
              ),
            ),
          ],
        );
      },
    );
  }
}
