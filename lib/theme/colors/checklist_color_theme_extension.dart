import 'package:checklist_app/theme/colors/checklist_color.dart';
import 'package:flutter/material.dart';

const _halfT = 0.5;

@immutable
class ChecklistColorThemeExtension extends ThemeExtension<ChecklistColorThemeExtension> {
  const ChecklistColorThemeExtension({
    required this.barChartColor,
    required this.brightness,
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.foregroundPrimary,
    required this.foregroundSecondary,
    required this.foregroundTertiary,
    required this.backgroundPrimary,
    required this.backgroundSecondary,
    required this.backgroundTertiary,
  });

  final Brightness brightness;

  final ChecklistColor primary;
  final ChecklistColor secondary;
  final ChecklistColor tertiary;

  final ChecklistColor foregroundPrimary;
  final ChecklistColor foregroundSecondary;
  final ChecklistColor foregroundTertiary;

  final ChecklistColor backgroundPrimary;
  final ChecklistColor backgroundSecondary;
  final ChecklistColor backgroundTertiary;

  final ChecklistColor barChartColor;

  @override
  int get hashCode => Object.hash(
        primary,
        secondary,
        tertiary,
        foregroundPrimary,
        foregroundSecondary,
        foregroundTertiary,
        backgroundPrimary,
        backgroundSecondary,
        backgroundTertiary,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChecklistColorThemeExtension &&
          runtimeType == other.runtimeType &&
          primary == other.primary &&
          secondary == other.secondary &&
          tertiary == other.tertiary &&
          foregroundPrimary == other.foregroundPrimary &&
          foregroundSecondary == other.foregroundSecondary &&
          foregroundTertiary == other.foregroundTertiary &&
          backgroundPrimary == other.backgroundPrimary &&
          backgroundSecondary == other.backgroundSecondary &&
          backgroundTertiary == other.backgroundTertiary;

  @override
  ChecklistColorThemeExtension copyWith({
    ChecklistColor? primary,
    ChecklistColor? secondary,
  }) {
    return ChecklistColorThemeExtension(
      barChartColor: barChartColor,
      brightness: brightness,
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      tertiary: tertiary,
      foregroundPrimary: foregroundPrimary,
      foregroundSecondary: foregroundSecondary,
      foregroundTertiary: foregroundTertiary,
      backgroundPrimary: backgroundPrimary,
      backgroundSecondary: backgroundSecondary,
      backgroundTertiary: backgroundTertiary,
    );
  }

  @override
  ThemeExtension<ChecklistColorThemeExtension> lerp(
    covariant ThemeExtension<ChecklistColorThemeExtension>? other,
    double t,
  ) {
    if (other is! ChecklistColorThemeExtension) {
      return this;
    }

    return ChecklistColorThemeExtension(
      brightness: t < _halfT ? brightness : other.brightness,
      primary: primary.lerp(other.primary, t),
      secondary: secondary.lerp(other.secondary, t),
      tertiary: tertiary.lerp(other.tertiary, t),
      foregroundPrimary: foregroundPrimary.lerp(other.foregroundPrimary, t),
      foregroundSecondary: foregroundSecondary.lerp(other.foregroundSecondary, t),
      foregroundTertiary: foregroundTertiary.lerp(other.foregroundTertiary, t),
      backgroundPrimary: backgroundPrimary.lerp(other.backgroundPrimary, t),
      backgroundSecondary: backgroundSecondary.lerp(other.backgroundSecondary, t),
      backgroundTertiary: backgroundTertiary.lerp(other.backgroundTertiary, t),
      barChartColor: barChartColor.lerp(other.barChartColor, t)
    );
  }

  static ChecklistColorThemeExtension of(BuildContext context) {
    return Theme.of(context).extension<ChecklistColorThemeExtension>()!;
  }
}
