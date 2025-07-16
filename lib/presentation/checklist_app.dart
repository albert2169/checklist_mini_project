import 'package:checklist_app/presentation/router/app_router.dart';
import 'package:checklist_app/theme/checklist_theme.dart';
import 'package:flutter/material.dart';

class ChecklistApp extends StatelessWidget {
  final _appRouter = AppRouter();

   ChecklistApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        routerConfig: _appRouter.config(),
        title: 'Checklist',
        theme: ChecklistTheme.get(Brightness.light),
    );
  
  }
}