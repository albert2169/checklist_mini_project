import 'package:flutter/material.dart';

class ActiveInactiveCircle extends StatelessWidget {
  final bool active;
  final double radius;
  final Color inactiveColor;
  final List<Color> activeGradientColors;

  const ActiveInactiveCircle({
    super.key,
    required this.active,
    this.radius = 16.0,
    this.inactiveColor = const Color(0xFF8B8B9E),
    this.activeGradientColors = const [Color(0xFFE8D228), Color(0xFF822D16)],
  });

  @override
  Widget build(BuildContext context) {
    if (active) {
      return Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: activeGradientColors,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
      );
    } else {
      return Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(shape: BoxShape.circle, color: inactiveColor),
      );
    }
  }
}
