library;

import 'package:burakbasci_widgets/widgets/appbar/appbar.dart';
import 'package:burakbasci_widgets/widgets/appbar/actions.dart';
import 'package:burakbasci_widgets/widgets/appbar/tab_bar.dart';
import 'package:burakbasci_widgets/widgets/scaffold/page_background.dart';
import 'package:flutter/material.dart';

class PageScaffolding extends StatelessWidget {
  const PageScaffolding({
    required this.child,
    required this.constraints,
    required this.title,
    required this.homeRoute,
    required this.tabs,
    required this.tabBarRoutes,
    required this.appBarHeight,
    required this.appBarIconWidth,
    this.floatingActionButton,
    this.isScrollView = true,
    this.actions,
    super.key,
  });

  final Widget child;
  final BoxConstraints constraints;
  final Widget? floatingActionButton;
  final bool isScrollView;
  final String title;
  final String homeRoute;
  final List<TabInfo> tabs;
  final List<String> tabBarRoutes;
  final List<ActionInfo>? actions;
  final double appBarHeight;
  final double appBarIconWidth;

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Scaffold(
        appBar: CustomAppBar(
          appBarTitle: title,
          homeRoute: homeRoute,
          tabs: tabs,
          tabBarRoutes: tabBarRoutes,
          actions: actions,
          appBarHeight: appBarHeight,
          appBarIconWidth: appBarIconWidth,
        ),
        body: PageBackground(
          isScrollView: isScrollView,
          constraints: constraints,
          child: child,
        ),
        floatingActionButton: floatingActionButton,
      ),
    );
  }
}
