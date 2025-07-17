import 'package:checklist_app/theme/colors/checklist_color_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreatedDateAndPercentage extends StatelessWidget {
  final DateTime createdAt;
  final double percentagePassed;

  const CreatedDateAndPercentage({
    super.key,
    required this.createdAt,
    required this.percentagePassed,
  });

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('dd/MM/yyyy').format(createdAt);
    final gradientColors = [Color(0xFFE8D228), Color(0xFF822D16), Color(0xFFE8D228), Color(0xFF822D16)];
    final colors = ChecklistColorTheme.of(context);

return Row(
  children: [
    Text(
      'Created: $formattedDate',
      style:  TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: colors.secondary
      ),
    ),
    const SizedBox(width: 12),
    Expanded( 
      child: LayoutBuilder(
        builder: (context, constraints) {
          final fullWidth = constraints.maxWidth;
          final clampedPercentage = (percentagePassed / 100).clamp(0.0, 1.0);
          final lineWidth = fullWidth * clampedPercentage;

          if (clampedPercentage == 0) {
            return const SizedBox.shrink(); 
          }

          return Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: lineWidth,
              height: 4,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: gradientColors,
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          );
        },
      ),
    ),
  ],
);  }
}
