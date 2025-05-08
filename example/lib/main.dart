import 'package:burakbasci_widgets/burakbasci_widgets.dart';
import 'package:burakbasci_widgets/pages/settings/settings_controller.dart';
import 'package:burakbasci_widgets/utils/locales.dart';
import 'package:burakbasci_widgets/utils/themes.dart';
import 'package:burakbasci_widgets/widgets/appbar/actions.dart';
import 'package:burakbasci_widgets/widgets/appbar/tab_bar.dart';
import 'package:example/utils/navigation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final SettingsController settings = Get.put(
    SettingsController(),
  );

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Widget Demo',
      debugShowCheckedModeBanner: kDebugMode,

      /// Theme Settings
      theme: Themes().lightTheme,
      darkTheme: Themes().darkTheme,
      themeMode: MyApp.settings.getThemeMode(),

      /// Language Settings
      translations: LocaleString(),
      locale: settings.getDeviceLocale(),

      /// Navigation
      initialRoute: RouteNavigation.home,
      unknownRoute: RouteNavigation.errorPage,
      getPages: RouteNavigation.routes,
    );
  }
}

class MyPageScaffolding extends StatelessWidget {
  const MyPageScaffolding({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PageScaffolding(
      homeRoute: RouteNavigation.home,
      appBarIconWidth: 56,
      tabBarRoutes: <String>[
        RouteNavigation.debug,
        RouteNavigation.tab1,
        RouteNavigation.tab2,
      ],
      tabs: <TabInfo>[
        TabInfo(
          label: 'Debug',
          icon: Icons.bug_report,
          showInDebugOnly: true,
        ),
        TabInfo(label: 'Tab 1', icon: Icons.one_k),
        TabInfo(label: 'Tab 2', icon: Icons.two_k),
      ],
      actions: <ActionInfo>[
        ActionInfo(
          icon: Icons.settings,
          route: RouteNavigation.settings,
        ),
        ActionInfo(
          icon: Icons.account_circle,
          route: RouteNavigation.login,
        ),
      ],
      title: 'Flutter Widget Demo',
      child: child,
    );
  }
}
