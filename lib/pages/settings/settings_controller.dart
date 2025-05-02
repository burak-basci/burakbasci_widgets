import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingsController extends GetxController {
  final GetStorage _getStorage = GetStorage();
  final String isDarkModeKey = 'isDarkMode';
  final String deviceLocaleKey = 'deviceLocale';

  ///
  /// Theme
  ///
  bool getIsDarkMode() => _getStorage.read(isDarkModeKey) as bool? ?? true;

  ThemeMode getThemeMode() =>
      getIsDarkMode() ? ThemeMode.dark : ThemeMode.light;

  void _saveThemeMode({
    required bool isDarkMode,
  }) {
    _getStorage.write(isDarkModeKey, isDarkMode);
  }

  void setThemeMode({
    required bool isDarkMode,
  }) {
    Get.changeThemeMode(isDarkMode ? ThemeMode.dark : ThemeMode.light);
    _saveThemeMode(isDarkMode: isDarkMode);
  }

  ///
  /// Language
  ///
  Locale getDeviceLocale() {
    switch (_getStorage.read(deviceLocaleKey) as String?) {
      case 'en':
        return const Locale('en', 'US');
      case 'de':
        return const Locale('de', 'DE');
      default:
        return const Locale('en', 'US');
    }
  }

  void _saveDeviceLocale({
    required Locale locale,
  }) {
    _getStorage.write(deviceLocaleKey, locale.languageCode);
  }

  void setDeviceLocale({
    required Locale locale,
  }) {
    Get.updateLocale(locale);
    _saveDeviceLocale(locale: locale);
  }

  ///
  /// Language
  ///
  void showLanguageDialog() {
    Get.dialog(
      SimpleDialog(
        title: Center(
          child: Text(
            'Language'.tr,
          ),
        ),
        titlePadding: const EdgeInsets.all(16.0),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SimpleDialogOption(
                  child: Text(
                    'English',
                    style: getDeviceLocale() == const Locale('en', 'US')
                        ? Get.theme.textTheme.bodyLarge?.copyWith(
                            color: Get.theme.primaryColor,
                          )
                        : Get.theme.textTheme.bodyLarge,
                  ),
                  onPressed: () {
                    setDeviceLocale(locale: const Locale('en', 'US'));
                    Get.back();
                  },
                ),
                SimpleDialogOption(
                  onPressed: () {
                    setDeviceLocale(locale: const Locale('de', 'DE'));
                    Get.back();
                  },
                  child: Text(
                    'Deutsch',
                    style: getDeviceLocale() == const Locale('de', 'DE')
                        ? Get.theme.textTheme.bodyLarge?.copyWith(
                            color: Get.theme.primaryColor,
                          )
                        : Get.theme.textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
