
import 'package:flutter/material.dart';

class GradientBorderCardPainter extends CustomPainter {
  final double borderWidth;
  final List<Color> gradientColors;

  GradientBorderCardPainter({
    required this.borderWidth,
    required this.gradientColors,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final rrect = RRect.fromRectAndRadius(
      rect.deflate(borderWidth / 2),
      const Radius.circular(15),
    );

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth
      ..shader = LinearGradient(
        colors: gradientColors,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(rect);

    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(covariant GradientBorderCardPainter oldDelegate) {
    return borderWidth != oldDelegate.borderWidth ||
        gradientColors != oldDelegate.gradientColors;
  }
}
