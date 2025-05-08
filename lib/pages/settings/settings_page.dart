import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:settings_ui/settings_ui.dart';

import '../../widgets/content/content_box.dart';
import 'settings_controller.dart';
import 'widgets/settings_list.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // static final AccountController account = Get.find();
  static final SettingsController settings = Get.find();

  @override
  Widget build(BuildContext context) {
    Theme.of(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        return ContentBox(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  top: 32.0,
                  left: 32.0,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Settings'.tr,
                    style: Get.textTheme.displaySmall,
                  ),
                ),
              ),
              MySettingsList(
                sections: <Widget>[
                  SettingsSection(
                    title: Text(
                      'Interface'.tr,
                      style:
                          Get.isDarkMode
                              ? null
                              : TextStyle(
                                color: Colors.black
                                    .withValues(alpha: .87),
                              ),
                    ),
                    tiles: <SettingsTile>[
                      SettingsTile.navigation(
                        leading: Icon(
                          Icons.language,
                          color: Get.theme.primaryColor
                              .withValues(alpha: .87),
                        ),
                        title: Text(
                          'Language'.tr,
                          style: TextStyle(
                            color: Get.theme.primaryColor
                                .withValues(alpha: .87),
                          ),
                        ),
                        value: Text('CurrentLanguage'.tr),
                        onPressed: (_) {
                          settings.showLanguageDialog();
                        },
                      ),
                      SettingsTile.switchTile(
                        leading: Icon(
                          Get.isDarkMode
                              ? Icons.light_mode
                              : Icons.dark_mode,
                          color: Get.theme.primaryColor
                              .withValues(alpha: .87),
                        ),
                        title: Text(
                          Get.isDarkMode
                              ? 'Enable Light'.tr
                              : 'Disable Light'.tr,
                          style: TextStyle(
                            color: Get.theme.primaryColor
                                .withValues(alpha: .87),
                          ),
                        ),
                        initialValue: !Get.isDarkMode,
                        onToggle: (value) {
                          settings.setThemeMode(
                            isDarkMode: !value,
                          );
                        },
                      ),
                    ],
                  ),
                  SettingsSection(
                    title: Text(
                      'Sound'.tr,
                      style:
                          Get.isDarkMode
                              ? null
                              : TextStyle(
                                color: Colors.black
                                    .withValues(alpha: .87),
                              ),
                    ),
                    tiles: <SettingsTile>[
                      SettingsTile.switchTile(
                        enabled: false,
                        title: Text(
                          'Enable Sound'.tr,
                          style: TextStyle(
                            color: Get.theme.primaryColor
                                .withValues(alpha: .38),
                          ),
                        ),
                        leading: Icon(
                          Icons.volume_up,
                          color: Get.theme.primaryColor
                              .withValues(alpha: .38),
                        ),
                        initialValue: false,
                        onToggle: null,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
