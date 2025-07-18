import 'package:checklist_app/presentation/models/checklist_item_view_model.dart';
import 'package:checklist_app/presentation/screens/active_checklists_screen/widgets/gradient_border.dart';
import 'package:checklist_app/theme/colors/checklist_color_theme.dart';
import 'package:flutter/material.dart';

class ChecklistItem extends StatelessWidget {
  final TextEditingController controller;
  final ChecklistItemViewModel? item;
  final Function()? onRemove;

  const ChecklistItem({super.key, required this.controller, this.item, this.onRemove});

  @override
  Widget build(BuildContext context) {
    final colors = ChecklistColorTheme.of(context);
    const borderWidth = 2.0;
    const borderRadius = 12.0; // adjust as needed
    const gradientColors = [
      Color(0xFFE8D228),
      Color(0xFF822D16),
      Color(0xFFE8D228),
      Color(0xFF822D16),
    ];

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: SizedBox(
        height: 45 + borderWidth * 2,
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
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: colors.backgroundSecondary,
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              alignment: Alignment.center,
              child: Row(
                children: [
                  Image.asset('assets/images/dots.png', height: 20, width: 20),
                  const SizedBox(width: 8),
                  item == null
                      ? Expanded(
                          child: TextField(
                            controller: controller,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                color: colors.secondary,
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                              ),
                              border: InputBorder.none,
                              isCollapsed: true,
                              hintText: 'New item',
                            ),
                            style: TextStyle(
                              color: colors.primary,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        )
                      : Expanded(
                          child: Text(
                            item!.name,
                            style: TextStyle(
                              color: colors.primary,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Row(
                      children: [
                        Image.asset('assets/images/check_mark.png', height: 20, width: 20),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: () => onRemove?.call(),
                          child: Image.asset('assets/images/bin.png', height: 20, width: 20),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
