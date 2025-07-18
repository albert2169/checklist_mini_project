import 'package:checklist_app/presentation/screens/active_checklists_screen/widgets/gradient_border.dart';
import 'package:checklist_app/theme/colors/checklist_color_theme.dart';
import 'package:flutter/material.dart';

class AddChecklistNameTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintTexts;
  const AddChecklistNameTextField({
    super.key,
    required this.controller,
    this.hintTexts,
  });

  @override
  Widget build(BuildContext context) {
    final colors = ChecklistColorTheme.of(context);
    const borderWidth = 2.0;
    const borderRadius = 12.0;
    const gradientColors = [
      Color(0xFFE8D228),
      Color(0xFF822D16),
      Color(0xFFE8D228),
      Color(0xFF822D16),
    ];

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: SizedBox(
        height: 50 + borderWidth * 2,
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
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Center(
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                      color: colors.secondary,
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                    hintText: hintTexts,
                    border: InputBorder.none,
                    isCollapsed: true,
                  ),
                  style: TextStyle(
                    color: colors.primary,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
