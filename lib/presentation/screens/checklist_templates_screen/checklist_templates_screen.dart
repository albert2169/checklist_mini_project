import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:checklist_app/presentation/checklist_state/checklist_bloc.dart';
import 'package:checklist_app/presentation/checklist_state/checklist_event.dart';
import 'package:checklist_app/presentation/checklist_state/checklist_state.dart';
import 'package:checklist_app/presentation/custom/custom_widgets.dart/custom_button.dart';
import 'package:checklist_app/presentation/custom/custom_widgets.dart/custom_dialog_widget.dart';
import 'package:checklist_app/presentation/custom/custom_widgets.dart/custom_error_widget.dart';
import 'package:checklist_app/presentation/custom/custom_widgets.dart/custom_loading_widget.dart';
import 'package:checklist_app/presentation/custom/custom_widgets.dart/gradient_line.dart';
import 'package:checklist_app/presentation/custom/enums/load_state.dart';
import 'package:checklist_app/presentation/router/app_router.gr.dart';
import 'package:checklist_app/presentation/screens/checklist_templates_screen/widgets/checklist_template_item_card.dart';
import 'package:checklist_app/presentation/screens/create_new_checklist_screen/widgets/add_checklist_name_text_field.dart';
import 'package:checklist_app/theme/colors/checklist_color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ChecklistTemplatesScreen extends StatefulWidget {
  final String? hintText;
  const ChecklistTemplatesScreen({super.key, this.hintText});

  @override
  State<ChecklistTemplatesScreen> createState() => _ChecklistTemplatesScreenState();
}

class _ChecklistTemplatesScreenState extends State<ChecklistTemplatesScreen> {
  final _checkListTamleteSearchTextEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<ChecklistBloc>().add(FetchChecklistTemplatesEvent());
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
          title: Text('Templates', style: TextStyle(color: colors.primary)),
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          backgroundColor: colors.backgroundPrimary,
        ),
        body: BlocBuilder<ChecklistBloc, ChecklistState>(
          builder: (context, state) {
            switch (state.loadState) {
              case LoadState.loading:
                return CustomLoadingWidget();
              case LoadState.error:
                return CustomErrorWidget(errorMsg: state.errorMsg);
              case LoadState.loaded:
                return Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AddChecklistNameTextField(
                        controller: _checkListTamleteSearchTextEditingController,
                        hintTexts: 'Search templates...',
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        child: ListView(
                          children: [
                            for (final checklist in state.templates)
                              ChecklistTemplateItemCard(checklist: checklist),
                          ],
                        ),
                      ),
                      GradientLine(lineWidth: double.infinity),
                    ],
                  ),
                );
            }
          },
        ),
        bottomNavigationBar: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 17),
          child: SizedBox(
            width: 163,
            child: CustomButton(
              name: 'Create Custom',
              onTap: () => context.router.push(CreateNewChecklistRoute(isForCustomTemplate: true)),
              height: 43,
            ),
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
