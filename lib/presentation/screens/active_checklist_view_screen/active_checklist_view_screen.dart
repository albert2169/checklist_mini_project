import 'package:auto_route/auto_route.dart';
import 'package:checklist_app/presentation/checklist_state/checklist_bloc.dart';
import 'package:checklist_app/presentation/checklist_state/checklist_event.dart';
import 'package:checklist_app/presentation/custom/custom_widgets.dart/gradient_line.dart';
import 'package:checklist_app/presentation/models/checklist_item_view_model.dart';
import 'package:checklist_app/presentation/models/checklist_view_model.dart';
import 'package:checklist_app/presentation/custom/custom_widgets.dart/custom_button.dart';
import 'package:checklist_app/presentation/screens/active_checklist_view_screen/widgets/checklist_item_card.dart';
import 'package:checklist_app/theme/colors/checklist_color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ActiveChecklistViewScreen extends StatefulWidget {
  final ChecklistViewModel checklist;
  const ActiveChecklistViewScreen({super.key, required this.checklist});

  @override
  State<ActiveChecklistViewScreen> createState() => _ActiveChecklistViewScreen();
}

class _ActiveChecklistViewScreen extends State<ActiveChecklistViewScreen> {
  List<ChecklistItemViewModel> _items = [];
  @override
  void initState() {
    super.initState();
    _items = [...widget.checklist.items];
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
        title: Text(widget.checklist.name, style: TextStyle(color: colors.primary)),
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        backgroundColor: colors.backgroundPrimary,
        actions: [Image.asset('assets/images/sun.png')],
      ),
      body:  Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (_, index) {
                  return ChecklistItemCard(onChecked: (isChecked) {
                    setState(() {
                        _items[index] = _items[index].copyWith(isCompleted: isChecked);
                    });
                  }, item: _items[index]);
                },
              ),
            ),
          ),
          GradientLine(lineWidth: double.infinity),
        ],
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
                    'Clear',
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
                      context.read<ChecklistBloc>().add(UpdateCheckboxsEvent(items: _items, checklistId: widget.checklist.id));
                  },
                  height: 43,
                ),
              ),
            ],
          ),
        ),
    );
  }
}
