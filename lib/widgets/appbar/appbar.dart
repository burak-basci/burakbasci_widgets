import 'package:burakbasci_widgets/widgets/appbar/actions.dart';
import 'package:burakbasci_widgets/widgets/appbar/leading_icon.dart';
import 'package:burakbasci_widgets/widgets/appbar/leading_title.dart';
import 'package:burakbasci_widgets/widgets/appbar/tab_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBar({
    required this.tabBarRoutes,
    required this.tabs,
    required this.homeRoute,
    required this.appBarTitle,
    this.actions,
    this.appBarHeight = 60.0,
    this.appBarIconWidth = 56.0,
    super.key,
  });

  final String homeRoute;
  final String appBarTitle;
  final List<TabInfo> tabs;
  final List<ActionInfo>? actions;
  final List<String> tabBarRoutes;

  final double appBarHeight;
  final double appBarIconWidth;

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
            AppBarTabBar(tabs: tabs),
            Positioned(
              right: 0.0,
              child: SizedBox(
                height: appBarHeight,
                child: AppBarActions(
                  appBarHeight: appBarHeight,
                  appBarIconWidth: appBarIconWidth,
                  actions: actions,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
