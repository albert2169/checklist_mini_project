import 'package:checklist_app/theme/colors/checklist_color_theme.dart';
import 'package:flutter/material.dart';

class MainMenuCard extends StatelessWidget {
  final Function onCardTap;
  final String cardName;
  final String iconAssetLocalPath;
  const MainMenuCard({
    super.key,
    required this.onCardTap,
    required this.iconAssetLocalPath,
    required this.cardName,
  });

  @override
  Widget build(BuildContext context) {
    final colors = ChecklistColorTheme.of(context);

    return Container(
      height: 52,
      margin: EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
        color: colors.backgroundSecondary,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: GestureDetector(
          onTap: () => onCardTap(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(iconAssetLocalPath),
                  const SizedBox(width: 15),
                  Text(
                    cardName,
                    style: TextStyle(
                      color: colors.primary,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              Image.asset('assets/images/arrow_forward.png'),
            ],
          ),
        ),
      ),
    );
  }
}
