import 'package:checklist_app/theme/colors/checklist_color_theme.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String name;
  final double height;
  final Function? onTap;


  const CustomButton({
    super.key,
    required this.name,
    required this.onTap, required this.height,
  });

  @override
  Widget build(BuildContext context) {
    final colors = ChecklistColorTheme.of(context);
    final gradientColors = [Color(0xFFE8D228), Color(0xFF822D16), Color(0xFFE8D228), Color(0xFF822D16)];

    return GestureDetector(
      onTap: onTap == null ? null : () => onTap!(),
      child: Container(
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(15),),
      
        child: Center( 
          child: Text(
            name,
            textAlign: TextAlign.center, 
            style: TextStyle(color: colors.primary, fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}