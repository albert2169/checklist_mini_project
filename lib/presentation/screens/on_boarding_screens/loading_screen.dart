import 'package:auto_route/auto_route.dart';
import 'package:checklist_app/presentation/router/app_router.gr.dart';
import 'package:checklist_app/theme/colors/checklist_color_theme.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = ChecklistColorTheme.of(context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 2), () {
        if (context.mounted) {
          context.router.replace(OnboardingTabsRoute()); 
        }
      });
    });

    return SafeArea(
      child: Scaffold(
        backgroundColor: colors.backgroundPrimary, 
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 150,
                height: 150,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'assets/images/loading_screen.png',
                      width: 130,
                      height: 130,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.check_box_outlined, size: 130, color: Colors.white);
                      },
                    ),
                    Image.asset('assets/images/loading_border.png', width: 150, height: 150),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
