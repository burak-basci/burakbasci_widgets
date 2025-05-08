import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
// ignore: implementation_imports
import 'package:settings_ui/src/utils/theme_provider.dart';

class MySettingsList extends StatelessWidget {
  const MySettingsList({
    required this.sections,
    this.shrinkWrap = false,
    this.physics,
    this.platform,
    this.lightTheme,
    this.darkTheme,
    this.brightness,
    this.contentPadding,
    this.applicationType = ApplicationType.material,
    super.key,
  });

  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final DevicePlatform? platform;
  final SettingsThemeData? lightTheme;
  final SettingsThemeData? darkTheme;
  final Brightness? brightness;
  final EdgeInsetsGeometry? contentPadding;
  final List<Widget> sections;
  final ApplicationType applicationType;

  @override
  Widget build(BuildContext context) {
    DevicePlatform platform;
    if (this.platform == null ||
        this.platform == DevicePlatform.device) {
      platform = PlatformUtils.detectPlatform(context);
    } else {
      platform = this.platform!;
    }

    final brightness = calculateBrightness(context);

    final themeData = ThemeProvider.getTheme(
      context: context,
      platform: platform,
      brightness: brightness,
    ).merge(
      theme:
          brightness == Brightness.dark
              ? darkTheme
              : lightTheme,
    );

    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1360),
        child: SettingsTheme(
          themeData: themeData,
          platform: platform,
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(children: [...sections]),
          ),
        ),
      ),
    );
  }

  EdgeInsets calculateDefaultPadding(
    DevicePlatform platform,
  ) {
    switch (platform) {
      case DevicePlatform.android:
      case DevicePlatform.fuchsia:
      case DevicePlatform.linux:
        return const EdgeInsets.only(top: 0);
      case DevicePlatform.iOS:
      case DevicePlatform.macOS:
      case DevicePlatform.windows:
        return const EdgeInsets.symmetric(vertical: 20);
      case DevicePlatform.web:
        return EdgeInsets.zero;
      case DevicePlatform.device:
        throw Exception(
          'You can\'t use the DevicePlatform.device in this context. '
          'Incorrect platform: SettingsList.calculateDefaultPadding',
        );
    }
  }

  Brightness calculateBrightness(BuildContext context) {
    final materialBrightness = Theme.of(context).brightness;
    final cupertinoBrightness =
        CupertinoTheme.of(context).brightness ??
        MediaQuery.of(context).platformBrightness;

    switch (applicationType) {
      case ApplicationType.material:
        return materialBrightness;
      case ApplicationType.cupertino:
        return cupertinoBrightness;
      case ApplicationType.both:
        return kIsWeb || !Platform.isIOS
            ? materialBrightness
            : cupertinoBrightness;
    }
  }
}
