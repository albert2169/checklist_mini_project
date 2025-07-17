import 'package:checklist_app/theme/colors/checklist_color_theme.dart';
import 'package:flutter/material.dart';

class EmptyContentWidget extends StatelessWidget {
  final String emptyText;
  const EmptyContentWidget({super.key, required this.emptyText});

  @override
  Widget build(BuildContext context) {
    final colors = ChecklistColorTheme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          emptyText,
          textAlign: TextAlign.center,
          style: TextStyle(color: colors.primary, fontSize: 28, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
