import 'package:auto_route/auto_route.dart';
import 'package:checklist_app/presentation/checklist_state/checklist_bloc.dart';
import 'package:checklist_app/presentation/checklist_state/checklist_event.dart';
import 'package:checklist_app/presentation/custom/custom_widgets.dart/custom_button.dart';
import 'package:checklist_app/presentation/custom/custom_widgets.dart/gradient_line.dart';
import 'package:checklist_app/presentation/models/checklist_item_view_model.dart';
import 'package:checklist_app/presentation/models/checklist_view_model.dart';
import 'package:checklist_app/presentation/screens/create_new_checklist_screen/widgets/add_checklist_name_text_field.dart';
import 'package:checklist_app/presentation/screens/create_new_checklist_screen/widgets/checklist_item_text_field.dart';
import 'package:checklist_app/theme/colors/checklist_color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class CreateNewChecklistScreen extends StatefulWidget {
  const CreateNewChecklistScreen({super.key});

  @override
  State<CreateNewChecklistScreen> createState() => _CreateNewChecklistScreenState();
}

class _CreateNewChecklistScreenState extends State<CreateNewChecklistScreen> {
  final _checkListNameTextEditingController = TextEditingController();
  final _checklistItemTextEditingController = TextEditingController();
  List<ChecklistItemViewModel> _checklistItems = [];

  @override
  void initState() {
    super.initState();
    _checklistItems.add(ChecklistItemViewModel(name: 'name', isCompleted: false));
  }

  @override
  Widget build(BuildContext context) {
    final colors = ChecklistColorTheme.of(context);

    return GestureDetector(
      behavior: HitTestBehavior.translucent,

      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: colors.backgroundPrimary,

        appBar: AppBar(
          centerTitle: true,
          leading: GestureDetector(
            onTap: () => context.router.pop(),
            child: Image.asset('assets/images/app_bar_arrow_back.png'),
          ),
          title: Text('Create New Checklist', style: TextStyle(color: colors.primary)),
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          backgroundColor: colors.backgroundPrimary,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Checklist Name',
                style: TextStyle(color: colors.primary, fontSize: 15, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              AddChecklistNameTextField(controller: _checkListNameTextEditingController),
              const SizedBox(height: 16),
              CustomButton(
                name: 'Add Item',
                onTap: () {
                  setState(() {
                    _checklistItems.insert(
                      _checklistItems.length - 1,
                      ChecklistItemViewModel(
                        name: _checklistItemTextEditingController.text,
                        isCompleted: false,
                      ),
                    );
                    _checklistItemTextEditingController.clear();
                  });
                },
                height: 43,
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView(
                  children: [
                    for (int i = 0; i < _checklistItems.length; ++i)
                      if (i == _checklistItems.length - 1)
                        ChecklistItem(controller: _checklistItemTextEditingController)
                      else
                        ChecklistItem(
                          onRemove: () {
                            setState(() {
                              _checklistItems.removeAt(i);
                            });
                          },
                          controller: _checklistItemTextEditingController,
                          item: _checklistItems[i],
                        ),
                  ],
                ),
              ),
              GradientLine(lineWidth: double.infinity),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 17),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 163,
                height: 43,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 56, vertical: 12),
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      color: colors.secondary,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 163,
                child: CustomButton(
                  name: 'Save',
                  onTap: () {
                    context.read<ChecklistBloc>().add(
                      SaveChecklistEvent(
                        checklist: ChecklistViewModel(
                          name: _checklistItemTextEditingController.text,
                          items: _checklistItems,
                          completedDate: null,
                          createdAt: DateTime.now(),
                          completedPercentage: 0,
                          id: 0,
                          isCompleted: false,
                        ),
                      ),
                    );
                    _checkListNameTextEditingController.clear();
                    _checklistItemTextEditingController.clear();
                    setState(() {
                      _checklistItems = [];
                    });
                  },
                  height: 43,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
