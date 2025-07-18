import 'package:checklist_app/presentation/checklist_app.dart';
import 'package:checklist_app/theme/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MaterialApp(home: ChangeNotifierProvider(
    create: (_) => ChecklistThemeProvider(),
    child: ChecklistApp())));
}
