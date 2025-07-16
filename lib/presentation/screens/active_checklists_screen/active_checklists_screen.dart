import 'package:auto_route/auto_route.dart';
import 'package:checklist_app/theme/colors/checklist_color_theme.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ActiveChecklistsScreen extends StatelessWidget {
  const ActiveChecklistsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = ChecklistColorTheme.of(context);

    return Scaffold(
      backgroundColor: colors.backgroundPrimary,
      appBar: AppBar(
        centerTitle: true,
        leading: Image.asset('assets/images/app_bar_arrow_back.png'),
        title: Text('Active Checklists', style: TextStyle(color: colors.primary)),
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        backgroundColor: colors.backgroundPrimary,
        actions: [
          Image.asset('assets/images/sun.png'),
        ],
      ),
    );
  }
}
