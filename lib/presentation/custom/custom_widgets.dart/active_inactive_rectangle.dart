import 'package:flutter/material.dart';

class ActiveInactiveRectangle extends StatelessWidget {
  final bool active;
  final double size;
  final double borderWidth;
  final List<Color> activeGradientColors;
  final Color inactiveColor;

  const ActiveInactiveRectangle({
    super.key,
    required this.active,
    this.size = 28.0,
    this.borderWidth = 3.0,
    this.activeGradientColors = const [Color(0xFFE8D228), Color(0xFF822D16), Color(0xFFE8D228), Color(0xFF822D16)],
    this.inactiveColor = const Color(0xFF8B8B9E),
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomPaint(
          size: Size(size, size),
          painter: GradientBorderPainter(
            active: active,
            borderWidth: borderWidth,
            activeGradientColors: activeGradientColors,
          ),
        ),
        if (active)
          ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                colors: activeGradientColors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(bounds);
            },
            blendMode: BlendMode.srcIn,
            child: Icon(
              Icons.check,
              size: size * 0.6,
              color: Colors.white, 
            ),
          ),
      ],
    );
  }
}

class GradientBorderPainter extends CustomPainter {
  final bool active;
  final double borderWidth;
  final List<Color> activeGradientColors;

  GradientBorderPainter({
    required this.active,
    required this.borderWidth,
    required this.activeGradientColors,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final rrect = RRect.fromRectAndRadius(rect, Radius.circular(8));

    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    paint.shader = LinearGradient(
      colors: activeGradientColors,
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ).createShader(rect);

    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(covariant GradientBorderPainter oldDelegate) {
    return active != oldDelegate.active ||
        borderWidth != oldDelegate.borderWidth ||
        activeGradientColors != oldDelegate.activeGradientColors;
  }
}
