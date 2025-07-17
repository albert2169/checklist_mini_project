import 'package:checklist_app/mocked_data.dart';
import 'package:checklist_app/presentation/checklist_state/checklist_event.dart';
import 'package:checklist_app/presentation/checklist_state/checklist_state.dart';
import 'package:checklist_app/presentation/custom/enums/load_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChecklistBloc extends Bloc<ChecklistEvent, ChecklistState> {
  ChecklistBloc()
    : super(
        ChecklistState(
          activeChecklists: initialChecklists,
          archivedChecklists: [],
          loadState: LoadState.loading,
          errorMsg: '',
        ),
      ) {
    on<FetchChecklistEvent>(_handleFetchChecklistEvent);
    on<FetchArchiveChecklistEvent>(_handleFetchArchiveChecklistEvent);
    on<RemoveArchivedChecklistEvent>(_handleRemoveArchivedChecklistEvent);
    on<RemoveAllArchivedChecklistEvent>(_handleRemoveAllArchivedChecklistEvent);
    on<AddActiveChecklistToArchive>(_handleAddActiveChecklistToArchive);
    on<SaveChecklistEvent>(_handleSaveChecklistEvent);
  }

  void _handleFetchChecklistEvent(FetchChecklistEvent event, Emitter<ChecklistState> emit) async {
    emit(state.copyWith(loadState: LoadState.loading));
    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(activeChecklists: state.activeChecklists, loadState: LoadState.loaded));
  }

  void _handleFetchArchiveChecklistEvent(
    FetchArchiveChecklistEvent event,
    Emitter<ChecklistState> emit,
  ) async {
    emit(state.copyWith(loadState: LoadState.loading));
    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(activeChecklists: state.activeChecklists, loadState: LoadState.loaded));
  }

  void _handleRemoveArchivedChecklistEvent(
    RemoveArchivedChecklistEvent event,
    Emitter<ChecklistState> emit,
  ) async {
    final archivedChecklists = [...state.archivedChecklists];
    archivedChecklists.removeWhere((checklist) => checklist.id == event.id);
    emit(state.copyWith(archivedChecklists: archivedChecklists));
  }

  void _handleRemoveAllArchivedChecklistEvent(
    RemoveAllArchivedChecklistEvent event,
    Emitter<ChecklistState> emit,
  ) async {
    emit(state.copyWith(archivedChecklists: []));
  }

  void _handleAddActiveChecklistToArchive(
    AddActiveChecklistToArchive event,
    Emitter<ChecklistState> emit,
  ) async {
    final activeChecklists = [...state.activeChecklists];
    final archivedChecklists = [...state.archivedChecklists];
    final checklistToBeRemoved = activeChecklists
        .where((checklist) => checklist.id == event.id)
        .first;
    activeChecklists.removeWhere((checklist) => checklist.id == event.id);
    archivedChecklists.add(checklistToBeRemoved);
    emit(
      state.copyWith(activeChecklists: activeChecklists, archivedChecklists: archivedChecklists),
    );
  }

  void _handleSaveChecklistEvent(SaveChecklistEvent event, Emitter<ChecklistState> emit) async {
    final activeChecklists = [...state.activeChecklists];
    final ids = activeChecklists.map((checklist) => checklist.id).toList();
    ids.addAll(state.activeChecklists.map((checklist) => checklist.id).toList().toList());

    final newChecklist = event.checklist.copyWith(id: _getNextAvailableId(ids));
    activeChecklists.insert(0, newChecklist);
    emit(state.copyWith(activeChecklists: activeChecklists));


  }

  int _getNextAvailableId(List<int> ids) {
    final sorted = ids.toSet().toList()..sort();
    for (int i = 0; i < sorted.length; i++) {
      if (sorted[i] != i + 1) {
        return i + 1;
      }
    }
    return sorted.isEmpty ? 1 : sorted.last + 1;
  }
}
