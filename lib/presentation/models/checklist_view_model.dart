import 'package:checklist_app/presentation/models/checklist_item_view_model.dart';
import 'package:equatable/equatable.dart';

class ChecklistViewModel extends Equatable {
  final int id;
  final String name;
  final bool isCompleted;
  final DateTime? completedDate;
  final DateTime createdAt;
  final double completedPercentage;
  final List<ChecklistItemViewModel> items;

  const ChecklistViewModel({
    required this.name,
    required this.items,
    required this.completedDate,
    required this.createdAt,
    required this.completedPercentage,
    required this.id,
    required this.isCompleted,
  });

  ChecklistViewModel copyWith({
   String? name,
   DateTime? completedDate,
   DateTime? createdAt,
   double? completedPercentage,
   List<ChecklistItemViewModel>? items,
   int? id,
   bool? isCompleted,
  }
  ) {
    return ChecklistViewModel(
      isCompleted: isCompleted ?? this.isCompleted,
      name: name ?? this.name,
      items: items ?? this.items,
      completedDate: completedDate ?? this.completedDate,
      completedPercentage: completedPercentage ?? this.completedPercentage,
      createdAt: createdAt ?? this.createdAt,
      id: id ?? this.id,
    );
  }

  @override
  List<Object?> get props => [name, completedDate, completedPercentage, items, createdAt, id, isCompleted];
}
