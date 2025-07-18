import 'package:checklist_app/presentation/custom/custom_widgets.dart/gradient_text_widget.dart';
import 'package:checklist_app/theme/colors/checklist_color_theme.dart';
import 'package:flutter/material.dart';

class CustomDialogWidget extends StatelessWidget {
  final String title;
  final List<Widget>? actions;

  const CustomDialogWidget({super.key, required this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    final colors = ChecklistColorTheme.of(context);
 

    return Dialog(
      backgroundColor: colors.backgroundPrimary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: GradientTextWidget(text: title, onTap: () {},),
      ),
    );
  }
}
