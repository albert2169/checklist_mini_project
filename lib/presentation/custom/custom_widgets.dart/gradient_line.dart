import 'package:flutter/material.dart';

class GradientLine extends StatelessWidget {
  final double lineWidth;

  const GradientLine({super.key, required this.lineWidth});

  @override
  Widget build(BuildContext context) {
    final gradientColors = const [Color(0xFFE8D228), Color(0xFF822D16), Color(0xFFE8D228), Color(0xFF822D16)];
    return Container(
      width: lineWidth,
      height: 1,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
