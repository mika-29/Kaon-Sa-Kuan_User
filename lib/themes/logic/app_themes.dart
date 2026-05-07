import 'package:flutter/material.dart';
import 'package:kaon_sa_kuan/themes/constants/app_colors.dart';
import 'package:kaon_sa_kuan/themes/constants/app_theme_type.dart';
export 'package:kaon_sa_kuan/themes/constants/app_theme_type.dart'; // bc main will use this

/*
===========================================================================
   This file contains the logic for themes and reuses the app colors class.
   It also uses the enum types on app themes types for the getters.
===========================================================================
*/

// this is for the customized widgets
class ExtraColors extends ThemeExtension<ExtraColors> {
  final Color highlights;
  final Color healthyTag;
  final Color categoryChip;
  final Color promoElement;
  final Color favoriteElement;
  final Color cancelButton;
  final Color hintText;

  const ExtraColors({
    required this.highlights,
    required this.healthyTag,
    required this.categoryChip,
    required this.promoElement,
    required this.favoriteElement,
    required this.cancelButton,
    required this.hintText,
  });

  @override
  ExtraColors copyWith() => this;

  // lerp means linear interpolation. it finds the middle ground value for a smooth animation
  @override
  ExtraColors lerp(ThemeExtension<ExtraColors>? newTheme, double t) {
    if (newTheme is! ExtraColors) return this;
    return ExtraColors(
      highlights: Color.lerp(highlights, newTheme.highlights, t)!,
      healthyTag: Color.lerp(healthyTag, newTheme.healthyTag, t)!,
      categoryChip: Color.lerp(categoryChip, newTheme.categoryChip, t)!,
      promoElement: Color.lerp(promoElement, newTheme.promoElement, t)!,
      favoriteElement: Color.lerp(favoriteElement, newTheme.favoriteElement, t)!,
      cancelButton: Color.lerp(cancelButton, newTheme.cancelButton, t)!,
      hintText: Color.lerp(hintText, newTheme.hintText, t)!,
    );
  }
}

class AppThemes {
  AppThemes._();

  // --- THEME BUILDER ---
  static ThemeData _build({
    required Color background,
    required Color primary,
    required Color onPrimary, //page title text
    required Color surface,
    required Color onSurface, //body text
    required Color highlights,
    required Color healthyTag,
    required Color categoryChip,
    required Color promoElement,
    required Color favoriteElement,
    required Color cancelButton,
    required Color hintText,
  }) {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: background,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primary, // main app themes, just the same with primary
        primary: primary,   // auto-styles buttons (main buttons, selected states, active UI elements)
        onPrimary: onPrimary,
        surface: surface,   // auto-styles cards (what sits on top of the page, widgets)
        onSurface: onSurface,    // auto-styles text above widgets
      ),
      // Add your custom "rebel" colors to the extension
      extensions: [
        ExtraColors(
          highlights: highlights,
          healthyTag: healthyTag,
          categoryChip: categoryChip,
          promoElement: promoElement,
          favoriteElement: favoriteElement,
          cancelButton: cancelButton,
          hintText: hintText,
        ),
      ],
    );
  }

  // --- ACCESS THEMES HERE ---
  static ThemeData get orange => _build(
      background: AppColors.orange.appBackground,
      primary: AppColors.orange.activeElement,
      surface: AppColors.orange.cardSectionBackground,
      onPrimary: AppColors.orange.pageTitleText,
      onSurface: AppColors.orange.bodyText,
      highlights: AppColors.orange.highlights,
      healthyTag: AppColors.orange.healthyTag,
      categoryChip: AppColors.orange.categoryChip,
      promoElement: AppColors.orange.promoElement ,
      favoriteElement: AppColors.orange.favoriteElement,
      cancelButton: AppColors.orange.cancelButton,
      hintText: AppColors.orange.hintText
  );

}

// Use in UI
extension ThemeShortcut on BuildContext {
  // Use: context.primary, etc.
  Color get primary => Theme.of(this).colorScheme.primary;
  Color get surface => Theme.of(this).colorScheme.surface;
  Color get onPrimary => Theme.of(this).colorScheme.onPrimary;
  Color get onSurface => Theme.of(this).colorScheme.onSurface;

  // Use: context.bubble / context.highlight / context.container
  ExtraColors get _extra => Theme.of(this).extension<ExtraColors>()!;
  Color get highlights => _extra.highlights;
  Color get healthyTag => _extra.healthyTag;
  Color get categoryChip => _extra.categoryChip;
  Color get promoElement => _extra.promoElement;
  Color get favoriteElement => _extra.favoriteElement;
  Color get cancelButton => _extra.cancelButton;
  Color get hintText => _extra.hintText;
}

ThemeData getTheme(AppThemeType type) {
  switch (type) {
    case AppThemeType.orange:
      return AppThemes.orange;
    default:
      return AppThemes.orange;
  }
}
