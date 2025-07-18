import 'package:auto_route/auto_route.dart';
import 'package:checklist_app/presentation/custom/custom_widgets.dart/active_inactive_circule.dart';
import 'package:checklist_app/presentation/custom/custom_widgets.dart/gradient_text_widget.dart';
import 'package:checklist_app/presentation/router/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:checklist_app/theme/colors/checklist_color_theme.dart';
import 'onboarding_first_screen.dart';
import 'onboarding_second_screen.dart';

@RoutePage()
class OnboardingTabsScreen extends StatefulWidget {
  const OnboardingTabsScreen({super.key});

  @override
  State<OnboardingTabsScreen> createState() => _OnboardingTabsScreenState();
}

class _OnboardingTabsScreenState extends State<OnboardingTabsScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    _tabController.animation?.addListener(() {
      final newIndex = _tabController.animation!.value.round();
      if (newIndex != _currentIndex) {
        setState(() {
          _currentIndex = newIndex;
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = ChecklistColorTheme.of(context);
    final currentPage = _tabController.animation?.value ?? _tabController.index;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        backgroundColor: colors.backgroundPrimary,
        actions: [Padding(padding: const EdgeInsets.only(right: 24), child: GradientTextWidget(text: 'skip',
          onTap: () => context.router.replace(MainMenuRoute()),
        ))],
      ),
      backgroundColor: colors.backgroundPrimary,
      body: TabBarView(
        controller: _tabController,
        children: const [OnboardingFirstScreen(), OnboardingSecondScreen()],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ActiveInactiveCircle(active: currentPage < 0.5),
            const SizedBox(width: 8),
            ActiveInactiveCircle(active: currentPage >= 0.5),
          ],
        ),
      ),
    );
  }
}
