import 'package:flutter/material.dart';
import 'package:kaon_sa_kuan/themes/logic/app_themes.dart';
import 'package:kaon_sa_kuan/themes/constants/app_theme_type.dart';

class ThemeController {
  static final ValueNotifier<AppThemeType> notifier = ValueNotifier(AppThemeType.orange);

  static void setTheme(AppThemeType type) {
    notifier.value = type;
  }

}