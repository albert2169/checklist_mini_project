import 'package:checklist_app/presentation/checklist_state/checklist_bloc.dart';
import 'package:checklist_app/presentation/checklist_state/checklist_event.dart';
import 'package:checklist_app/presentation/models/checklist_view_model.dart';
import 'package:checklist_app/presentation/screens/active_checklists_screen/widgets/gradient_border.dart';
import 'package:checklist_app/theme/colors/checklist_color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ArchiveChecklistItemCard extends StatelessWidget {
  final ChecklistViewModel checklist;
  final Function(int) onCardTap;

  const ArchiveChecklistItemCard({super.key, required this.checklist, required this.onCardTap});

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
    final formattedDate = DateFormat('dd/MM/yyyy').format(checklist.createdAt);

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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              checklist.name,
                              style: TextStyle(
                                color: colors.primary,
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Created: $formattedDate,  ${checklist.completedPercentage.round().toString()}%',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: colors.secondary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () => context.read<ChecklistBloc>().add(RemoveArchivedChecklistEvent(id: checklist.id)),
                      child: Image.asset('assets/images/bin.png')),
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
