import 'package:checklist_app/presentation/custom/enums/load_state.dart';
import 'package:checklist_app/presentation/models/checklist_view_model.dart';
import 'package:equatable/equatable.dart';

class ChecklistState extends Equatable {
  final List<ChecklistViewModel> activeChecklists;
  final List<ChecklistViewModel> archivedChecklists;
  final LoadState loadState;
  final String errorMsg;
  const ChecklistState({
    required this.activeChecklists,
    required this.archivedChecklists,
    required this.loadState,
    required this.errorMsg,
  });

  ChecklistState copyWith(
    {
    List<ChecklistViewModel>? activeChecklists,
    List<ChecklistViewModel>? archivedChecklists,
    LoadState? loadState,
    String? errorMsg,
    }
  ) {
    return ChecklistState(

      activeChecklists: activeChecklists ?? this.activeChecklists,
      archivedChecklists: archivedChecklists ?? this.archivedChecklists,
      loadState: loadState ?? this.loadState,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }

  @override
  List<Object> get props => [activeChecklists, archivedChecklists, loadState, errorMsg];
}
