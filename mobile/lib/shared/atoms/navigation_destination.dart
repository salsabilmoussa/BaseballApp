import 'package:baseball_cards_app/shared/tokens/app_colors.dart';
import 'package:flutter/material.dart';

class CustomNavigationDestination extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final Color selectedColor;
  final Color unselectedColor;

  const CustomNavigationDestination({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    this.selectedColor = AppColors.primaryColor,
    this.unselectedColor = AppColors.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      icon: Icon(
        icon,
        color: isSelected ? selectedColor : unselectedColor,
      ),
      label: label,
    );
  }
}
