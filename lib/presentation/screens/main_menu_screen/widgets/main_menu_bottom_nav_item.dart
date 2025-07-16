import 'package:checklist_app/theme/colors/checklist_color_theme.dart';
import 'package:flutter/material.dart';

class MainMenuBottomNavItem extends StatelessWidget {
  final String itemName;
  final String itemImageAssets;
  final Function onItemTap;

  const MainMenuBottomNavItem({super.key, required this.itemName, required this.itemImageAssets, required this.onItemTap});

  @override
  Widget build(BuildContext context) {
    final colors = ChecklistColorTheme.of(context);

    return GestureDetector(
      onTap: () => onItemTap(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(itemImageAssets, color: colors.secondary),
          SizedBox(height: 10),
          Text(
            itemName,
            style: TextStyle(color: colors.secondary, fontWeight: FontWeight.w400, fontSize: 13),
          ),
        ],
      ),
    );
  }
}
