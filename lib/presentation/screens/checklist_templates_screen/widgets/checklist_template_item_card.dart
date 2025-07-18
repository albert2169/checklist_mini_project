import 'package:auto_route/auto_route.dart';
import 'package:checklist_app/presentation/checklist_state/checklist_bloc.dart';
import 'package:checklist_app/presentation/checklist_state/checklist_event.dart';
import 'package:checklist_app/presentation/custom/custom_widgets.dart/custom_button.dart';
import 'package:checklist_app/presentation/models/checklist_view_model.dart';
import 'package:checklist_app/presentation/screens/active_checklists_screen/widgets/gradient_border.dart';
import 'package:checklist_app/theme/colors/checklist_color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChecklistTemplateItemCard extends StatelessWidget {
  final ChecklistViewModel checklist;
  const ChecklistTemplateItemCard({super.key, required this.checklist});

  @override
  Widget build(BuildContext context) {
    final name = checklist.name;
    final items = checklist.items.map((item) => item.name).toList();
    final itemsNameRow = items.join(', ');
    final colors = ChecklistColorTheme.of(context);

    const borderWidth = 2.0;
    const borderRadius = 15.0;
    const gradientColors = [
      Color(0xFFE8D228),
      Color(0xFF822D16),
      Color(0xFFE8D228),
      Color(0xFF822D16),
    ];

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: SizedBox(
        height: 200 + borderWidth * 2,
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
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 46,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 13),
                      child: Text(
                        name,
                        style: TextStyle(
                          color: colors.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 46,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 13),
                      child: Text(
                        itemsNameRow,
                        style: TextStyle(
                          color: colors.primary,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  CustomButton(
                    name: 'Use Template',
                    onTap: () {
                      context.read<ChecklistBloc>().add(
                        MakeTemplateChecklistEvent(checklist: checklist),
                      );
                      context.router.pop();
                    },
                    height: 40,
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
