import 'package:checklist_app/presentation/checklist_state/checklist_bloc.dart';
import 'package:checklist_app/presentation/router/app_router.dart';
import 'package:checklist_app/theme/checklist_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChecklistApp extends StatelessWidget {
  final _appRouter = AppRouter();

  ChecklistApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChecklistBloc(),
      child: MaterialApp.router(
        routerConfig: _appRouter.config(),
        title: 'Checklist',
        theme: ChecklistTheme.get(Brightness.light),
      ),
    );
  }
}
