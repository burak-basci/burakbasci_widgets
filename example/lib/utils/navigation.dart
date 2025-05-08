import 'package:burakbasci_widgets/pages/error/error_page.dart';
import 'package:burakbasci_widgets/pages/settings/settings_page.dart';
import 'package:example/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RouteNavigation {
  /// Base
  static const String error = '/404';
  static const String home = '/home';
  static const String login = '/login';

  /// Tabs
  static const String debug = '/debug';
  static const String tab1 = '/tab1';
  static const String tab2 = '/tab2';

  /// AppBar Actions
  static const String settings = '/settings';

  static GetPage get errorPage {
    return GetPage(
      name: error,
      page:
          () => MyPageScaffolding(
            child: ErrorPage(homeRoute: home),
          ),
      transition: Transition.noTransition,
    );
  }

  static List<GetPage> routes = <GetPage>[
    /// login
    GetPage(
      name: login,
      page: () => MyPageScaffolding(child: Text('login')),
      transition: Transition.noTransition,
    ),

    /// Home
    GetPage(
      name: home,
      page: () => MyPageScaffolding(child: Text('home')),
      transition: Transition.noTransition,
    ),

    /// Debug
    if (kDebugMode)
      GetPage(
        name: debug,
        page: () => MyPageScaffolding(child: Text('debug')),
        transition: Transition.noTransition,
      ),

    /// Settings
    GetPage(
      name: settings,
      page: () => MyPageScaffolding(child: SettingsPage()),
      transition: Transition.noTransition,
    ),

    /// TabBar Pages
    GetPage(
      name: tab1,
      page: () => MyPageScaffolding(child: Text('Tab 1')),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: tab2,
      page: () => MyPageScaffolding(child: Text('Tab 2')),
      transition: Transition.noTransition,
    ),
  ];
}
