import 'package:checklist_app/theme/colors/check_box_color.dart';
import 'package:checklist_app/theme/colors/check_box_color_palette.dart';
import 'package:checklist_app/theme/colors/checkbox_color_theme_extension.dart';
import 'package:flutter/material.dart';

abstract class CheckBoxColorTheme {
  static CheckboxColorThemeExtension light() {
    return CheckboxColorThemeExtension(
      barChartColor: CheckBoxColor(CheckBoxColorPalette.backgroundDarkColor.value),
      brightness: Brightness.light,
      primary: CheckBoxColor(CheckBoxColorPalette.backgroundDarkColor.value),
      secondary: CheckBoxColor(CheckBoxColorPalette.backgroundDarkColor.value),
      tertiary: CheckBoxColor(CheckBoxColorPalette.backgroundDarkColor.value),
      foregroundPrimary: CheckBoxColor(CheckBoxColorPalette.backgroundDarkColor.value),
      foregroundSecondary: CheckBoxColor(CheckBoxColorPalette.backgroundDarkColor.value),
      foregroundTertiary: CheckBoxColor(CheckBoxColorPalette.backgroundDarkColor.value),
      backgroundPrimary: CheckBoxColor(CheckBoxColorPalette.backgroundDarkColor.value),
      backgroundSecondary: CheckBoxColor(CheckBoxColorPalette.backgroundDarkColor.value),
      backgroundTertiary: CheckBoxColor(CheckBoxColorPalette.backgroundDarkColor.value),
    );
  }

    static CheckboxColorThemeExtension dark() {
    return CheckboxColorThemeExtension(
      barChartColor: CheckBoxColor(CheckBoxColorPalette.backgroundDarkColor.value),
      brightness: Brightness.light,
      primary: CheckBoxColor(CheckBoxColorPalette.backgroundDarkColor.value),
      secondary: CheckBoxColor(CheckBoxColorPalette.backgroundDarkColor.value),
      tertiary: CheckBoxColor(CheckBoxColorPalette.backgroundDarkColor.value),
      foregroundPrimary: CheckBoxColor(CheckBoxColorPalette.backgroundDarkColor.value),
      foregroundSecondary: CheckBoxColor(CheckBoxColorPalette.backgroundDarkColor.value),
      foregroundTertiary: CheckBoxColor(CheckBoxColorPalette.backgroundDarkColor.value),
      backgroundPrimary: CheckBoxColor(CheckBoxColorPalette.backgroundDarkColor.value),
      backgroundSecondary: CheckBoxColor(CheckBoxColorPalette.backgroundDarkColor.value),
      backgroundTertiary: CheckBoxColor(CheckBoxColorPalette.backgroundDarkColor.value),
    );
  }



  static CheckboxColorThemeExtension of(BuildContext context) {
    final colorTheme = Theme.of(context).extension<CheckboxColorThemeExtension>();

    if (colorTheme == null) return light();

    return colorTheme;
  }
}
