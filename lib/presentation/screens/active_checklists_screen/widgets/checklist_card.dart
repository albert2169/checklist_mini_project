import 'package:auto_route/auto_route.dart';
import 'package:checklist_app/presentation/checklist_state/checklist_bloc.dart';
import 'package:checklist_app/presentation/checklist_state/checklist_event.dart';
import 'package:checklist_app/presentation/custom/custom_widgets.dart/active_inactive_rectangle.dart';
import 'package:checklist_app/presentation/custom/custom_widgets.dart/gradient_text_widget.dart';
import 'package:checklist_app/presentation/models/checklist_view_model.dart';
import 'package:checklist_app/presentation/router/app_router.gr.dart';
import 'package:checklist_app/presentation/screens/active_checklists_screen/widgets/created_date_and_percentage.dart';
import 'package:checklist_app/presentation/screens/active_checklists_screen/widgets/gradient_border.dart';
import 'package:checklist_app/theme/colors/checklist_color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChecklistCard extends StatelessWidget {
  final ChecklistViewModel checklist;
  final String dateText;

  const ChecklistCard({super.key, required this.checklist, required this.dateText});

  @override
  Widget build(BuildContext context) {
    final colors = ChecklistColorTheme.of(context);

    const borderWidth = 2.0;
    const borderRadius = 12.0;
    const cardHeight = 74.0;
    const gradientColors = [
      Color(0xFFE8D228),
      Color(0xFF822D16),
      Color(0xFFE8D228),
      Color(0xFF822D16),
    ];

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: SizedBox(
        height: cardHeight + borderWidth * 2, 
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
              child: GestureDetector(
                onTap: () => context.router.push(ActiveChecklistViewRoute(checklist: checklist)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ActiveInactiveRectangle(active: checklist.isCompleted),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  checklist.name,
                                  style: TextStyle(
                                    color: colors.primary,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                  ),
                                ),
                                checklist.isCompleted
                                    ? Row(
                                        children: [
                                          const SizedBox(width: 15),
                                          GradientTextWidget(
                                            onTap: () {
                                              context.read<ChecklistBloc>().add(
                                                AddActiveChecklistToArchive(id: checklist.id),
                                              );
                                            },
                                            text: 'Archive',
                                          ),
                                        ],
                                      )
                                    : const SizedBox.shrink(),
                              ],
                            ),
                            const SizedBox(height: 5),
                            SizedBox(
                              width: 220,
                              child: CreatedDateAndPercentage(
                                dateText: dateText,
                                createdAt: checklist.createdAt,
                                percentagePassed: checklist.completedPercentage,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Image.asset('assets/images/arrow_forward.png'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
