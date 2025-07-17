import 'package:checklist_app/presentation/screens/active_checklists_screen/widgets/gradient_border.dart';
import 'package:checklist_app/theme/colors/checklist_color_theme.dart';
import 'package:flutter/material.dart';

class AddChecklistNameTextField extends StatelessWidget {
  final TextEditingController controller;

  const AddChecklistNameTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final colors = ChecklistColorTheme.of(context);
    const borderWidth = 0.5;
    const gradientColors = [
      Color(0xFFE8D228),
      Color(0xFF822D16),
      Color(0xFFE8D228),
      Color(0xFF822D16),
    ];

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Stack(
        children: [
          CustomPaint(
            painter: GradientBorderCardPainter(
              borderWidth: borderWidth,
              gradientColors: gradientColors,
            ),
            child: Container(
              height: 45,
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(isCollapsed: true, border: InputBorder.none),
                style: TextStyle(color: colors.primary, fontSize: 15, fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
