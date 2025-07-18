import 'package:checklist_app/presentation/custom/custom_widgets.dart/active_inactive_rectangle.dart';
import 'package:checklist_app/presentation/models/checklist_item_view_model.dart';
import 'package:checklist_app/presentation/screens/active_checklists_screen/widgets/gradient_border.dart';
import 'package:checklist_app/theme/colors/checklist_color_theme.dart';
import 'package:flutter/material.dart';

class ChecklistItemCard extends StatelessWidget {
  final ChecklistItemViewModel item;
  final Function(bool) onChecked;

  const ChecklistItemCard({super.key, required this.item, required this.onChecked});

  @override
  Widget build(BuildContext context) {
    final colors = ChecklistColorTheme.of(context);
    const borderWidth = 2.0;
    const gradientColors = [
      Color(0xFFE8D228),
      Color(0xFF822D16),
      Color(0xFFE8D228),
      Color(0xFF822D16),
    ];

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: CustomPaint(
        painter: GradientBorderCardPainter(
          borderWidth: borderWidth,
          gradientColors: gradientColors,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => onChecked(!item.isCompleted),
                child: ActiveInactiveRectangle(active: item.isCompleted),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Text(
                  item.name,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                  style: TextStyle(
                    color: colors.primary,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
