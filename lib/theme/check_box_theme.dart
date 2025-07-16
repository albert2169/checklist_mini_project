import 'package:checklist_app/theme/colors/check_box_color_theme.dart';
import 'package:flutter/material.dart';

class CheckBoxTheme {
  static ThemeData get(Brightness mode) {
    final colorTheme = CheckBoxColorTheme.light();

    return ThemeData(
      useMaterial3: false,
      applyElevationOverlayColor: false,
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      scaffoldBackgroundColor: colorTheme.backgroundPrimary,
      primaryColor: colorTheme.primary,

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colorTheme.primary,
          textStyle: TextStyle(color: colorTheme.primary),
          backgroundColor: colorTheme.primary,
        ),
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: colorTheme.primary,
        primary: colorTheme.primary,
        secondary: colorTheme.secondary,
        brightness: Brightness.light,
        surface: colorTheme.backgroundPrimary,
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colorTheme.primary;
          }
          return colorTheme.secondary;
        }),
        side: BorderSide(color: colorTheme.foregroundPrimary),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: colorTheme.backgroundPrimary,
        indicatorColor: Colors.transparent,
      ),
      extensions: <ThemeExtension<dynamic>>[colorTheme],
    );
  }
}
