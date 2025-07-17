import 'package:auto_route/auto_route.dart';
import 'package:checklist_app/presentation/checklist_state/checklist_bloc.dart';
import 'package:checklist_app/presentation/checklist_state/checklist_event.dart';
import 'package:checklist_app/presentation/checklist_state/checklist_state.dart';
import 'package:checklist_app/presentation/custom/custom_widgets.dart/custom_error_widget.dart';
import 'package:checklist_app/presentation/custom/custom_widgets.dart/custom_loading_widget.dart';
import 'package:checklist_app/presentation/custom/custom_widgets.dart/empty_content_widget.dart';
import 'package:checklist_app/presentation/custom/custom_widgets.dart/gradient_line.dart';
import 'package:checklist_app/presentation/custom/enums/load_state.dart';
import 'package:checklist_app/presentation/custom/custom_widgets.dart/custom_button.dart';
import 'package:checklist_app/presentation/screens/archive_checklist_screen/widgets/archive_checklist_item_card.dart';
import 'package:checklist_app/theme/colors/checklist_color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ArchiveChecklistScreen extends StatefulWidget {
  const ArchiveChecklistScreen({super.key});

  @override
  State<ArchiveChecklistScreen> createState() => _ArchiveChecklistScreenState();
}

class _ArchiveChecklistScreenState extends State<ArchiveChecklistScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ChecklistBloc>().add(FetchArchiveChecklistEvent());
  }

  @override
  Widget build(BuildContext context) {
    final colors = ChecklistColorTheme.of(context);

    return Scaffold(
      backgroundColor: colors.backgroundPrimary,
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => context.router.pop(),
          child: Image.asset('assets/images/app_bar_arrow_back.png'),
        ),
        title: Text('Archive', style: TextStyle(color: colors.primary)),
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        backgroundColor: colors.backgroundPrimary,
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChecklistBloc, ChecklistState>(
              builder: (_, state) {
                switch (state.loadState) {
                  case LoadState.loading:
                    return CustomLoadingWidget();
                  case LoadState.error:
                    return CustomErrorWidget(errorMsg: state.errorMsg);
                  case LoadState.loaded:
                    final archiveCheckllists = [...state.archivedChecklists];
                    if (archiveCheckllists.isEmpty) {
                      return EmptyContentWidget(emptyText: 'Your Archived checklists are empty');
                    }
                    return Padding(
                      padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
                      child: ListView.builder(
                        itemCount: archiveCheckllists.length,
                        itemBuilder: (_, index) {
                          return ArchiveChecklistItemCard(
                            checklist: archiveCheckllists[index],
                            onCardTap: (p0) {},
                          );
                        },
                      ),
                    );
                }
              },
            ),
          ),
          GradientLine(lineWidth: double.infinity),
        ],
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 17),
        child: CustomButton(name: 'Clear All', onTap: () => context.read<ChecklistBloc>().add(RemoveAllArchivedChecklistEvent()), height: 43),
      ),
    );
  }
}
