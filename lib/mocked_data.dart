import 'package:checklist_app/presentation/models/checklist_item_view_model.dart';
import 'package:checklist_app/presentation/models/checklist_view_model.dart';

final initialChecklists = [
  ChecklistViewModel(
    isCompleted: false,
    id: 1,
    name: 'Shopping List',
    items: initialTemplatesItems[0],
    completedDate: null,
    completedPercentage: 0,
    createdAt: DateTime.now(),
  ),
  ChecklistViewModel(
    isCompleted: false,
    id: 2,
    name: 'Travel Prep',
    items: initialTemplatesItems[1],
    completedDate: null,
    completedPercentage: 0,
    createdAt: DateTime.now(),
  ),
  ChecklistViewModel(
    isCompleted: false,

    id: 3,
    name: 'Daily Tasks',
    items: initialTemplatesItems[2],
    completedDate: null,
    completedPercentage: 0,
    createdAt: DateTime.now(),
  ),
];

final initialChecklistTemplates = [
  ChecklistViewModel(
    isCompleted: false,
    id: 1,
    name: 'Shopping List',
    items: initialTemplatesItems[0],
    completedDate: null,
    completedPercentage: 0,
    createdAt: DateTime.now(),
  ),
  ChecklistViewModel(
    isCompleted: false,
    id: 2,
    name: 'Travel Prep',
    items: initialTemplatesItems[1],
    completedDate: null,
    completedPercentage: 0,
    createdAt: DateTime.now(),
  ),
  ChecklistViewModel(
    isCompleted: false,
    id: 3,
    name: 'Daily Tasks',
    items: initialTemplatesItems[2],
    completedDate: null,
    completedPercentage: 0,
    createdAt: DateTime.now(),
  ),
];

final initialTemplatesItems = [
  [
    ChecklistItemViewModel(isCompleted: false, name: 'Milk'),
    ChecklistItemViewModel(isCompleted: false, name: 'Bread'),
    ChecklistItemViewModel(isCompleted: false, name: 'Eggs'),
    ChecklistItemViewModel(isCompleted: false, name: 'Cheese'),
    ChecklistItemViewModel(isCompleted: false, name: 'Fruits'),
    ChecklistItemViewModel(isCompleted: false, name: 'Vegetables'),
  ],
  [
    ChecklistItemViewModel(isCompleted: false, name: 'Passport'),
    ChecklistItemViewModel(isCompleted: false, name: 'Tickets'),
    ChecklistItemViewModel(isCompleted: false, name: 'Clothes'),
    ChecklistItemViewModel(isCompleted: false, name: 'Toiletries'),
    ChecklistItemViewModel(isCompleted: false, name: 'Charger'),
    ChecklistItemViewModel(isCompleted: false, name: 'Map'),
  ],
  [
    ChecklistItemViewModel(isCompleted: false, name: 'Workout'),
    ChecklistItemViewModel(isCompleted: false, name: 'Read'),
    ChecklistItemViewModel(isCompleted: false, name: 'Meditate'),
    ChecklistItemViewModel(isCompleted: false, name: 'Work'),
    ChecklistItemViewModel(isCompleted: false, name: 'Cook Dinner'),
    ChecklistItemViewModel(isCompleted: false, name: 'Sleep'),
  ],
];
