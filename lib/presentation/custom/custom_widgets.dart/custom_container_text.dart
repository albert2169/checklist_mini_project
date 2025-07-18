import 'package:checklist_app/presentation/custom/custom_widgets.dart/custom_button.dart';
import 'package:checklist_app/presentation/screens/active_checklists_screen/widgets/gradient_border.dart';
import 'package:checklist_app/theme/colors/checklist_color_theme.dart';
import 'package:flutter/material.dart';

class CustomContainerText extends StatelessWidget {
  final String text;
  final double height;
  final TextStyle textStyle;
  final Function()? onTap;
  final bool isActive;
  const CustomContainerText({
    super.key,
    required this.text,
    required this.height,
    required this.textStyle,
     this.onTap,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    const borderWidth = 2.0;
    const gradientColors = [
      Color(0xFFE8D228),
      Color(0xFF822D16),
      Color(0xFFE8D228),
      Color(0xFF822D16),
    ];
    final colors = ChecklistColorTheme.of(context);
    if (isActive) {
      return CustomButton(name: text, onTap: onTap, height: height);
    }
    return GestureDetector(
      onTap:  onTap,
      child: SizedBox(
        height: height,
        child: Stack(
          children: [
            Positioned.fill(
              child: CustomPaint(
                painter: GradientBorderCardPainter(
                  borderWidth: borderWidth,
                  gradientColors: gradientColors,
                ),
              ),
            ),
      
            Container(
              margin: const EdgeInsets.all(borderWidth),
              decoration: BoxDecoration(
                color: colors.backgroundSecondary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(child: Text(text, style: textStyle)),
            ),
          ],
        ),
      ),
    );
  }
}
