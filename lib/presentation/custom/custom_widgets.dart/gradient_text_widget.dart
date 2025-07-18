import 'package:flutter/material.dart';

class GradientTextWidget extends StatelessWidget {
  final Function onTap;
  final String text;
  const GradientTextWidget({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          return LinearGradient(
            colors: [
              Color(0xFFE8D228),
              Color(0xFF822D16),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight, 
          ).createShader(bounds);
        },
        blendMode: BlendMode.srcIn,
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 15, 
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
