import 'package:auto_route/auto_route.dart';
import 'package:checklist_app/presentation/checklist_state/checklist_bloc.dart';
import 'package:checklist_app/presentation/checklist_state/checklist_event.dart';
import 'package:checklist_app/presentation/custom/custom_widgets.dart/custom_button.dart';
import 'package:checklist_app/presentation/custom/custom_widgets.dart/custom_container_text.dart';
import 'package:checklist_app/presentation/custom/custom_widgets.dart/gradient_line.dart';
import 'package:checklist_app/theme/colors/checklist_color_theme.dart';
import 'package:checklist_app/theme/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late bool _isDark;
  late bool _isInitialDark;
  @override
  void initState() {
    super.initState();

    // Safe access to context-dependent objects after first build
    _isDark = Provider.of<ChecklistThemeProvider>(context, listen: false).isDarkMode;
    _isInitialDark = _isDark;

    context.read<ChecklistBloc>().add(FetchChecklistTemplatesEvent());
  }

  @override
  Widget build(BuildContext context) {
    final colors = ChecklistColorTheme.of(context);
    final themeProvider = Provider.of<ChecklistThemeProvider>(context);

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
          title: Text('Settings', style: TextStyle(color: colors.primary)),
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          backgroundColor: colors.backgroundPrimary,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Theme',
                      style: TextStyle(
                        color: colors.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 23),
                    Text(
                      'Switch between light and dark themes',
                      style: TextStyle(
                        color: colors.secondary,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: CustomContainerText(
                              isActive: _isDark,
                              onTap: () {
                                if (!_isDark) {
                                  setState(() {
                                    _isDark = !_isDark;
                                  });
                                }
                              },
                              height: 41,
                              text: 'Dark',
                              textStyle: TextStyle(
                                color: colors.secondary,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: CustomContainerText(
                              isActive: !_isDark,
                              onTap: () {
                                if (_isDark) {
                                  setState(() {
                                    _isDark = !_isDark;
                                  });
                                }
                              },
                              height: 41,
                              text: 'Light',
                              textStyle: TextStyle(
                                color: colors.secondary,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    CustomContainerText(
                      isActive: false,
                      onTap: null,
                      height: 114,
                      text: 'Preview Text',
                      textStyle: TextStyle(
                        color: colors.primary,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 16),
                    CustomContainerText(
                      onTap: () {
                          if (!_isDark) {
                            setState(() {
                                _isDark = true;
                            });
                          }
                      },
                      isActive: false,
                      height: 43,
                      text: 'Reset to Default',
                      textStyle: TextStyle(
                        color: colors.primary,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
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
          child: SizedBox(
            width: 163,
            child: CustomButton(
              name: 'Apply',
              onTap: () {
                if (_isInitialDark == _isDark) {
                  return;
                }
                themeProvider.toggleTheme();
              },
              height: 43,
            ),
          ),
        ),
      ),
    );
  }
}
