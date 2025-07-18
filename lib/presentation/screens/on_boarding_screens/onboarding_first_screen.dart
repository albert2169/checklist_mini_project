import 'package:auto_route/auto_route.dart';
import 'package:checklist_app/theme/colors/checklist_color_theme.dart';
import 'package:flutter/material.dart';

@RoutePage()
class OnboardingFirstScreen extends StatelessWidget {
  const OnboardingFirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = ChecklistColorTheme.of(context);

    return Scaffold(
      backgroundColor: colors.backgroundPrimary,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 150),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Image.asset('assets/images/onboarding_1.png', width: 120, height: 120),
                  Text(
                    'Organize Your Tasks',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: colors.primary,
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16,),
                  Text(
                    'Create and manage checklists with ease',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: colors.primary,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
