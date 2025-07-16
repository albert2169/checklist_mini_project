import 'package:flutter/material.dart';

@immutable
class BackgroundGradientExtension extends ThemeExtension<BackgroundGradientExtension> {
  final Gradient? backgroundGradient;

  const BackgroundGradientExtension({this.backgroundGradient});

  @override
  BackgroundGradientExtension copyWith({Gradient? backgroundGradient}) {
    return BackgroundGradientExtension(
      backgroundGradient: backgroundGradient ?? this.backgroundGradient,
    );
  }

  @override
  BackgroundGradientExtension lerp(ThemeExtension<BackgroundGradientExtension>? other, double t) {
    if (other is! BackgroundGradientExtension) {
      return this;
    }
    return BackgroundGradientExtension(
      backgroundGradient: Gradient.lerp(backgroundGradient, other.backgroundGradient, t),
    );
  }
}
