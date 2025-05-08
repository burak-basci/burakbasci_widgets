# ✨ Custom Page Scaffold – Flutter Widget Library

A lightweight Flutter widget library focused on reusable **page scaffolding** and layout patterns, designed for fast development across multiple projects. This package provides a unified structure for app pages, allowing for consistent UI and code reuse.

---

## 📦 Features

- 🚀 **Reusable Page Scaffold** widget with customizable title, tabs and actions
- 🌓 Built-in support for theming (light/dark modes)
- 🧪 Simple and testable widget composition

---

## 🛠️ Getting Started

To start using the package:

1. Add it to your `pubspec.yaml`:

   ```yaml
   dependencies:
     burakbasci_widgets:
       git:
         url: https://github.com/burak-basci/burakbasci_widgets.git
   ```

2. Run:

   ```bash
   flutter pub get
   ```

3. Import it in your Dart code:

   ```dart
   import 'package:burakbasci_widgets/burakbasci_widgets.dart';
   ```

---

## 🚀 Usage

Here's a simple example of using the `CustomPageScaffold` widget:

```dart
import 'package:burakbasci_widgets/burakbasci_widgets.dart';
import 'package:burakbasci_widgets/pages/settings/settings_controller.dart';
import 'package:burakbasci_widgets/utils/locales.dart';
import 'package:burakbasci_widgets/utils/themes.dart';
import 'package:burakbasci_widgets/widgets/appbar/actions.dart';
import 'package:burakbasci_widgets/widgets/appbar/tab_bar.dart';
import 'package:example/utils/navigation.dart';
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
      debugShowCheckedModeBanner: false,

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

/// Wrap every page with this Widgets you just designed to your liking and you are good to go
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
        RouteNavigation.home,
        RouteNavigation.tab1,
        RouteNavigation.tab2,
      ],
      tabs: <TabInfo>[
        TabInfo(
          index: 0,
          label: 'Debug',
          icon: Icons.bug_report,
          showInDebugOnly: true,
        ),
        TabInfo(index: 1, label: 'Home', icon: Icons.home),
        TabInfo(
          index: 2,
          label: 'Tab 1',
          icon: Icons.one_k,
        ),
        TabInfo(
          index: 3,
          label: 'Tab 2',
          icon: Icons.two_k,
        ),
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
```

Copy the navigation.dart example and fill it with your pages like this. Also feel free to use the other dart files in the utils folder and shape them as you need in your own project:

```dart
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
```

➡️ For advanced usage and composition examples, check the `/example` directory.

---

## 📚 Additional Information

- **Contributions:** Pull requests are welcome! Please fork the repository and submit a PR.
- **Issues:** Found a bug or want a new feature? [Open an issue](https://github.com/burak-basci/burakbasci_widgets/issues)
- **License:** BSD-3-Clause (see `LICENSE` file)
- **Author:** [Burak Basci](https://github.com/burak-basci)

---

> This package is built primarily for personal use, but you're welcome to use and contribute if you find it helpful. It's ideal for any Flutter project where consistent page layout is needed.
