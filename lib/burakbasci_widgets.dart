library;

import 'package:flutter/material.dart';

import 'widgets/appbar/actions.dart';
import 'widgets/appbar/appbar.dart';
import 'widgets/appbar/tab_bar.dart';
import 'widgets/scaffold/page_background.dart';

class PageScaffolding extends StatelessWidget {
  const PageScaffolding({
    required this.child,
    required this.title,
    required this.homeRoute,
    required this.tabs,
    required this.tabBarRoutes,
    required this.appBarIconWidth,
    this.homeIconSize = 36.0,
    this.actions,
    this.floatingActionButton,
    this.isScrollView = true,
    super.key,
  });

  final Widget child;
  final String title;
  final String homeRoute;
  final List<TabInfo> tabs;
  final List<String> tabBarRoutes;
  final double appBarIconWidth;
  final double homeIconSize;
  final List<ActionInfo>? actions;
  final Widget? floatingActionButton;
  final bool isScrollView;

  @override
  Widget build(BuildContext context) {
    Theme.of(context);

    return SelectionArea(
      child: Scaffold(
        appBar: CustomAppBar(
          appBarTitle: title,
          homeRoute: homeRoute,
          tabs: tabs,
          tabBarRoutes: tabBarRoutes,
          iconSize: homeIconSize,
          actions: actions,
          appBarIconWidth: appBarIconWidth,
        ),
        body: PageBackground(
          isScrollView: isScrollView,
          child: child,
        ),
        floatingActionButton: floatingActionButton,
      ),
    );
  }
}
