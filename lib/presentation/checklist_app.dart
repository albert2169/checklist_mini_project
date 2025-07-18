import 'package:checklist_app/presentation/checklist_state/checklist_bloc.dart';
import 'package:checklist_app/presentation/router/app_router.dart';
import 'package:checklist_app/theme/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class ChecklistApp extends StatelessWidget {
  final _appRouter = AppRouter();

  ChecklistApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ChecklistThemeProvider>(context);

    return BlocProvider(
      create: (context) => ChecklistBloc(),
      child: MaterialApp.router(
        routerConfig: _appRouter.config(),
        title: 'Checklist',
        theme: ThemeData(
          brightness: themeProvider.isDarkMode ? Brightness.dark : Brightness.light,
          extensions: <ThemeExtension<dynamic>>[themeProvider.theme],
        ),
      ),
    );
  }
}
