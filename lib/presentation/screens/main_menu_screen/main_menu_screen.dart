import 'package:auto_route/auto_route.dart';
import 'package:checklist_app/presentation/router/app_router.gr.dart';
import 'package:checklist_app/presentation/screens/main_menu_screen/widgets/main_menu_bottom_nav_item.dart';
import 'package:checklist_app/presentation/screens/main_menu_screen/widgets/main_menu_card.dart';
import 'package:checklist_app/theme/colors/checklist_color_theme.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({super.key});

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  @override
  Widget build(BuildContext context) {
    final colors = ChecklistColorTheme.of(context);

    return Scaffold(
      backgroundColor: colors.backgroundPrimary,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: colors.backgroundSecondary,
        title: Text(
          'Main Menu',
          style: TextStyle(
            fontFamily: 'Inter',
            color: colors.primary,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                MainMenuCard(
                  cardName: 'Checklists',
                  onCardTap: () => context.router.push(ActiveChecklistsRoute()),
                  iconAssetLocalPath: 'assets/images/checklist.png',
                ),
                MainMenuCard(
                  cardName: 'Templates',
                  onCardTap: () {},
                  iconAssetLocalPath: 'assets/images/template.png',
                ),
                MainMenuCard(
                  cardName: 'Archive',
                  onCardTap: () => context.router.push(ArchiveChecklistRoute()),
                  iconAssetLocalPath: 'assets/images/archive.png',
                ),
                MainMenuCard(
                  cardName: 'Settings',
                  onCardTap: () {},
                  iconAssetLocalPath: 'assets/images/settings.png',
                ),
                MainMenuCard(
                  cardName: 'Help & Support',
                  onCardTap: () {},
                  iconAssetLocalPath: 'assets/images/help_support.png',
                ),
                MainMenuCard(
                  cardName: 'About App',
                  onCardTap: () {},
                  iconAssetLocalPath: 'assets/images/about.png',
                ),
              ],
            ),
          ),

          Container(
            width: double.infinity,
            color: colors.backgroundSecondary,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MainMenuBottomNavItem(
                  onItemTap: () => context.router.push(ActiveChecklistsRoute()),
                  itemName: 'Checklists',
                  itemImageAssets: 'assets/images/checklist.png',
                ),
                MainMenuBottomNavItem(
                  onItemTap: () {},
                  itemName: 'Templates',
                  itemImageAssets: 'assets/images/template.png',
                ),
                MainMenuBottomNavItem(
                  onItemTap: () => context.router.push(ArchiveChecklistRoute()),
                  itemName: 'Archive',
                  itemImageAssets: 'assets/images/archive.png',
                ),
                MainMenuBottomNavItem(
                  onItemTap: () {},
                  itemName: 'Settings',
                  itemImageAssets: 'assets/images/settings.png',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
