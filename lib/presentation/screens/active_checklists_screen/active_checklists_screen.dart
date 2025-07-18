import 'package:auto_route/auto_route.dart';
import 'package:checklist_app/presentation/checklist_state/checklist_bloc.dart';
import 'package:checklist_app/presentation/checklist_state/checklist_event.dart';
import 'package:checklist_app/presentation/checklist_state/checklist_state.dart';
import 'package:checklist_app/presentation/custom/custom_widgets.dart/custom_error_widget.dart';
import 'package:checklist_app/presentation/custom/custom_widgets.dart/custom_loading_widget.dart';
import 'package:checklist_app/presentation/custom/custom_widgets.dart/empty_content_widget.dart';
import 'package:checklist_app/presentation/custom/custom_widgets.dart/gradient_line.dart';
import 'package:checklist_app/presentation/custom/enums/load_state.dart';
import 'package:checklist_app/presentation/router/app_router.gr.dart';
import 'package:checklist_app/presentation/custom/custom_widgets.dart/custom_button.dart';
import 'package:checklist_app/presentation/screens/active_checklists_screen/widgets/checklist_card.dart';
import 'package:checklist_app/theme/colors/checklist_color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ActiveChecklistsScreen extends StatefulWidget {
  const ActiveChecklistsScreen({super.key});

  @override
  State<ActiveChecklistsScreen> createState() => _ActiveChecklistsScreenState();
}

class _ActiveChecklistsScreenState extends State<ActiveChecklistsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ChecklistBloc>().add(FetchChecklistEvent());
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
        title: Text('Active Checklists', style: TextStyle(color: colors.primary)),
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        backgroundColor: colors.backgroundPrimary,
        actions: [Image.asset('assets/images/sun.png')],
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
                    final activeChecklists = [...state.activeChecklists];
                    if (activeChecklists.isEmpty) {
                      return EmptyContentWidget(emptyText: 'Your active checklists are empty');
                    }
                    return Padding(
                      padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
                      child: ListView.builder(
                        itemCount: activeChecklists.length,
                        itemBuilder: (_, index) {
                          return ChecklistCard(
                            dateText: 'Created',
                            checklist: activeChecklists[index],
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomButton(
              onTap: () => context.router.push(CreateNewChecklistRoute(isForCustomTemplate: false)),
              name: 'New\nChecklist',
              height: 62,
            ),
            CustomButton(
              height: 62,
              onTap: () {
                context.router.push(ArchiveChecklistRoute());
              },
              name: 'Archive',
            ),
            CustomButton(
              onTap: () => context.router.push(ChecklistTemplatesRoute()),
              name: 'Templates',
              height: 62,
            ),
            CustomButton(onTap: () {}, name: 'Settings', height: 62),
          ],
        ),
      ),
    );
  }
}
