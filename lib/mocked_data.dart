import 'package:checklist_app/presentation/models/checklist_view_model.dart';

final initialChecklists = [
  ChecklistViewModel(
    isCompleted: false,
    id: 1,
    name: 'Shopping List',
    items: [],
    completedDate: null,
    completedPercentage: 0,
    createdAt: DateTime.now(),
  ),
  ChecklistViewModel(
    isCompleted: false,
    id: 2,
    name: 'Travel Prep',
    items: [],
    completedDate: null,
    completedPercentage: 0,
    createdAt: DateTime.now(),
  ),
  ChecklistViewModel(
    isCompleted: false,

    id: 3,
    name: 'Daily Tasks',
    items: [],
    completedDate: null,
    completedPercentage: 0,
    createdAt: DateTime.now(),
  ),
];
