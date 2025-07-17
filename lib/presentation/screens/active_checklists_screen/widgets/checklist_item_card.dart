import 'package:checklist_app/presentation/checklist_state/checklist_bloc.dart';
import 'package:checklist_app/presentation/checklist_state/checklist_event.dart';
import 'package:checklist_app/presentation/custom/custom_widgets.dart/active_inactive_rectangle.dart';
import 'package:checklist_app/presentation/custom/custom_widgets.dart/skip_text_widget.dart';
import 'package:checklist_app/presentation/models/checklist_view_model.dart';
import 'package:checklist_app/presentation/screens/active_checklists_screen/widgets/created_date_and_percentage.dart';
import 'package:checklist_app/presentation/screens/active_checklists_screen/widgets/gradient_border.dart';
import 'package:checklist_app/theme/colors/checklist_color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChecklistItemCard extends StatelessWidget {
  final ChecklistViewModel checklist;
  final Function(int) onCardTap;

  const ChecklistItemCard({super.key, required this.checklist, required this.onCardTap});

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
              height: 74,
              padding: const EdgeInsets.all(16),
              child: GestureDetector(
                onTap: () => onCardTap(checklist.id),
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
                             !checklist.isCompleted ?  Row(
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
                                ) : const SizedBox.shrink(),
                              ],
                            ),
                            const SizedBox(height: 5),

                            SizedBox(
                              width: 220,
                              child: CreatedDateAndPercentage(
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
          ),
        ],
      ),
    );
  }
}
