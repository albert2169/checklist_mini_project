import 'package:checklist_app/theme/colors/checklist_color_theme.dart';
import 'package:flutter/material.dart';

class ChecklistItemCard extends StatelessWidget {
  const ChecklistItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = ChecklistColorTheme.of(context);

    return Container(
      height: 74,
      margin: EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
        color: colors.backgroundSecondary,
        border: BoxBorder.all(),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: GestureDetector(
       //   onTap: () => onCardTap(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
           //       Image.asset(iconAssetLocalPath),
                  const SizedBox(width: 15),
                  Text(
                    'cardName',
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
