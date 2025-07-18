import 'package:checklist_app/theme/colors/checklist_color_theme.dart';
import 'package:checklist_app/theme/colors/checklist_color_theme_extension.dart';
import 'package:flutter/material.dart';

class ChecklistThemeProvider extends ChangeNotifier {
  bool _isDarkMode = true;

  ChecklistColorThemeExtension get theme =>
      _isDarkMode ? ChecklistColorTheme.dark() : ChecklistColorTheme.light();

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  void setDarkMode(bool isDark) {
    _isDarkMode = isDark;
    notifyListeners();
  }
}
