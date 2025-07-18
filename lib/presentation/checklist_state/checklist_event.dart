
import 'package:checklist_app/presentation/models/checklist_item_view_model.dart';
import 'package:checklist_app/presentation/models/checklist_view_model.dart';

abstract class ChecklistEvent {}

class FetchChecklistEvent extends ChecklistEvent {
  FetchChecklistEvent();
}
class FetchArchiveChecklistEvent extends ChecklistEvent {
  FetchArchiveChecklistEvent();
}
class RemoveArchivedChecklistEvent extends ChecklistEvent {
  final int id;
  RemoveArchivedChecklistEvent({required this.id});
}
class RemoveAllArchivedChecklistEvent extends ChecklistEvent {
  RemoveAllArchivedChecklistEvent();
}

class AddActiveChecklistToArchive extends ChecklistEvent {
  final int id;
  AddActiveChecklistToArchive({required this.id});
}

class SaveChecklistEvent extends ChecklistEvent {
  final ChecklistViewModel checklist;
  SaveChecklistEvent({required this.checklist});
}

class UpdateCheckboxsEvent extends ChecklistEvent {
  final List<ChecklistItemViewModel> items;
  final int checklistId;
  UpdateCheckboxsEvent({required this.items, required this.checklistId});
}




