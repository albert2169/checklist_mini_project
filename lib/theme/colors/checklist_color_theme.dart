import 'package:checklist_app/theme/colors/checklist_color.dart';
import 'package:checklist_app/theme/colors/checklist_color_palette.dart';
import 'package:checklist_app/theme/colors/checklist_color_theme_extension.dart';
import 'package:flutter/material.dart';

abstract class ChecklistColorTheme {
  static ChecklistColorThemeExtension light() {
    return ChecklistColorThemeExtension(
      barChartColor: ChecklistColor(ChecklistColorPalette.backgroundDarkColor.value),
      brightness: Brightness.light,
      primary: ChecklistColor(ChecklistColorPalette.whiteColor.value),
      secondary: ChecklistColor(ChecklistColorPalette.backgroundGreyColor.value),
      tertiary: ChecklistColor(ChecklistColorPalette.backgroundDarkColor.value),
      foregroundPrimary: ChecklistColor(ChecklistColorPalette.backgroundDarkColor.value),
      foregroundSecondary: ChecklistColor(ChecklistColorPalette.backgroundDarkColor.value),
      foregroundTertiary: ChecklistColor(ChecklistColorPalette.backgroundDarkColor.value),
      backgroundPrimary: ChecklistColor(ChecklistColorPalette.backgroundDarkColor.value),
      backgroundSecondary: ChecklistColor(ChecklistColorPalette.backgroundAppBarDarkColor.value),
      backgroundTertiary: ChecklistColor(ChecklistColorPalette.backgroundDarkColor.value),
    );
  }

  static ChecklistColorThemeExtension dark() {
    return ChecklistColorThemeExtension(
      barChartColor: ChecklistColor(ChecklistColorPalette.backgroundDarkColor.value),
      brightness: Brightness.light,
      primary: ChecklistColor(ChecklistColorPalette.whiteColor.value),
      secondary: ChecklistColor(ChecklistColorPalette.backgroundGreyColor.value),
      tertiary: ChecklistColor(ChecklistColorPalette.backgroundDarkColor.value),
      foregroundPrimary: ChecklistColor(ChecklistColorPalette.backgroundDarkColor.value),
      foregroundSecondary: ChecklistColor(ChecklistColorPalette.backgroundDarkColor.value),
      foregroundTertiary: ChecklistColor(ChecklistColorPalette.backgroundDarkColor.value),
      backgroundPrimary: ChecklistColor(ChecklistColorPalette.backgroundDarkColor.value),
      backgroundSecondary: ChecklistColor(ChecklistColorPalette.backgroundAppBarDarkColor.value),
      backgroundTertiary: ChecklistColor(ChecklistColorPalette.backgroundDarkColor.value),
    );
  }

  static ChecklistColorThemeExtension of(BuildContext context) {
    final colorTheme = Theme.of(context).extension<ChecklistColorThemeExtension>();

    if (colorTheme == null) return light();

    return colorTheme;
  }
}
