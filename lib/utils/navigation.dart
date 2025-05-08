import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/error/error_page.dart';
import '../pages/settings/settings_page.dart';

class RouteNavigation {
  /// Base
  static const String error = '/404';
  static const String notLoggedIn = '/not-logged-in';
  static const String home = '/home';

  /// Tabs
  static const String debug = '/debug';

  /// AppBar Actions
  static const String settings = '/settings';

  static GetPage get errorPage {
    return GetPage(
      name: error,
      page: () => ErrorPage(homeRoute: home),
      transition: Transition.noTransition,
    );
  }

  static List<GetPage> routes = <GetPage>[
    /// Not Logged In
    GetPage(
      name: notLoggedIn,
      page: () => SizedBox(),
      transition: Transition.noTransition,
    ),

    /// Home
    GetPage(
      name: home,
      page: () => SizedBox(),
      transition: Transition.noTransition,
    ),

    /// Debug
    if (kDebugMode)
      GetPage(
        name: debug,
        page: () => SizedBox(),
        transition: Transition.noTransition,
      ),

    /// Settings
    GetPage(
      name: settings,
      page: () => SettingsPage(),
      transition: Transition.noTransition,
    ),

    /// TabBar Pages
  ];
}
