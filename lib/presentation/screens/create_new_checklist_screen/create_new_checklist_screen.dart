import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:checklist_app/presentation/checklist_state/checklist_bloc.dart';
import 'package:checklist_app/presentation/checklist_state/checklist_event.dart';
import 'package:checklist_app/presentation/custom/custom_widgets.dart/custom_button.dart';
import 'package:checklist_app/presentation/custom/custom_widgets.dart/custom_dialog_widget.dart';
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
  final bool isForCustomTemplate;
  const CreateNewChecklistScreen({super.key, required this.isForCustomTemplate});

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
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: colors.backgroundPrimary,

        appBar: AppBar(
          centerTitle: true,
          leading: GestureDetector(
            onTap: () => context.router.pop(),
            child: Image.asset('assets/images/app_bar_arrow_back.png'),
          ),
          title: Text(
            widget.isForCustomTemplate ? 'Create Custom Template' : 'Create New Checklist',
            style: TextStyle(color: colors.primary),
          ),
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
                  if (_checklistItemTextEditingController.text.trim().isEmpty) {
                    _showDialog('Item name cannot be empty');

                    return;
                  }
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
                  child: GestureDetector(
                    onTap: () => context.router.pop(),
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
              ),
              SizedBox(
                width: 163,
                child: CustomButton(
                  name: 'Save',
                  onTap: () {
                    if (_checklistItems.length == 1) {
                      _showDialog('Checklist Items cannot be empty');
                      return;
                    }
                    if (_checkListNameTextEditingController.text.trim().isEmpty) {
                      _showDialog('Checklist Name cannot be empty');
                      return;
                    }
                    _checklistItems.removeLast();
                    if (widget.isForCustomTemplate) {
                      context.read<ChecklistBloc>().add(
                        CustomizeChecklistTemplateEvent(
                          checklist: ChecklistViewModel(
                            name: _checkListNameTextEditingController.text,
                            items: _checklistItems,
                            completedDate: null,
                            createdAt: DateTime.now(),
                            completedPercentage: 0,
                            id: 0,
                            isCompleted: false,
                          ),
                        ),
                      );
                      context.router.pop();
                      return;
                    }
                    context.read<ChecklistBloc>().add(
                      SaveChecklistEvent(
                        checklist: ChecklistViewModel(
                          name: _checkListNameTextEditingController.text,
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
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      Future.delayed(const Duration(seconds: 2), () {
                        if (context.mounted) {
                          _showDialog('Checklist Successfully Saved');
                        }
                      });
                    });
                    setState(() {
                      _checklistItems = [];
                      _checklistItems.add(ChecklistItemViewModel(name: 'name', isCompleted: false));
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

  void _showDialog(final String title) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Dialog",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.3),
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (context, anim1, anim2) {
        Future.delayed(const Duration(seconds: 2), () {
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).pop();
          }
        });

        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Material(
              type: MaterialType.transparency,
              child: Center(
                child: CustomDialogWidget(title: title, actions: []),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return FadeTransition(
          opacity: CurvedAnimation(parent: anim1, curve: Curves.easeOut),
          child: child,
        );
      },
    );
  }
}
