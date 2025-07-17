import 'package:equatable/equatable.dart';

class ChecklistItemViewModel extends Equatable {
  final String name;
  final bool isCompleted;
  const ChecklistItemViewModel({required this.name, required this.isCompleted});

  ChecklistItemViewModel copyWith(String? name, bool? isCompleted) {
    return ChecklistItemViewModel(
      name: name ?? this.name,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  List<Object?> get props => [name, isCompleted];
}
